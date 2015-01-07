<%@ page import="model.Question" %>
<%@ page import="model.Test" %>
<%@ page import="java.sql.SQLException" %>
<%--
  Created by IntelliJ IDEA.
  User: Burgess
  Date: 2014/12/28
  Time: 17:37
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<% Test test = new Test();
  try {
    test.createTest(1);
  } catch (SQLException e) {
    e.printStackTrace();
  }
  int k = 1;
  session.setAttribute("test", test);
%>
<%@include file="header.jsp"%>
<div id="content">
  <div class="container">
    <form method="post" action="check" role="form">
        <%
          Question[] questions = test.getQuestions();
          out.println("<h2 class='text-center'>" + test.getTitle() +"</h2>");
          for(Question question: questions) {
            out.println("<div class='row'>");
            out.println("<b>" + (k+1) + "、" + question.title + "</b>");
            if(question.category == 1) {
              for(int m = 1; m <= 4; ++m)
              {
                out.println("<div class='radio'>\n <label>\n" +
                        "<input type='radio' name = answer[" + k +"] value=" + m +" >\n A、" + question.option[m - 1] + "  </label>\n</div>");
              }
            }
            else
            {
              for(int m = 1; m <= 4; ++m)
              {
                out.println("<div class='checkbox'>\n <label>\n" +
                        "<input type='checkbox' name = answer[" + k +"] value=" + m +" >\n A、" + question.option[m - 1] + "  </label>\n</div>");
              }
            }
            out.println("</div>");
            ++k;
          }
        %>
        <input type="submit" class = "form-control" value="提交">
    </form>
  </div>
</div>
<%@include file="footer.jsp"%>