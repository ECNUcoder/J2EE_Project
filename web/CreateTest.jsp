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
<%
  if(session.getAttribute("userId") == null) response.sendRedirect("/Login.jsp");
  Test test = new Test();
  try {
    test.createTest(Integer.parseInt(request.getParameter("test_category_id")));
  } catch (SQLException e) {
    e.printStackTrace();
  }
  int k = 0;
  session.setAttribute("test", test);
%>
<SCRIPT LANGUAGE="JavaScript">
  var maxtime = 30*30 //半个小时，按秒计算，自己调整!
  function CountDown(){
    if(maxtime>=0){
      minutes = Math.floor(maxtime/30);
      seconds = Math.floor(maxtime%30);
      msg = "距离结束还有"+minutes+"分"+seconds+"秒";
      document.all["timer"].innerHTML=msg;
      if(maxtime == 5*30) alert('注意，还有5分钟!');
      --maxtime;
    }
    else{
      clearInterval(timer);
      alert("时间到，结束!");
    }
  }
  timer = setInterval("CountDown()",1000);
</SCRIPT>
<%@include file="header.jsp"%>
<div id="content">
  <div class="container">
    <div id="timer" style="color:#000000;float: right;">

    </div>
    <form method="post" action="check" role="form">
        <%
          Question[] questions = test.getQuestions();
          String tmp[] = {"A","B","C","D"};
          out.println("<h2 class='text-center'>" + test.getTitle() +"</h2>");
          for(Question question: questions) {
            out.println("<div class='row'>");
            out.println("<b>" + (k+1) + "、" + question.title + "</b>");
            if(question.category == 1) {
              for(int m = 1; m <= 4; ++m)
              {
                out.println("<div class='radio'>\n <label>\n" +
                        "<input type='radio' name = answer[" + k +"] value=" + m +" required >\n" + tmp[m - 1] + "、" + question.option[m - 1] + "  </label>\n</div>");
              }
            }
            else
            {
              for(int m = 1; m <= 4; ++m)
              {
                out.println("<div class='checkbox'>\n <label>\n" +
                        "<input type='checkbox' name = answer[" + k +"] value=" + m +" >\n " + tmp[m - 1] + "、" + question.option[m - 1] + "  </label>\n</div>");
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