<%-- 
    Document   : test_delete
    Created on : Dec 28, 2014, 12:19:36 AM
    Author     : Burgess
--%>

<%@page import="default_package.DbHelper"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% 
    if(request.getParameter("confirm") != null){
        int id = Integer.parseInt(request.getParameter("id"));
        DbHelper.Delete(id);
        response.sendRedirect(request.getContextPath() + "/teacherManage.jsp");
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
            <div class="col-md-4 col-md-push-4">
                <h1 class="h2 small">确认删除
            <%=request.getParameter("id")%>?</h1>   
                <form role = "form" class="form-horizontal" method = "post" action="test_delete.jsp">
                    <input type="hidden" class="form-control" name="id" value=<%=request.getParameter("id")%> />
                    <input type="hidden" class="form-control" name="id" value=<%=request.getParameter("category")%> />
                    <input type="submit" class="form-control" name="confirm" value="确认" />
                </form>
            </div>
        </div>
    </div>
<%@include file="../footer.jsp"%>
