package model;

/**
 * Created by zh on 2015/1/4.
 */
public class User {
    public int id;
    public String name;
    public String email;
    public String username;
    public String gender;
    public String password;

    public User(int id, String name, String email, String username, String gender, String password) {
        this.id = id;
        this.name = name;
        this.email = email;
        this.username = username;
        this.gender = gender;
        this.password = password;
    }

    public User(String name, String email, String username, String gender, String password) {
        this.name = name;
        this.email = email;
        this.username = username;
        this.gender = gender;
        this.password = password;
    }

    public int getId() {
        return id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }
}
