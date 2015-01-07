<%--
  Created by IntelliJ IDEA.
  User: zh
  Date: 2015/1/1
  Time: 16:32
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>登陆界面</title>
  <!-- Bootstrap core CSS -->
  <link href="css/bootstrap.min.css" rel="stylesheet">

  <!-- Custom styles for this template -->
  <link href="css/signin.css" rel="stylesheet">
  <link href="css/templatemo_style.css" rel="stylesheet">
  <link href="css/bootstrap-theme.min.css" rel="stylesheet">
  <script src="js/jquery-2.1.3.js"></script>
  <meta http-equiv="pragma" content="no-cache">
  <meta http-equiv="Cache-Control" content="no-cache">
  <meta http-equiv="expires" content="0">
  <meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
  <!--
  <link rel="stylesheet" type="text/css" href="styles.css">
  -->

</head>
<body>
<%
  String name="";
  if(!session.isNew()){
    name=(String)session.getAttribute("username");
    if(name==null)
      name="";
  }
%>
<div class="container">
  <div class="panel-body">
      <form class="form-signin" role="form" method="post" action="login">
         <% if (request.getAttribute("error")!= null){
             out.println("<h2>" + request.getAttribute("error") + "</h>" );
             }
          %>
          <div class="heading">
            <h2 class="form-signin-heading">Online Test Login</h2>
          </div>
          <div class="control-wrapper">
            <label for="username" class="control-label fa-label"><span class="glyphicon glyphicon-user"></span></label>
            <input type="text" class="form-control" id="username" name="username" value="<%=name%>" placeholder="Username">
          </div>
          <div class="control-wrapper">
            <label for="password" class="control-label fa-label"><span class="glyphicon glyphicon-lock"></span></label>
            <input type="password" class="form-control" name="password" id="password" placeholder="Password">
          </div>
          <div class="checkbox">
            <label>
              <input type="checkbox" value="remember-me"> Remember me
            </label>
            <a href="newuser.jsp" align=right>Not Register？</a>
          </div>
          <input type="submit" style="color:white" class="form-control" value="Login" name="Submit">
      </form>
  </div>

</div> <!-- /container -->
</body>
</html>
