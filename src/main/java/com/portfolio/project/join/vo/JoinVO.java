package com.portfolio.project.join.vo;

import javax.persistence.Table;

//VO(Value Object)
@Table(name = "JOIN")
public class JoinVO {
	private String uname; //사용자 이름
	private String upw;//비밀번호
	private String uemail;//이메일
	private int uage;//나이
	private boolean ujob;//직업 유무

	public String getUname() {
		return uname;
	}
	public void setUname(String uname) {
		this.uname = uname;
	}
	public String getUpw() {
		return upw;
	}
	public void setUpw(String upw) {
		this.upw = upw;
	}
	public String getUemail() {
		return uemail;
	}
	public void setUemail(String uemail) {
		this.uemail = uemail;
	}
	public int getUage() {
		return uage;
	}
	public void setUage(int uage) {
		this.uage = uage;
	}
	public boolean getUjob() {
		return ujob;
	}
	public void setUjob(boolean ujob) {
		this.ujob = ujob;
	}
	
	@Override
	public String toString() {
		return "JoinVO [uname=" + uname + ", upw=" + upw + ", uemail=" + uemail + ", uage=" + uage + ", ujob=" + ujob
				+ "]";
	}
	
	
}
