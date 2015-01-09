<%@ page import="default_package.DbHelper" %>
<%@ page import="model.Test_category" %>
<%@ page import="java.util.List" %>
<%--
  Created by IntelliJ IDEA.
  User: Burgess
  Date: 2014/12/26
  Time: 19:57
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<% List<Test_category> test_categories = DbHelper.getTitleName();%>
<%@include file="header.jsp"%>

<style>
    .carousel .item{
        height:500px;
        background-color: #000;
    }
    .carousel img{
        width:100%;
    }
</style>
<script type="text/javascript">

    function disptime()
    {
        var time =new Date();
        var hour =time.getHours();
        var minute=time.getMinutes();
        var second=time.getSeconds();
        var apm="AM";
        if(hour>12)
        {
            hour=hour-12;
            apm="PM";
        }
        if(minute<10)
        {
            minute="0"+minute;
        }
        if(second<10)
        {
            second="0"+second;
        }
        document.testtype.myclock.value=hour+":"+minute+":"+second+" "+apm;
        var mytime=setTimeout("disptime()",1000);
    }
</script>
<body onload="disptime()">
<div id="content">
    <div class="container">
        <div class="row">
            <form id="testtype" method="post" action="CreateTest.jsp" name="testtype" class="form-horizontal" role="form">
                <div class="form-group col-md-5">
                    <label for="test_category_id" class="control-label" >选择科目：</label>
                    <select name="test_category_id" class="form-control" id="test_category_id">
                        <%
                            for(Test_category test_category : test_categories) {
                                out.println("<option value=" + test_category.id + ">" + test_category.name + "</option>");
                            }
                        %>
                    </select>
                </div>
                <div class="form-group col-md-1 ">
                    <label for="test_category_id" class="control-label" >.</label>
                    <input type="submit" class="form-control" id="submit" value="Go!">
                </div>
                <div class="form-group col-md-4 col-md-push-1 ">
                    <label for="myclock" class="control-label">当前时间：</label>
                    <input id="myclock" name="myclock" type="text" class="form-control" value="" disabled>
                </div>
            </form>
        </div>

        <div class="row">
            <!-- 图片轮播 -->
            <div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
                <!-- Indicators -->
                <ol class="carousel-indicators">
                    <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
                    <li data-target="#carousel-example-generic" data-slide-to="1"></li>
                    <li data-target="#carousel-example-generic" data-slide-to="2"></li>
                </ol>

                <!-- Wrapper for slides -->
                <div class="carousel-inner" role="listbox">
                    <div class="item active">
                        <img src="image/1.jpg" alt="...">
                        <div class="carousel-caption">
                            Just do it!
                        </div>
                    </div>
                    <div class="item">
                        <img src="image/6.jpg" alt="...">
                        <div class="carousel-caption">
                           welcome!
                        </div>
                    </div>
                    <div class="item">
                        <img src="image/5.jpg" alt="...">
                        <div class="carousel-caption">
                            You can make it!
                        </div>
                    </div>
                </div>

                <!-- Controls -->
                <a class="left carousel-control" href="#carousel-example-generic" role="button" data-slide="prev">
                    <span class="glyphicon glyphicon-chevron-left"></span>
                    <span class="sr-only">Previous</span>
                </a>
                <a class="right carousel-control" href="#carousel-example-generic" role="button" data-slide="next">
                    <span class="glyphicon glyphicon-chevron-right"></span>
                    <span class="sr-only">Next</span>
                </a>
            </div>
        </div>
    </div>
</div>
<script src="js/jquery.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<script type="text/javascript">
    $(document).ready(function(){
        $("#bs-example-navbar-collapse-1 .dropdown-menu a").click(function(){
            var href=$(this).attr("href");
            $("#tab-list a[href='"+href+"']").tab("show");
        });
    });
</script>
<%@include file="footer.jsp"%>