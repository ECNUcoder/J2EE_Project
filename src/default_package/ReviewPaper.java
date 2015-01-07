package default_package;

import model.Test;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.SQLException;

/**
 * Created by Burgess on 2014/12/29.
 */
public class ReviewPaper extends HttpServlet{
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        int id = Integer.parseInt(req.getParameter("id"));
        Test test = null;
        try {
            test = DbHelper.getTest(id);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        session.setAttribute("test", test);
        resp.sendRedirect(req.getContextPath() + "/review.jsp");
    }
}
