package default_package;

import model.User;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.Enumeration;

/**
 * Created by Burgess on 2015/1/4.
 */
public class UserRegister extends HttpServlet{
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Enumeration<String> paraName = req.getParameterNames();
        String[] tmp = new String[7];
        int k = 0;
        while (paraName.hasMoreElements()) {
            tmp[k++] = req.getParameter(paraName.nextElement());
        }
        String name = tmp[0] + tmp[1];
        String email = tmp[2];
        String username = tmp[3];
        String gender = tmp[4];
        String password = tmp[5];
        String password_confirm=tmp[6];
        if(password.equals(password_confirm)){
            User user = new User(name,email,username,gender, password);
            try {
                DbHelper.InsertUser(user);
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        req.getRequestDispatcher("/welcome.jsp").forward(req,resp);
    }
}
