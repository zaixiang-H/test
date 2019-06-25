package bean;

public class Student {

	private Integer id;//学生id
	private String name;//学生姓名
	private Double javaScore;//java成绩
	private Double htmlScore;//html成绩
	private Double cssScore;//css成绩
	private Double totalScore;
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public Double getJavaScore() {
		return javaScore;
	}
	public void setJavaScore(Double javaScore) {
		this.javaScore = javaScore;
	}
	public Double getHtmlScore() {
		return htmlScore;
	}
	public void setHtmlScore(Double htmlScore) {
		this.htmlScore = htmlScore;
	}
	public Double getCssScore() {
		return cssScore;
	}
	public void setCssScore(Double cssScore) {
		this.cssScore = cssScore;
	}
	public Double getTotalScore() {
		return totalScore;
	}
	public void setTotalScore(Double totalScore) {
		this.totalScore = totalScore;
	}
}
