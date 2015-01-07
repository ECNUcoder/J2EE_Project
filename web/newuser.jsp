<%--
  Created by IntelliJ IDEA.
  User: zh
  Date: 2015/1/2
  Time: 17:32
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>注册界面</title>
  <meta http-equiv="pragma" content="no-cache">
  <meta http-equiv="cache-control" content="no-cache">
  <meta http-equiv="expires" content="0">
  <meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
  <meta http-equiv="description" content="This is my page">
  <!--
  <link rel="stylesheet" type="text/css" href="styles.css">
  -->
  <script src="js/jquery-2.1.3.js"></script>
  <meta name="keywords" content="" />
  <meta name="description" content="" />
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css">
  <link href="css/bootstrap-theme.min.css" rel="stylesheet" type="text/css">
  <link href="css/templatemo_style.css" rel="stylesheet" type="text/css">
</head>
<body class="templatemo-bg-gray">
  <h1 class="margin-bottom-15">Online Test Register</h1>
  <%
    String name="";
    if(!session.isNew()){
      name=(String)session.getAttribute("username");
      if(name==null)
        name="";
    }
  %>
  <div class="container"><div class="col-md-12">
    <form class="form-horizontal templatemo-create-account templatemo-container" role="form" action="register" method="post">
      <div class="form-inner">
        <div class="form-group">
          <div class="col-md-6">
            <label for="first_name" class="control-label">First Name</label>
            <input type="text" name = "first_name" class="form-control" id="first_name" placeholder="">
          </div>
          <div class="col-md-6">
            <label for="last_name" class="control-label">Last Name</label>
            <input type="text" name = "last_name" class="form-control" id="last_name" placeholder="">
          </div>
        </div>
        <div class="form-group">
          <div class="col-md-12">
            <label for="email" class="control-label">Email</label>
            <input type="email" name="email" class="form-control" id="email" placeholder="">
          </div>
        </div>
        <div class="form-group">
          <div class="col-md-6">
            <label for="username" class="control-label">UserName</label>
            <input type="text" class="form-control" id="username" name="username" value="<%=name%>" placeholder="">
          </div>
          <div class="col-md-6 templatemo-radio-group">
            <label class="radio-inline">
              <input type="radio" name="optionsRadios" id="optionsRadios1" value="1"> Male
            </label>
            <label class="radio-inline">
              <input type="radio" name="optionsRadios" id="optionsRadios1" value="2"> Female
            </label>
            <label class="radio-inline">
              <input type="radio" name="optionsRadios" id="optionsRadios1" value="3"> Others
            </label>
          </div>
        </div>
        <div class="form-group">
          <div class="col-md-6">
            <label for="password" class="control-label">Password</label>
            <input type="password" class="form-control" name= "password" id="password" placeholder="">
          </div>
          <div class="col-md-6">
            <label for="password" class="control-label">Confirm Password</label>
            <input type="password" class="form-control" name= "password_confirm" id="password_confirm" placeholder="">
          </div>
        </div>
        <div class="form-group">
          <div class="col-md-12">
            <input type="submit" value="Register" class="btn btn-info">
            <a href="Login.jsp" class="pull-right">Login</a>
          </div>
        </div>
      </div>
    </form>
    </div>
  </div>
</body>
</html>
