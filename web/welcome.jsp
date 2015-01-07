<%--
  Created by IntelliJ IDEA.
  User: zh
  Date: 2015/1/2
  Time: 17:47
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>登陆成功</title>
    <meta http-equiv="pragma" content="no-cache">
    <meta http-equiv="cache-control" content="no-cache">
    <meta http-equiv="expires" content="0">
    <meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
    <meta http-equiv="description" content="This is my page">
    <meta name="description" content="Examples for creative website header animations using Canvas and JavaScript" />
    <meta name="keywords" content="header, canvas, animated, creative, inspiration, javascript" />
    <link rel="stylesheet" type="text/css" href="css/normalize.css" />
    <link rel="stylesheet" type="text/css" href="css/demo.css" />
    <link rel="stylesheet" type="text/css" href="css/component.css" />
</head>
<body>
  <%
    String name=new String(request.getParameter("username").getBytes("ISO-8859-1"),"utf-8");
    if(name==null)
      session.setAttribute("username",name);
  %>
  <a href="Login.jsp">注销</a>&nbsp;&nbsp;&nbsp;
  <p align="center" style="color:black" ><%=name%> ，欢迎登陆</P>
  <div class="container demo-4">
    <div class="content">
      <div id="large-header" class="large-header">
        <canvas id="demo-canvas"></canvas>
      </div>
    </div>
  </div><!-- /container -->
  <script src="js/rAF.js"></script>
  <script src="js/demo-4.js"></script>

</body>
</html>
