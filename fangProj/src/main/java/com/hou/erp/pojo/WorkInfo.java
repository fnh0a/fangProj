package com.hou.erp.pojo;

public class WorkInfo {
	private int id;
	private String workername;
	private String tableNo;
	private String time;
	private String startCode;
	private String endCode;
	private String weight;
	private String price;
	private String total;
	private String remark;
	private String createTime;
	 

	public String getCreateTime() {
		return createTime;
	}

	public void setCreateTime(String createTime) {
		this.createTime = createTime;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getWorkername() {
		return workername;
	}

	public void setWorkername(String workername) {
		this.workername = workername;
	}

	public String getTableNo() {
		return tableNo;
	}

	public void setTableNo(String tableNo) {
		this.tableNo = tableNo;
	}

	public String getTime() {
		return time;
	}

	public void setTime(String time) {
		this.time = time;
	}

	public String getStartCode() {
		return startCode;
	}

	public void setStartCode(String startCode) {
		this.startCode = startCode;
	}

	public String getEndCode() {
		return endCode;
	}

	public void setEndCode(String endCode) {
		this.endCode = endCode;
	}

	public String getWeight() {
		return weight;
	}

	public void setWeight(String weight) {
		this.weight = weight;
	}

	public String getPrice() {
		return price;
	}

	public void setPrice(String price) {
		this.price = price;
	}

	public String getTotal() {
		return total;
	}

	public void setTotal(String total) {
		this.total = total;
	}

	public String getRemark() {
		return remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}

	@Override
	public String toString() {
		return "WorkInfo [id=" + id + ", workername=" + workername
				+ ", tableNo=" + tableNo + ", time=" + time + ", startCode="
				+ startCode + ", endCode=" + endCode + ", weight=" + weight
				+ ", price=" + price + ", total=" + total + ", remark="
				+ remark + ", createTime=" + createTime + "]";
	}

	 

}
