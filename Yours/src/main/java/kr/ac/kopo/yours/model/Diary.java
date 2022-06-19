package kr.ac.kopo.yours.model;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class Diary {
	private int code;
	private String id;
	private Date regDate;
	private String content;
	private String share;
	private String category;
	
	private List<DailyFeelings> feels = new ArrayList<DailyFeelings>();
	private List<Empathy> empathyList = new ArrayList<Empathy>();
	
	public int getEmpathy() {
		for(Empathy vo : empathyList) {
			if(vo.getDiaryCode() == null)
				continue;
			
			if(vo.getDiaryCode() == code) {
				return 1;
			}
		}
		
		return 0;
	}

	public List<Empathy> getEmpathyList() {
		return empathyList;
	}

	public void setEmpathyList(List<Empathy> empathyList) {
		this.empathyList = empathyList;
	}

	public String getStrFeels() {
		String strFeels = "";
		
		for(DailyFeelings item : feels) {
			strFeels += "#" + item.getFeeling() + " ";
		}
		
		return strFeels;
	}

	public String getStrShare() {
		if(share.equals("1")) {
			return "공개";
		} else
			return "비공개";
	}
	
	public List<DailyFeelings> getFeels() {
		return feels;
	}

	public void setFeels(List<DailyFeelings> feels) {
		this.feels = feels;
	}

	public int getCode() {
		return code;
	}
	
	public void setCode(int code) {
		this.code = code;
	}
	
	public String getId() {
		return id;
	}
	
	public void setId(String id) {
		this.id = id;
	}
	
	public Date getRegDate() {
		return regDate;
	}
	
	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}
	
	public String getContent() {
		return content;
	}
	
	public void setContent(String content) {
		this.content = content;
	}
	
	public String getShare() {
		return share;
	}
	
	public void setShare(String share) {
		this.share = share;
	}
	
	public String getCategory() {
		return category;
	}
	
	public void setCategory(String category) {
		this.category = category;
	}
}
