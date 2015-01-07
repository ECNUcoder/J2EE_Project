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
        response.sendRedirect(request.getContextPath() + "/index.jsp");
    }
%>
<%@include file="../header.jsp"%>
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
