package com.lfbdc.bank.model;

public class SeeRecord {
	
	private Object object;
	
    public Object getObject() {
		return object;
	}

	public void setObject(Object object) {
		this.object = object;
	}

	/*当前查询条件*/
    private String bdczh;
    
    private String bdczmh;

    public String getBdczh() {
		return bdczh;
	}

	public void setBdczh(String bdczh) {
		this.bdczh = bdczh;
	}

	public String getBdczmh() {
		return bdczmh;
	}

	public void setBdczmh(String bdczmh) {
		this.bdczmh = bdczmh;
	}

	public Page getPage() {
		return page;
	}

	public void setPage(Page page) {
		this.page = page;
	}

	/*分页对象*/
    private Page page;

}
