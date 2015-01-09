/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package default_package;

import model.*;

import java.io.IOException;
import static java.lang.System.out;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.util.Vector;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.DataSource;

/**
 *
 * @author Burgess
 */
public class DbHelper extends HttpServlet {
    private static Connection getConnection() throws ClassNotFoundException,
            SQLException {
        Connection conn = null;
        try {
            Context ctx = new InitialContext();
            // 获取与逻辑名相关联的数据源对象
            DataSource ds = (DataSource) ctx.lookup("java:comp/env/jdbc/j2ee_project");
            conn = ds.getConnection();
       } catch (NamingException e) {
           // TODO Auto-generated catch block
           e.printStackTrace();
       } catch (SQLException e) {
           // TODO Auto-generated catch block
           e.printStackTrace();
       }
        return conn;
    }

    public static List<Question> getList(int category) throws SQLException {
        Connection con = null;
        Statement stmt = null;
        ResultSet rs = null;
        try{
            con = getConnection();
            stmt  = con.createStatement();
            List<Question> list = new ArrayList<Question>();
            String query = "select * from question where question_category_id = " + category;
            rs = stmt.executeQuery(query);
            while(rs.next()){
                Question q = new Question(rs.getInt("id"), rs.getString("title"),rs.getString("option1"),
                        rs.getString("option2"),rs.getString("option3"),
                        rs.getString("option4"),rs.getString("answer"), category , rs.getInt("test_category_id"));
                list.add(q);
            }
            return list;
        }catch(Exception e){out.println(e.getMessage());return null;}
        finally {
            close(con,stmt,rs);
        }
    }

    public static List<Question> getListByPage(int question_category, int test_category_id, int page, int limit) throws SQLException {
        Connection con = null;
        Statement stmt = null;
        ResultSet rs = null;
        try{
            int slid = (page - 1) * limit;
            con = getConnection();
            stmt  = con.createStatement();
            List<Question> list = new ArrayList<Question>();
            String query = "select * from question where question_category_id = "
                    + question_category + " and test_category_id = " + test_category_id + " limit " + slid + ", " + limit;
            rs = stmt.executeQuery(query);
            while(rs.next()){
                Question q = new Question(rs.getInt("id"), rs.getString("title"),rs.getString("option1"),
                        rs.getString("option2"),rs.getString("option3"),
                        rs.getString("option4"),rs.getString("answer"), question_category ,test_category_id);
                list.add(q);
            }
            return list;
        }catch(Exception e){out.println(e.getMessage());return null;}
        finally {
            close(con,stmt,rs);
        }
    }

    public static int getCount(int question_category, int test_category_id) throws SQLException {
        Connection con = null;
        Statement stmt = null;
        ResultSet rs = null;
        try{
            con = getConnection();
            stmt  = con.createStatement();
            String query = "select * from question where question_category_id = " + question_category + " and test_category_id = " + test_category_id;
            rs = stmt.executeQuery(query);
            rs.last();
            return rs.getRow();
        }catch(Exception e){out.println(e.getMessage());return -1;}
        finally {
            close(con,stmt,rs);
        }
    }

    public static Question getSingle(int id) throws SQLException {
        Connection con = null;
        Statement stmt = null;
        ResultSet rs = null;
        try{
            con = getConnection();
            String query;
            stmt = con.createStatement();
           
            query = "select * from question where id = " + id;
            rs = stmt.executeQuery(query);
            while(rs.next())
            {
                return new Question(rs.getInt("id"), rs.getString("title"),rs.getString("option1"),
                    rs.getString("option2"),rs.getString("option3"),rs.getString("option4"),
                        rs.getString("answer"), rs.getInt("question_category_id"), rs.getInt("test_category_id"));
            }
            return null;
        }catch(Exception e){out.println(e.getMessage());return null;}
        finally {
            close(con,stmt,rs);
        }
    }
    
    public static Question getSingle(int id, int category) throws SQLException {
        Connection con = null;
        Statement stmt = null;
        ResultSet rs = null;
        try{
            con = getConnection();
            String query;
            stmt = con.createStatement();
           
            query = "select * from question where id = " + id + " and question_category_id = " + category;
            rs = stmt.executeQuery(query);
            while(rs.next())
            {
                return new Question(rs.getInt("id"), rs.getString("title"),rs.getString("option1"),
                        rs.getString("option2"),rs.getString("option3"),rs.getString("option4"),
                        rs.getString("answer"), category,rs.getInt("test_category_id"));
            }
            return null;
        }catch(Exception e){out.println(e.getMessage());return null;}
        finally {
            close(con,stmt,rs);
        }
    }
    
    public static String getTitleName(int category_id) throws SQLException {
        Connection con = null;
        Statement stmt = null;
        ResultSet rs = null;
        String name = "";
        try{
            con = getConnection();
        
            stmt = con.createStatement();
            String query = "select * from test_category where test_category_id = " + category_id;
            rs = stmt.executeQuery(query);
            while(rs.next())
            {
                name = rs.getString("test_category_name");
                break;
            }
            return name;
        }catch(Exception e){out.println(e.getMessage());return null;}
        finally {
            close(con,stmt,rs);
        }
    }

    public static List<Test_category> getTitleName() throws SQLException {
        Connection con = null;
        Statement stmt = null;
        ResultSet rs = null;
        List<Test_category> test_categories = new ArrayList<Test_category>();
        try{
            con = getConnection();

            stmt = con.createStatement();
            String query = "select * from test_category";
            rs = stmt.executeQuery(query);
            while(rs.next())
            {
                test_categories.add(new Test_category(rs.getInt("test_category_id"), rs.getString("test_category_name")));
            }
            return test_categories;
        }catch(Exception e){out.println(e.getMessage());return null;}
        finally {
            close(con,stmt,rs);
        }
    }
    
    public static Integer[] getIdArray(int category_id, int test_category_id) throws SQLException {
        Connection con = null;
        Statement stmt = null;
        ResultSet rs = null;
        try{
            con = getConnection();

            stmt = con.createStatement();
            String query = "select id from question where question_category_id = " + category_id + " and test_category_id=" + test_category_id;
            rs = stmt.executeQuery(query);
            Vector v = new Vector();
            while(rs.next())
            {
                v.add(rs.getInt("id"));
            }
            Object[] obj = v.toArray();
            
            int len = obj.length;
            Integer integer[] = new Integer[len];
            for (int i = 0; i < obj.length; i++) {
                    integer[i] = (Integer) obj[i];
            }
            return integer;
        }catch(Exception e){out.println(e.getMessage());return null;}
        finally {
            close(con,stmt,rs);
        }
    }

    public static Test getTest(int id) throws SQLException {
        Connection con = null;
        Statement stmt = null;
        ResultSet rs = null;
        Test test = new Test();

        try{
            con = getConnection();
            String query;
            stmt = con.createStatement();
            query = "select * from user_test where id = " + id;
            rs = stmt.executeQuery(query);
            while(rs.next())
            {
                test.setQuestionString(rs.getString("test_questions_id"));
                test.setScores(rs.getInt("score"));
                test.setAnswerString(rs.getString("test_user_answers"));
                test.setTitle(rs.getString("test_title"));
                String[] answers = test.getAnswerString().split(":");
                test.setCommit_answer(answers);
                String[] questions = test.getQuestionString().split(":");
                Question[] que = new Question[20];
                for(int i = 0; i < 20; ++i)
                {
                    que[i] = getSingle(Integer.parseInt(questions[i]));
                }
                test.setQuestions(que);
                break;
            }
            return test;
        }catch(Exception e){out.println(e.getMessage()); return null;}
        finally {
            close(con,stmt,rs);
        }
    }

    public static int getUserCategory(int userId) throws SQLException {
        Connection con = null;
        Statement stmt = null;
        ResultSet rs = null;
        try{
            con = getConnection();
            String query;
            stmt = con.createStatement();
            query = "SELECT user_category FROM user WHERE id = " + userId;
            rs = stmt.executeQuery(query);
            rs.next();
            return rs.getInt("user_category");
        }catch(Exception e){out.println(e.getMessage());}
        finally {
            close(con,stmt,rs);
        }
        return -1;
    }

    public static void Delete(int id) throws SQLException {
        Connection con = null;
        Statement stmt = null;
        ResultSet rs = null;
        try{
            con = getConnection();
            String query;
            stmt = con.createStatement();
            query = "delete from question where id = " + id;
            stmt.executeUpdate(query);
        }catch(Exception e){out.println(e.getMessage());}
        finally {
            close(con,stmt,rs);
        }
    }

    public static void InsertTest(int userId, Test test) throws SQLException {
        Connection con = null;
        Statement stmt = null;
        ResultSet rs = null;
        try{
            con = getConnection();
            String query;
            stmt = con.createStatement();
            query = "INSERT INTO user_test(user_id, test_title, score, test_questions_id, test_user_answers)" +
                    "VALUE('" + userId + "','" + test.getTitle() + "','" + test.getScores() + "','" + test.getQuestionString() +
                    "','" + test.getAnswerString() + "')";
            stmt.executeUpdate(query);
        }catch(Exception e){out.println(e.getMessage());}
        finally {
            close(con,stmt,rs);
        }
    }

    public static void InsertUser(User user) throws SQLException {
        Connection con = null;
        Statement stmt = null;
        ResultSet rs = null;
        try{
            con = getConnection();
            String query;
            stmt = con.createStatement();
            query = "INSERT INTO user(username, name,email,password,gender)" +
                    "VALUE('" + user.getUsername() + "','" + user.getName() + "','" + user.getEmail() + "','" +user.getPassword()+ "','" + user.getGender()+ "')";
            stmt.executeUpdate(query);
        }catch(Exception e){out.println(e.getMessage());}
        finally {
            close(con,stmt,rs);
        }
    }
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Connection con = null;
        Statement stmt = null;
        ResultSet rs = null;
        //获取信息
        req.setCharacterEncoding("UTF-8");
        String title = req.getParameter("title");
        String option1 = req.getParameter("option1");
        String option2 = req.getParameter("option2");
        String option3 = req.getParameter("option3");
        String option4 = req.getParameter("option4");
        String answer = "";
        String[] type1 = req.getParameterValues("answer");   
        for (String type11 : type1) {
            answer += type11 + ",";
        }
        int category_id = Integer.parseInt(req.getParameter("category_id"));
        int test_category_id = Integer.parseInt(req.getParameter("test_category_id"));
        String query;
        try{
            Context ctx = new InitialContext();
                 if(ctx == null )
                 throw new Exception("No Context");
            DataSource ds = (DataSource) ctx.lookup("java:comp/env/jdbc/j2ee_project");
            con = ds.getConnection();
            //插入问题
            stmt = con.createStatement();
            if(req.getParameter("id") == null) {
                query = "insert into question (title, option1, option2, option3, option4, answer, question_category_id, test_category_id) values(" + "'" + title +
                        "','" + option1 + "','" + option2 + "','" + option3 + "','" + option4 + "','" + answer + "','" + category_id + "','" + test_category_id + "')";
            }
            else{
                query = "update question set title = '" + title + "', option1='" + option1 + "', option2='" + option2 + "', option3='" + option3 + "', option4='" + option4 +
                        "',answer='" + answer + "',question_category_id=" + category_id + ", test_category_id=" + test_category_id + " where id = " + req.getParameter("id");
            }
            stmt.executeUpdate(query);
            resp.sendRedirect(req.getContextPath() + "/teacherManage.jsp");
        }catch(Exception e){out.println(e.getMessage());}
        finally {
            try {
                close(con,stmt,rs);
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }

    public static List<UserTest> getUserTest(int userID) throws SQLException {
        Connection con = null;
        Statement stmt = null;
        ResultSet rs = null;
        try{
            con = getConnection();
            String query;
            stmt = con.createStatement();
            query = "SELECT * FROM user_test WHERE user_id = " + userID;
            rs = stmt.executeQuery(query);
            List<UserTest> userTests = new ArrayList<UserTest>();
            while(rs.next())
            {
                userTests.add(new UserTest(rs.getInt("id"), rs.getInt("user_id"), rs.getString("test_title"), rs.getInt("score"), rs.getDate("date")));
            }
            return userTests;
        }catch(Exception e){out.println(e.getMessage()); return null;}
        finally {
            close(con,stmt,rs);
        }
    }

    public static User CheckUser(String username) throws SQLException {
        Connection con = null;
        Statement stmt = null;
        ResultSet rs = null;
        try{
            con = getConnection();
            String query;
            stmt = con.createStatement();
            query = "SELECT * FROM user WHERE username = '" + username + "'";
            rs = stmt.executeQuery(query);

            while(rs.next())
            {
                return new User(rs.getInt("id"), rs.getString("name"),rs.getString("email"), rs.getString("username"), rs.getString("gender"), rs.getString("password"));
            }
            return null;
        }catch(Exception e){out.println(e.getMessage()); return null;}
        finally {
            close(con,stmt,rs);
        }
    }

    private static void close(Connection con, Statement ps, ResultSet rs)
         throws SQLException {
         if (rs != null) {
                 rs.close();
                 rs = null;
             }
         if (ps != null ) {
                 ps.close();
                 ps = null;
             }
         if (con != null) {
                 con.close();
                 con = null;
             }
     }
}