<%--
  Created by IntelliJ IDEA.
  User: zh
  Date: 2015/1/2
  Time: 11:55
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>评分</title>
</head>
<body style="background:url(image/bg.jpg);">>
<%
  if(!session.isNew()){
    int scores=Integer.parseInt((String) session.getAttribute("score"));
    if((String) session.getAttribute("score")==null)
     scores=0;
  }
%>
<p>your score is </p>
</body>
</html>
