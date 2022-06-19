package kr.ac.kopo.yours.model;

import java.util.Date;

public class Account {
	private String id;
	private String passwd;
	private Date regDate;
	private String name;
	private String email;
	
	public String getId() {
		return id;
	}
	
	public void setId(String id) {
		this.id = id;
	}
	
	public String getPasswd() {
		return passwd;
	}
	
	public void setPasswd(String passwd) {
		this.passwd = passwd;
	}
	
	public Date getRegDate() {
		return regDate;
	}
	
	public void setRegDate(Date regDate) {
		this.regDate = regDate;
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

	public String getSite() {
		String[] first = email.split("@");
		
		String a = first[1];
		
		return a.substring(0, a.indexOf("."));
	}
}
