package model;

/**
 * Created by Burgess on 2014/12/28.
 */
public class Question{
    public int title_id;
    public String title;
    public String[] option;
    public String answer;
    public int category;
    public int test_category;

    public Question(int title_id, String title, String option1, String option2, String option3, String option4,
                    String answer, int category, int test_category)
    {
        option = new String[4];
        this.answer = answer;
        this.option[0] = option1;
        this.option[1] = option2;
        this.option[2] = option3;
        this.option[3] = option4;
        this.title_id = title_id;
        this.title = title;
        this.category = category;
        this.test_category = test_category;
    }
}