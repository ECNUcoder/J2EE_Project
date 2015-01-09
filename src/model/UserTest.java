package model;

/**
 * Created by Burgess on 2014/12/30.
 */
import java.sql.Date;
public class UserTest {
    private int userID;
    private int id;
    private String testTitle;
    private int score;
    private Date date;

    public UserTest(int id, int userID, String testTitle, int score, Date date) {
        this.userID = userID;
        this.id = id;
        this.testTitle = testTitle;
        this.score = score;
        this.date = date;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public int getScore() {
        return score;
    }

    public void setScore(int score) {
        this.score = score;
    }

    public String getTestTitle() {
        return testTitle;
    }

    public void setTestTitle(String testTitle) {
        this.testTitle = testTitle;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getUserID() {
        return userID;
    }

    public void setUserID(int userID) {
        this.userID = userID;
    }

}
