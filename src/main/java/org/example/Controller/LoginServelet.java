package org.example.Controller;

import jakarta.annotation.Resource;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import org.example.model.User;
import org.example.model.dao.UserDao;

import javax.sql.DataSource;
import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;

@WebServlet("/LogIn")
public class LoginServelet extends HttpServlet {
    @Resource(name = "java:comp/env/jdbc/pool")
    public DataSource dataSource;

    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        String contex =  request.getContextPath();
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        User user = new User();

        user.setUserName(username);
        user.setPassword(password);

        UserDao userDao = new UserDao();

        try {
            ResultSet rst = userDao.Login(user, dataSource);

            if (rst.next()){
                String role = rst.getString("role");

                HttpSession httpSession = request.getSession();
                httpSession.setAttribute("username", username);
                httpSession.setAttribute("role", role);
                httpSession.setAttribute("id", rst.getString("id"));


                if (role.equals("ADMIN")){
                    response.sendRedirect(contex + "/AdminDashServlet");
                } else if (role.equals("EMPLOYEE")) {
                    response.sendRedirect(contex + "/ComplaintsDashBoardServlet");
                }
            }else {
                request.setAttribute("error", "Invalid username or password.");
                request.getRequestDispatcher("/view/Login.jsp").forward(request, response);
            }
        } catch (SQLException e) {
            e.printStackTrace(); // optional: log error
            request.setAttribute("error", "An internal error occurred. Please try again.");
            request.getRequestDispatcher("/view/Login.jsp").forward(request, response);
        }

    }


}
