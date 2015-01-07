<%--
  Created by IntelliJ IDEA.
  User: Burgess
  Date: 2014/12/26
  Time: 19:57
  To change this template use File | Settings | File Templates.
--%>
<%@page import="default_package.DbHelper"%>
<%@ page import="model.Question" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%@include file="header.jsp"%>
    <div id="content">
        <div class="container">
            <a href="dbHelper/test_create.jsp">Create</a>
            <a href="CreateTest.jsp">CreateTest</a>
            <a href="review?id=1">Review</a>
            <div>
                <%
                    List<Question> list = DbHelper.getList(1);
                    Question question;
                    for (Question aList : list) {
                        question = aList;
                        int id = question.title_id;
                        out.print(question.title);
                        out.print("<a href='dbHelper/test_detail.jsp?id=" + id + "'>Detail</a>");
                        out.print("<a href='dbHelper/test_delete.jsp?id=" + id + "'>Delete</a><br />");
                    }
                    list = DbHelper.getList(2);
                    for (Question aList : list) {
                        question = aList;
                        int id = question.title_id;
                        out.print(question.title);
                        out.print("<a href='dbHelper/test_detail.jsp?id=" + id + "'>Detail</a>");
                        out.print("<a href='dbHelper/test_delete.jsp?id=" + id + "'>Delete</a><br />");
                    }
                %>
            </div>
        </div> <!-- /container -->
    </div> <!-- /content -->

<%@include file="footer.jsp"%>