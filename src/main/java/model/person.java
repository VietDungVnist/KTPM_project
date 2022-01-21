package model;

import java.util.Date;

public class person {
	private int ID;
	private String name, homeTown, nation, CCCD, job, phone, shk;
	
	private Date dob;
	
	public person(int iD, String name, String homeTown, String nation, String country, String cCCD,
			String passport, String job, Date dob) {
		super();
		ID = iD;
		this.name = name;
		this.homeTown = homeTown;
		this.nation = nation;
		CCCD = cCCD;
		this.job = job;
		this.dob = dob;
	}
	public person() {
	}
	public int getID() {
		return ID;
	}
	public void setID(int iD) {
		ID = iD;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getHomeTown() {
		return homeTown;
	}
	public void setHomeTown(String homeTown) {
		this.homeTown = homeTown;
	}
	public String getNation() {
		return nation;
	}
	public void setNation(String nation) {
		this.nation = nation;
	}
	public String getCCCD() {
		return CCCD;
	}
	public void setCCCD(String cCCD) {
		CCCD = cCCD;
	}
	public String getJob() {
		return job;
	}
	public void setJob(String job) {
		this.job = job;
	}
	public Date getDob() {
		if (this.dob == null) return new Date(0);
		return dob;
	}
	public void setDob(Date dob) {
		this.dob = dob;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone=phone;
	}
	public String getShk() {
		return shk;
	}
	public void setShk(String shk) {
		this.shk = shk;
	}
}
