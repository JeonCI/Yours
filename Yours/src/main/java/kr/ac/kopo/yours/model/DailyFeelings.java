package kr.ac.kopo.yours.model;

public class DailyFeelings {
	private int code;
	private int diaryCode;
	private int feelingCode;
	private String feeling;
	private String id;
	
	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getFeeling() {
		return feeling;
	}

	public void setFeeling(String feeling) {
		this.feeling = feeling;
	}

	public int getCode() {
		return code;
	}
	
	public void setCode(int code) {
		this.code = code;
	}
	
	public int getDiaryCode() {
		return diaryCode;
	}
	
	public void setDiaryCode(int diaryCode) {
		this.diaryCode = diaryCode;
	}
	
	public int getFeelingCode() {
		return feelingCode;
	}
	
	public void setFeelingCode(int feelingCode) {
		this.feelingCode = feelingCode;
	}
}
