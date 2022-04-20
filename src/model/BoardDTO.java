package model;

import java.sql.Timestamp;

public class BoardDTO {
	
	private int bNo;
	private String bTitle;
	private String bContent;
	private String bWriter;
	private Timestamp bRegData;
	
	public int getbNo() {
		return bNo;
	}
	
	public void setbNo(int bNo) {
		this.bNo = bNo;
	}
	
	public String getbTitle() {
		return bTitle;
	}
	
	public void setbTitle(String bTitle) {
		this.bTitle = bTitle;
	}
	
	public String getbContent() {
		return bContent;
	}
	
	public void setbContent(String bContent) {
		this.bContent = bContent;
	}
	
	public String getbWriter() {
		return bWriter;
	}
	
	public void setbWriter(String bWriter) {
		this.bWriter = bWriter;
	}
	
	public Timestamp getbRegData() {
		return bRegData;
	}
	
	public void setbRegData(Timestamp bRegData) {
		this.bRegData = bRegData;
	}
	
	@Override
	public String toString() {
		return "BoardDTO [bNo=" + bNo + ", bTitle=" + bTitle + ", bContent=" + bContent + ", bWriter=" + bWriter
				+ ", bRegData=" + bRegData + "]";
	}
	
	
	
}
