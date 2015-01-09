<%--
  Created by IntelliJ IDEA.
  User: Burgess
  Date: 2014/12/31
  Time: 0:04
  To change this template use File | Settings | File Templates.
--%>
<html>
<head>
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <meta charset="UTF-8">
  <title>Online Test</title>

  <!-- Bootstrap core CSS -->
  <link href="./css/bootstrap.min.css" rel="stylesheet">

  <link href="./css/adminia.css" rel="stylesheet" />
  <link href="./css/adminia-responsive.css" rel="stylesheet" />
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
      <a class="navbar-brand" href="index.jsp">Online Test</a>
    </div>
    <div id="navbar" class="collapse navbar-collapse">
      <ul class="nav navbar-nav navbar-right">
        <% if (session.getAttribute("userId") == null){%>
        <li class="active"><a href="Login.jsp">Login</a></li>
        <li><a href="newuser.jsp">Register</a></li>
       <%}else{%>
        <li class="active"><a href="userCate"><%=session.getAttribute("username")%></a></li>
        <li><a href="logout">Logout</a></li>
        <%}%>
      </ul>
    </div><!--/.nav-collapse -->
  </div>
</nav>