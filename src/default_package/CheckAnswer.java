package default_package;

import model.Question;
import model.Test;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.SQLException;
import java.util.Enumeration;

/**
 * Created by Burgess on 2014/12/28.
 */
public class CheckAnswer extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Enumeration<String> paraName = req.getParameterNames();
        String[] answer = new String[20];
        HttpSession session= req.getSession();
        Test test = (Test)session.getAttribute("test");
        int k = 0;
        int scores = 0;
        int userId ;//= (Integer)session.getAttribute("userId");
        String questionString = "";
        String answerString = "";
        //一个问题的多个答案用‘,’分割，多个问题之间用‘:’分割
        while(paraName.hasMoreElements()){
            String[] tmp = req.getParameterValues(paraName.nextElement());
            answer[k] = "";
            for(int i = 0; i < tmp.length; ++i)
            {
                answer[k] += tmp[i] + ",";
            }
            answerString += answer[k] + ":";
            ++k;
        }

        k = 0;
        for(Question question : test.getQuestions())
        {
            questionString += question.title_id + ":";
            //计算成绩
            if(question.answer.equals(answer[k])){
                scores += (question.category == 1) ? 4 : 8;
            }
        }
        test.setCommit_answer(answer);
        test.setAnswerString(answerString);
        test.setScores(scores);
        userId = 1;
        test.setQuestionString(questionString);
        try {
            DbHelper.InsertTest(userId, test);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        session.setAttribute("test",test);
        resp.sendRedirect(req.getContextPath() + "/testInfo.jsp");
    }
}
