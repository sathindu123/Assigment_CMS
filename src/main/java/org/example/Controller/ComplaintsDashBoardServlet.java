package org.example.Controller;

import jakarta.annotation.Resource;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import org.example.model.Complains;
import org.example.model.dao.ComplainsDao;


import javax.sql.DataSource;
import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

@WebServlet("/ComplaintsDashBoardServlet")
public class ComplaintsDashBoardServlet extends HttpServlet {

    @Resource(name = "java:comp/env/jdbc/pool")
    private DataSource dataSource;

    String userId = "";

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        String contextPath = req.getContextPath();

        HttpSession session1 = req.getSession(false);
        if (session1 == null || session1.getAttribute("id") == null) {
            resp.sendRedirect(contextPath + "/view/Login.jsp");
            return;
        }
        userId = (String) session1.getAttribute("id");


        ComplainsDao complainsDao = new ComplainsDao();
        try {
            ResultSet allComplains = complainsDao.getAllComplains(userId, dataSource);
            List<Complains> complainsList = new ArrayList<>();


            while (allComplains.next()) {
                Complains complains = new Complains();
                complains.setComplainId(allComplains.getString("id"));
                complains.setUserId(allComplains.getString("user_id"));
                complains.setDescription(allComplains.getString("description"));
                complains.setStatus(allComplains.getString("status"));
                complains.setRemarks(allComplains.getString("remarks"));
                complains.setCreatedDate(allComplains.getTimestamp("created_at"));
                complainsList.add(complains);
            }

            ResultSet allComplainsAdmin = complainsDao.getAllComplainsAdmin(dataSource);
            List<Complains> complainsList1 = new ArrayList<>();

            while (allComplainsAdmin.next()) {
                Complains complains = new Complains();
                complains.setComplainId(allComplainsAdmin.getString("id"));
                complains.setUserId(allComplainsAdmin.getString("user_id"));
                complains.setDescription(allComplainsAdmin.getString("description"));
                complains.setStatus(allComplainsAdmin.getString("status"));
                complains.setRemarks(allComplainsAdmin.getString("remarks"));
                complains.setCreatedDate(allComplainsAdmin.getTimestamp("created_at"));
                complainsList1.add(complains);
            }

            req.setAttribute("complainsList", complainsList);
            req.setAttribute("complainsList1", complainsList1);
            req.getRequestDispatcher("/view/ComplaintDash.jsp").forward(req, resp);

        } catch (Exception e) {
            req.setAttribute("errorMessage", "Internal server error!");
            req.setAttribute("redirectTo", "/view/ComplaintDash.jsp");
            throw new RuntimeException(e);
        }

    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String id = req.getParameter("complaintId");
        String description = req.getParameter("description");
        String status = req.getParameter("status");
        String remark = req.getParameter("remark");

        ComplainsDao complainsDao = new ComplainsDao();

        if (req.getParameter("action").equals("update")) {
            System.out.println("update");

            Complains complains = new Complains();
            complains.setComplainId(id);
            complains.setDescription(description);
            complains.setStatus(status);
            complains.setUserId(userId);
            complains.setRemarks(remark);

            try {
                if (!FinishStatus(id)) {
                    int i = complainsDao.updateComplains(complains, dataSource);

                    if (i > 0) {
                        req.setAttribute("successMessage", "Complain updated successfully!");
                        req.setAttribute("redirectTo", "/ComplaintsDashBoardServlet");
                        req.getRequestDispatcher("/view/Notification.jsp").forward(req, resp);
                    }
                }else {
                    req.setAttribute("infoMessage", "You can't update this resolved complain!");
                    req.setAttribute("redirectTo", "/ComplaintsDashBoardServlet");
                    req.getRequestDispatcher("/view/Notification.jsp").forward(req, resp);
                }

            } catch (Exception e) {
                req.setAttribute("errorMessage", "Internal server error!");
                req.setAttribute("redirectTo", "/view/ComplaintDash.jsp");
                req.getRequestDispatcher("/view/Notification.jsp").forward(req, resp);
                throw new RuntimeException(e);
            }

        } else if (req.getParameter("action").equals("delete")) {

            try {
                if (!FinishStatus(id)) {
                    int i = complainsDao.deleteComplains(id, dataSource);

                    if (i > 0) {
                        req.setAttribute("successMessage", "Complain deleted successfully!");
                        req.setAttribute("redirectTo", "/ComplaintsDashBoardServlet");
                        req.getRequestDispatcher("/view/Notification.jsp").forward(req, resp);
                    }
                }else {
                    req.setAttribute("infoMessage", "You can't delete this resolved complain!");
                    req.setAttribute("redirectTo", "/ComplaintsDashBoardServlet");
                    req.getRequestDispatcher("/view/Notification.jsp").forward(req, resp);
                }
            } catch (Exception e) {
                req.setAttribute("errorMessage", "Internal server error!");
                req.setAttribute("redirectTo", "/view/ComplaintDash.jsp");
                req.getRequestDispatcher("/view/Notification.jsp").forward(req, resp);
                throw new RuntimeException(e);
            }

        } else if (req.getParameter("action").equals("save")) {
            Complains complains = new Complains();
            complains.setComplainId(id);
            complains.setDescription(description);
            complains.setStatus(status);
            complains.setUserId(userId);
            complains.setRemarks(remark);

            try {
                int i = complainsDao.saveComplains(complains, dataSource);
                if (i > 0) {
                    req.setAttribute("successMessage", "Complain saved successfully!");
                    req.setAttribute("redirectTo", "/ComplaintsDashBoardServlet");
                    req.getRequestDispatcher("/view/Notification.jsp").forward(req, resp);
                }
            } catch (Exception e) {
                req.setAttribute("errorMessage", "Internal server error!");
                req.setAttribute("redirectTo", "/view/ComplaintDash.jsp");
                req.getRequestDispatcher("/view/Notification.jsp").forward(req, resp);
                throw new RuntimeException(e);
            }

        } else if (req.getParameter("action").equals("logout")) {
            HttpSession session = req.getSession(false);
            if (session != null) {
                session.invalidate();
            }
            resp.sendRedirect(req.getContextPath() + "/view/Login.jsp");

        }
    }


    private boolean FinishStatus(String id) throws SQLException {
        ComplainsDao complainsDao = new ComplainsDao();
        ResultSet rst = complainsDao.FinishStatus(id,dataSource);

        String st = "";
        while (rst.next()){
            st = rst.getString("status");
        }

        if (st.equals("Resolved")){
            return true;
        }else {
            return false;
        }

    }


}
