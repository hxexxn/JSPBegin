package model;

import java.sql.Timestamp;

public class UserDTO {

	private int uNo;
	private String uerID;
	private String userPW;
	private Timestamp userRegeDate;
	
	
	public int getuNo() {
		return uNo;
	}
	
	public void setuNo(int uNo) {
		this.uNo = uNo;
	}
	
	public String getUerID() {
		return uerID;
	}
	
	public void setUerID(String uerID) {
		this.uerID = uerID;
	}
	
	public String getUserPW() {
		return userPW;
	}
	
	public void setUserPW(String userPW) {
		this.userPW = userPW;
	}
	
	public Timestamp getUserRegeDate() {
		return userRegeDate;
	}
	
	public void setUserRegeDate(Timestamp userRegeDate) {
		this.userRegeDate = userRegeDate;
	}
	
	@Override
	public String toString() {
		return "UserDTO [uNo=" + uNo + ", uerID=" + uerID + ", userPW=" + userPW + ", userRegeDate=" + userRegeDate
				+ "]";
	}
	
	
	
	
}
