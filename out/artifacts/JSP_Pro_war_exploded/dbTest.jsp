<%--
  Created by IntelliJ IDEA.
  User: Burgess
  Date: 2014/12/27
  Time: 11:38
  To change this template use File | Settings | File Templates.
--%>
<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="javax.naming.Context"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.ResultSet" %>
<html>
<head>
    <title></title>
</head>
<body>
<%
  try{
    Context ctx = new InitialContext();
         if(ctx == null )
         throw new Exception("No Context");
    DataSource ds = (DataSource) ctx.lookup("java:comp/env/jdbc/j2ee_project");
    Connection con = ds.getConnection();
    Statement stmt;
    ResultSet rs;/*
    //加载驱动程序，下面的代码加载MySQL驱动程序
    Class.forName("com.mysql.jdbc.Driver");
    //用适当的驱动程序连接到数据库
    String dbUrl =  "jdbc:mysql://localhost/j2ee_project";
    String dbUser="root";
    String dbPwd="123456";
    //建立数据库连接
    con = java.sql.DriverManager.getConnection(dbUrl,dbUser,dbPwd);*/
    //创建一个SQL声明
    stmt = con.createStatement();
    //增加新记录
    //stmt.executeUpdate("insert into user (id,username,password,email) values('1','Tom','123456','...')");
    //查询记录
    rs = stmt.executeQuery("select id,username,password from user");
    //输出查询结果
    out.println("<table border=1 width=400>");
    while (rs.next()){
      String col1 = rs.getString(1);
      String col2 = rs.getString(2);
      String col3 = rs.getString(3);
      //打印所显示的数据
      out.println("<tr><td>"+col1+"</td><td>"+col2+"</td><td>"+col3+"</td></tr>");
    }
    out.println("</table>");
    //关闭数据库连接
    rs.close();
    stmt.close();
    con.close();
  }catch(Exception e){out.println(e.getMessage());}
%>

</body>
</html>
