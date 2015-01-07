<%@ page import="model.Question" %>
<%@ page import="model.Test" %>
<%--
  Created by IntelliJ IDEA.
  User: Burgess
  Date: 2014/12/29
  Time: 15:10
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
  model.Test test = (model.Test)session.getAttribute("test");
%>
<%@include file="header.jsp"%>
<style>
  .error{
    color: red;
    font-size: medium;
    font-style: italic;
  }
</style>
<div id="content">
    <div class="container">
      <form method="post" action="CheckAnswer" role="form">
        <%
          model.Question[] questions = test.getQuestions();
          String ans = test.getAnswerString();
          String answers[] = ans.split(":");
          int i = 0;
          int k = 0;
          out.println("<h2 class='text-center'>" + test.getTitle() +"</h2>");
          for(model.Question question: questions) {
            out.println("<div class='row'>");
            out.println("<b>" + k + "、" + question.title + "</b>");
            String[] answerCommit = answers[i].split(",");
            String[] answer = question.answer.split(",");

            boolean[] flag = new boolean[4];
            boolean[] errorFlag = new boolean[4];
            for(int j = 0; j < 4; ++j){
              if(j < answer.length)
              {
                flag[Integer.parseInt(answer[j]) - 1] = true;
              }
              if(j < answerCommit.length && j < answer.length &&
                      Integer.parseInt(answer[j]) != Integer.parseInt(answerCommit[j]))
              {
                errorFlag[Integer.parseInt(answerCommit[j]) - 1] = true;
              }
            }
            if(question.category == 1) {
              for(int m = 1; m <= 4; ++m)
              {
                out.println("<div class='radio'>\n <label>\n" +
                        "<input type='radio' name = answer[" + k +"] value=" + m +" checked=" + flag[m - 1] + " >\n A、" + question.option[m - 1] + "  </label>\n");
                if(errorFlag[m - 1])
                {
                  out.println("<span class=\"error\">error</span>\n</div>");
                }else out.println("</div>");
              }
            }
            else
            {
              for(int m = 1; m <= 4; ++m)
              {
                out.println("<div class='checkbox'>\n <label>\n" +
                        "<input type='checkbox' name = answer[" + k +"] value=" + m + " checked=" + flag[m - 1] + " >\n A、" + question.option[m - 1] + "  </label>");
                if(errorFlag[m - 1])
                {
                  out.println("<span class=\"error\">error</span>\n</div>");
                }else out.println("</div>");
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

