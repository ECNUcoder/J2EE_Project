<%--
  Created by IntelliJ IDEA.
  User: Burgess
  Date: 2015/1/8
  Time: 13:15
  To change this template use File | Settings | File Templates.
--%>
<%@page import="default_package.DbHelper"%>
<%@ page import="model.Question" %>
<%@ page import="java.util.List" %>
<%@ page import="model.Test_category" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:useBean id="info" class="default_package.teacherManage" scope="session" />
<% List<Test_category> test_categories = DbHelper.getTitleName();%>
<%
  info.setPages((request.getParameter("pages") == null) ? 1 : Integer.parseInt(request.getParameter("pages")));
  info.setQuesCateId((request.getParameter("questionCateId") == null) ?
          ((info.getQuesCateId() == 0) ? 1 : info.getQuesCateId()) : Integer.parseInt(request.getParameter("questionCateId")));
  info.setTestCateId((request.getParameter("testCateId") == null) ? ((info.getTestCateId() == 0) ? 1 : info.getTestCateId()) : Integer.parseInt(request.getParameter("testCateId")));
  info.setCount((DbHelper.getCount(info.getQuesCateId(), info.getTestCateId()) / 10 + 1));
%>
<%@include file="header.jsp"%>
<style>  div.wid{white-space:nowrap; text-overflow:ellipsis; -o-text-overflow:ellipsis; overflow: hidden; }</style>

<div id="content">
    <div class="container">
        <div class="row">
            <a href="dbHelper/test_create.jsp">New Question</a>
        </div>
        <div class="row">
            <form class="" action="teacherManage.jsp" method="get">
                <span class="form-group  col-md-4">
                    <select class="form-control" name="testCateId">
                        <%
                            for(Test_category test_category : test_categories) {
                                out.println("<option value=" + test_category.id + ">" + test_category.name + "</option>");
                            }
                        %>
                    </select>
                </span>
                <span class="form-group  col-md-4">
                    <select class="form-control" name="questionCateId">
                      <option value="1" <%=((info.getQuesCateId()==1) ? "selected": "")%>>单选</option>
                      <option value="2" <%=((info.getQuesCateId()==2) ? "selected": "")%>>多选</option>
                    </select>
                </span>
               <span class="form-group  col-md-2">
                    <input type="submit" class="form-control" value="Go!"/>
                </span>
            </form>
        </div>

        <div class="row">
              <%
                int k = 0;
                List<Question> list = DbHelper.getListByPage(info.getQuesCateId(), info.getTestCateId(), info.getPages(), 10);
                  for (Question aList : list) {
                      ++k;
                      int id = aList.title_id;%>
                <div class = "col-md-6 wid">
                    <b><%=(k + (info.getPages() - 1) * 10)%>、<%=aList.title%></b>
                </div>
                <div class = "col-md-2">
                    <a href='dbHelper/test_detail.jsp?id=<%=id%>'>Detail</a>
                </div>
                <div class = "col-md-2">
                    <a href='dbHelper/test_edit.jsp?id=<%=id%>'>Edit</a>
                </div>
                <div class = "col-md-2">
                    <a href='dbHelper/test_delete.jsp?id=<%=id%>'>Delete</a><br />
                </div>
            <%}%>
        </div>

        <div class="row">
            <ul class="pagination">
                  <% if(info.getPages() != 1){%>
                  <li><a href="teacherManage.jsp?pages=<%=(info.getPages() - 1)%>">&laquo;</a></li>
                  <%}%>
                  <% for(int i = 1; i <= info.getCount(); ++i){%>
                  <li><a href="teacherManage.jsp?pages=<%=i%>"><%=i%></a></li>
                  <%}%>
                  <% if (info.getPages() != info.getCount()){%>
                  <li><a href="teacherManage.jsp?pages=<%=(info.getPages() + 1)%>">&raquo;</a></li>
                  <%}%>
            </ul>
        </div>
      </div> <!-- /container -->

    </div> <!-- /content -->
<div> <!--/pictures  -->

</div>

<%@include file="footer.jsp"%>