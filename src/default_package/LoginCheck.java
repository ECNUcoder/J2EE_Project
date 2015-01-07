package default_package;

import model.User;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.SQLException;

/**
 * Created by Burgess on 2015/1/5.
 */
public class LoginCheck extends HttpServlet{
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String username = req.getParameter("username");
        String password = req.getParameter("password");
        User user = null;
        try {
            user = DbHelper.CheckUser(username);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        if (user != null)
        {
            if(password.equals(user.password))
            {
                HttpSession session = req.getSession();
                //存储会话
                session.setAttribute("username",user.username);
                session.setAttribute("userId", user.id);
                req.getRequestDispatcher("/index.jsp").forward(req, resp);

            }
            else {
                req.setAttribute("error","Username or password error");
                req.getRequestDispatcher("/Login.jsp").forward(req, resp);
            }
        }
        req.setAttribute("error","Username or password error");
        req.getRequestDispatcher("/Login.jsp").forward(req, resp);
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        if(session.getAttribute("userId") != null)
        {
            resp.sendRedirect("/index.jsp");
        }
        else{
            resp.sendRedirect("/Login.jsp");
        }
    }
}
