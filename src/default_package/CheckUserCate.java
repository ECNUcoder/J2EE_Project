package default_package;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.SQLException;

/**
 * Created by Burgess on 2015/1/8.
 */
public class CheckUserCate extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        int category = -1;
        if(session.getAttribute("userId") != null)
        {
            int id = (Integer)session.getAttribute("userId");
            try {
                category = DbHelper.getUserCategory(id);
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        if(category == 2)
        {
            resp.sendRedirect("teacherManage.jsp");
        }
        else if(category == 1)
        {
            resp.sendRedirect("/testInfo.jsp");
        }
        else{
            session.setAttribute("error","用户未登录或用户信息错误，有问题请联系网站管理员");
            resp.sendRedirect("/Login.jsp");
        }
    }
}
