package com.java1234.model;

public class NewsType {

	private int newsTypeId;
	private String typeName;
	
	
	
	public NewsType(String typeName) {
		super();
		this.typeName = typeName;
	}
	public NewsType() {
		super();
		// TODO Auto-generated constructor stub
	}
	public int getNewsTypeId() {
		return newsTypeId;
	}
	public void setNewsTypeId(int newsTypeId) {
		this.newsTypeId = newsTypeId;
	}
	public String getTypeName() {
		return typeName;
	}
	public void setTypeName(String typeName) {
		this.typeName = typeName;
	}
	
	
}
