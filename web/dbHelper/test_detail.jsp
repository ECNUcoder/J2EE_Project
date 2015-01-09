<%-- 
    Document   : test_detail
    Created on : Dec 27, 2014, 10:15:18 PM
    Author     : Burgess
--%>

<%@page import="default_package.DbHelper"%>
<%@ page import="model.Question" %>
<%@ page import="java.sql.SQLException" %>
<%@page contentType="text/html" pageEncoding="UTF-8" language="java"%>

<%
    int id = Integer.parseInt(request.getParameter("id"));
    Question question = null;
    try {
        question = DbHelper.getSingle(id);
    } catch (SQLException e) {
        e.printStackTrace();
    }
%>
<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta charset="UTF-8">
    <title>Starter Template for Bootstrap</title>

    <!-- Bootstrap core CSS -->
    <link href="../css/bootstrap.min.css" rel="stylesheet">

    <link href="../css/adminia.css" rel="stylesheet" />
    <link href="../css/adminia-responsive.css" rel="stylesheet" />
</head>

<body>
<nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
    <div class="container">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="../index.jsp">Online Test</a>
        </div>
        <div id="navbar" class="collapse navbar-collapse">
            <ul class="nav navbar-nav navbar-right">
                <% if (session.getAttribute("userId") == null){%>
                <li class="active"><a href="../Login.jsp">Login</a></li>
                <li><a href="../newuser.jsp">Register</a></li>
                <%}else{%>
                <li class="active"><a href="userCate"><%=session.getAttribute("username")%></a></li>
                <li><a href="logout">Logout</a></li>
                <%}%>
            </ul>
        </div><!--/.nav-collapse -->
    </div>
</nav>
        <div id="content">
            <div class="container">
                <%
                    out.println("<div class='row'>");
                        out.println("<b>" + 1 + "、" + question.title + "</b>");
                        out.println("<ol type = 'A'>");
                            for(int i = 0; i < 4; ++i){
                                out.println("<li>" + question.option[i] + "</li>");
                            }
                        out.println("</ol>");
                    out.println("</div>");
                %>
                <div class="row">
                    <a href="../teacherManage.jsp" class="">&laquo; Back to list</a>
                </div>
            </div>
        </div>
<%@include file="../footer.jsp"%>