<%@ page import="java.util.List" %>
<%@ page import="default_package.DbHelper" %>
<%@ page import="model.Test_category" %>
<%--
    Document   : test_create
    Created on : Dec 27, 2014, 7:24:25 PM
    Author     : Burgess
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% List<Test_category> test_categories = DbHelper.getTitleName();%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8" />
    <title>Dashboard - Bootstrap Admin</title>

    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
    <meta name="apple-mobile-web-app-capable" content="yes" />
    <link href="../css/bootstrap.min.css" rel="stylesheet" />
    <link href="../css/bootstrap-responsive.min.css" rel="stylesheet" />

    <link href="../css/font-awesome.css" rel="stylesheet" />

    <link href="../css/adminia.css" rel="stylesheet" />
    <link href="../css/adminia-responsive.css" rel="stylesheet" />

    <link href="../css/pages/dashboard.css" rel="stylesheet" />

    <!-- Le HTML5 shim, for IE6-8 support of HTML5 elements -->
    <!--[if lt IE 9]>
    <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
    <![endif]-->
    <script type="text/javascript">
        function Change()
        {
            var value = document.getElementById('category_id').value;
            if(value == "1"){
                document.getElementById('div1').style.display = "";
                document.getElementById('div2').style.display = "none";
            }
            else{
                document.getElementById('div2').style.display = "";
                document.getElementById('div1').style.display = "none";
            }
        }
    </script>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
</head>

<body onload="Change()">
<nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
    <div class="container">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="#">Project name</a>
        </div>
        <div id="navbar" class="collapse navbar-collapse">
            <ul class="nav navbar-nav">
                <li class="active"><a href="#">Home</a></li>
                <li><a href="#about">About</a></li>
                <li><a href="#contact">Contact</a></li>
            </ul>
        </div><!--/.nav-collapse -->
    </div>
</nav>

<div id="content">
    <div class="container">
        <div class="col-md-6 col-md-push-3">
            <form action="../db" method="post" role ="form">
                <div class="form-group">
                    <label for="category_id" class="col-sm-2 control-label">Category</label>
                    <div class="col-sm-10">
                        <select onchange = "Change()" name="category_id"  id="category_id" class = "form-control" data-val-required="字段是必需的。">
                                <option value="1">单选</option>
                                <option value="2">多选</option>
                        </select>
                    </div>
                </div>
                <div class="form-group">
                    <label for="category_id" class="col-sm-2 control-label">Test </label>
                    <div class="col-sm-10">
                        <select  name="test_category_id"  id="test_category_id" class = "form-control" data-val-required="字段是必需的。">
                                <%
                                    for(Test_category test_category : test_categories) {
                                        out.println("<option value=" + test_category.id + ">" + test_category.name + "</option>");
                                    }
                                %>
                        </select>
                    </div>
                </div>
                <div class="form-group">
                    <label for="title" class="col-sm-2 control-label">Title</label>
                    <div class="col-sm-10">
                        <input type="text" id = "title" name="title" class="form-control"/>
                    </div>
                </div>

                <div class="form-group">
                    <label for="option1" class="col-sm-2 control-label">A</label>
                    <div class="col-sm-10">
                        <input type="text" id = "option1" name = "option1" class="form-control" >
                    </div>
                </div>

                <div class="form-group">
                    <label for="option2" class="col-sm-2 control-label">B</label>
                    <div class="col-sm-10">
                        <input type="text" id = "option2" name = "option2" class="form-control" >
                    </div>
                </div>

                <div class="form-group">
                    <label for="option3" class="col-sm-2 control-label">C</label>
                    <div class="col-sm-10">
                        <input type="text" id = "option3" name = "option3" class="form-control" >
                    </div>
                </div>

                <div class="form-group">
                    <label for="option4" class="col-sm-2 control-label">D</label>
                    <div class="col-sm-10">
                        <input type="text" id = "option4" name = "option4" class="form-control" >
                    </div>
                </div>
                <div class="form-group" id = "div1">
                    <label  class="col-sm-2 control-label">Answer</label>
                    <input type="radio" name="answer" value="1" />A
                    <input type="radio" name="answer" value="2" />B
                    <input type="radio" name="answer" value="3" />C
                    <input type="radio" name="answer" value="4" />D
                </div>
                
                <div class="form-group" id = "div2">
                    <label  class="col-sm-2 control-label">Answer</label>
                    <input type="checkbox" name="answer" value="1" /> A
                    <input type="checkbox" name="answer" value="2" />B
                    <input type="checkbox" name="answer" value="3" />C
                    <input type="checkbox" name="answer" value="4" />D
                </div>

                <div class="form-group">
                    <div class="col-sm-10 col-sm-push-2">
                        <input type="submit" value="Submit" class="form-control"/>
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>
<%@include file="../footer.jsp"%>
