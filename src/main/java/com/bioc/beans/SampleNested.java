package com.bioc.beans;

public class SampleNested {
	private String frist;
	public String getFrist() {
		return frist;
	}
	public void setFrist(String frist) {
		this.frist = frist;
	}
	public String getSecond() {
		return second;
	}
	public void setSecond(String second) {
		this.second = second;
	}
	public String getThird() {
		return third;
	}
	public void setThird(String third) {
		this.third = third;
	}
	public String getChildThird1() {
		return childThird1;
	}
	public void setChildThird1(String childThird1) {
		this.childThird1 = childThird1;
	}
	public String getChildThird2() {
		return childThird2;
	}
	public void setChildThird2(String childThird2) {
		this.childThird2 = childThird2;
	}
	private String second;
	private String third;
		public class third {
		@Override
		public String toString() {
			return "SampleNested [childThird1=" + childThird1 + ", childThird2="
				+ childThird2 + "]";
		}
	}
	private String childThird1;
	private String childThird2;
	
}
