package top.bestguo.vo;

/**
 * 成绩表
 */
public class GradeTable {

    /**
     * 学生id
     */
    private Integer stuId;

    /**
     * 学生名字
     */
    private String username;

    /**
     * 学生性别
     */
    private Integer gender;

    /**
     * 学生成绩
     */
    private Double score;

    /**
     * 答案
     */
    private String answer;

    /**
     * 考试状态
     */
    private String status;

    public Integer getStuId() {
        return stuId;
    }

    public void setStuId(Integer stuId) {
        this.stuId = stuId;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public Integer getGender() {
        return gender;
    }

    public void setGender(Integer gender) {
        this.gender = gender;
    }

    public Double getScore() {
        return score;
    }

    public void setScore(Double score) {
        this.score = score;
    }

    public String getAnswer() {
        return answer;
    }

    public void setAnswer(String answer) {
        this.answer = answer;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }
}
