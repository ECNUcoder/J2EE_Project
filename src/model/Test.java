/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import default_package.DbHelper;

import java.sql.SQLException;
import java.util.HashSet;
import java.util.Random;
import java.util.Set;

/**
 *
 * @author Burgess
 */

public class Test {
    private String title;
    private String[] commit_answer;
    private Question[] questions;
    private int test_category;
    private int scores;
    private String answerString;
    private String questionString;

    public void setQuestions(Question[] questions) {
        this.questions = questions;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getQuestionString() {
        return questionString;
    }

    public void setQuestionString(String questionString) {
        this.questionString = questionString;
    }

    public String getAnswerString() {
        return answerString;
    }

    public void setAnswerString(String answerString) {
        this.answerString = answerString;
    }

    public int getScores() {
        return scores;
    }

    public void setScores(int scores) {
        this.scores = scores;
    }

    public void setCommit_answer(String[] commit_answer) {
        this.commit_answer = commit_answer;
    }

    public Test()
    {
        questions = new Question[20];
        commit_answer = new String[20];
    }

    public Question[] getQuestions() {
        return questions;
    }

    public String getTitle() {
        return title;
    }

    public void createTest(int category) throws SQLException {
        int i;
        test_category = category;
        title = DbHelper.getTitleName(category) + "试卷";

        //单选题
        Integer[] idArray = DbHelper.getIdArray(1);
        int len = idArray.length;
        Set<Integer> set = this.initNO(15, len);
        Integer[] id = convert(set);
        for(i = 0; i < 15; ++i){
            questions[i] = DbHelper.getSingle(idArray[id[i]], 1);
        }
        //多选题
        idArray = DbHelper.getIdArray(2);
        len = idArray.length;
        set = this.initNO(5, len);
        id = convert(set);
        for(; i < 20; ++i){
            questions[i] = DbHelper.getSingle(idArray[id[i - 15]], 2);
        }
    }
    
    public Integer numFactory(int num) {
        return new Random().nextInt(num) + 1;
    }

    public Set<Integer> initNO(int count, int RamdonNum) {
        Set<Integer> set = new HashSet<Integer>();
        while (true) {
                set.add(numFactory(RamdonNum));
                if (set.size() > count) {
                        break;
                }
        }
        return set;
    }

    public Integer[] convert(Set<Integer> set) {
        Object obj[] = set.toArray();
        int len = obj.length;
        Integer integer[] = new Integer[len];
        for (int i = 0; i < obj.length; i++) {
                integer[i] = (Integer) obj[i];
        }
        return integer;
    }
}
