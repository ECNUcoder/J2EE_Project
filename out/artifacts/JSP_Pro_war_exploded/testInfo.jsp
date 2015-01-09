<%@ page import="model.UserTest" %>
<%@ page import="java.util.List" %>
<%@ page import="default_package.DbHelper" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="java.util.Objects" %>
<%--
  Created by IntelliJ IDEA.
  User: Burgess
  Date: 2014/12/30
  Time: 17:40
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
  List<UserTest> userTestsList;
  Object[] obj = null;
  int userID = 0;
  if(session.getAttribute("userId") != null)
  {
      userID = (Integer)session.getAttribute("userId");
  }else{response.sendRedirect("/Login.jsp");}
  try {
    userTestsList = DbHelper.getUserTest(userID);
    obj = userTestsList.toArray();
  } catch (SQLException e) {
    e.printStackTrace();
  }
%>
<%@include file="header.jsp"%>
  <div id="content">
      <div class="container">
        <div class="row">
          <div class="row">
            <div class = "col-md-4">
              <b>Title</b>
            </div>
            <div class = "col-md-4">
              <b>Date</b>
            </div>
            <div class = "col-md-2">
              <b>Scores</b>
            </div>
          </div>
        </div>
        <% if(obj != null){
              for(Object object :obj){ %>
        <div class="row">
          <div class = "col-md-4">
            <%=((UserTest)object).getTestTitle()%>
          </div>
          <div class = "col-md-4">
            <%=((UserTest)object).getDate().toString()%>
          </div>
          <div class = "col-md-2">
            <%=((UserTest)object).getScore()%>
          </div>
          <div class = "col-md-2">
            <a href=<%out.print("review?id=" + ((UserTest)object).getId());%>>查看试卷</a>
          </div>
        </div>
        <%}
        }%>
      </div>
    </div>
<%@include file="footer.jsp"%>
