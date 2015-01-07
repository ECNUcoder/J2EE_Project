<%-- 
    Document   : test_detail
    Created on : Dec 27, 2014, 10:15:18 PM
    Author     : Burgess
--%>

<%@page import="default_package.DbHelper"%>
<%@ page import="model.Question" %>
<%@ page import="java.sql.SQLException" %>
<%@page contentType="text/html" pageEncoding="UTF-8" language="java"%>

<%
    int id = Integer.parseInt(request.getParameter("id"));
    Question question = null;
    try {
        question = DbHelper.getSingle(id);
    } catch (SQLException e) {
        e.printStackTrace();
    }
%>
<%@include file="../header.jsp"%>
        <div id="content">
            <div class="container">
                <%
                    out.println("<div class='row'>");
                        out.println("<b>" + 1 + "、" + question.title + "</b>");
                        out.println("<ol type = 'A'>");
                            for(int i = 0; i < 4; ++i){
                                out.println("<li>" + question.option[i] + "</li>");
                            }
                        out.println("</ol>");
                    out.println("</div>");
                %>
            </div>
        </div>
<%@include file="../footer.jsp"%>