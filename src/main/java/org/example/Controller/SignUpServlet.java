package org.example.Controller;

import jakarta.annotation.Resource;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.example.model.User;
import org.example.model.dao.UserDao;

import javax.sql.DataSource;
import java.io.IOException;
import java.sql.SQLException;
import java.util.UUID;

@WebServlet("/SignUpServlet")
public class SignUpServlet extends HttpServlet {
    @Resource(name = "java:comp/env/jdbc/pool")
    private DataSource dataSource;

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String context = req.getContextPath();

        String username = req.getParameter("username");
        String password = req.getParameter("password");
        String role = req.getParameter("role");

        User user = new User();
        user.setId(UUID.randomUUID().toString());
        user.setUserName(username);
        user.setPassword(password);
        user.setRole(role);

        UserDao userDao = new UserDao();


        try {
            int rep = userDao.insertUser(user, dataSource);

            if (rep > 0) {
                resp.sendRedirect(context + "/view/Login.jsp");
            }else {
                req.setAttribute("error", "Invalid username or password.");
                req.getRequestDispatcher("/view/Login.jsp").forward(req, resp);
            }

        } catch (SQLException e) {
            if (e.getMessage().contains("Duplicate")) {
                req.setAttribute("error", "Username already exists.");
            } else {
                req.setAttribute("error", "An error occurred. Please try again.");
            }
            req.getRequestDispatcher("/view/SignUP.jsp").forward(req, resp);
        }

    }
}
