package com.nkl.page.domain;

import com.nkl.common.domain.BaseDomain;
import com.nkl.common.util.StringUtil;
import com.nkl.common.util.Transcode;

public class Lost extends BaseDomain {

	/**
	 * @Fields serialVersionUID : TODO
	 */
	private static final long serialVersionUID = -6925524708882684408L;
	private int lost_id; // 
	private int user_id; // 
	private String user_phone; // 
	private String user_address; // 
	private String user_mail; // 
	private String task_name; // 
	private String task_type; //  
	private String task_pic; // 
	private int task_age; // 
	private String task_desc; // 
	private String lost_date; // 
	
	private String real_name; // 
	private String ids;
	
	public String getTask_descShow() {
		if (!StringUtil.isEmptyString(task_desc)) {
			return Transcode.htmlDiscode(task_desc);
		}
		return task_desc;
	}
	
	public int getLost_id() {
		return lost_id;
	}

	public void setLost_id(int lost_id) {
		this.lost_id = lost_id;
	}

	public int getUser_id() {
		return user_id;
	}

	public void setUser_id(int user_id) {
		this.user_id = user_id;
	}

	public String getReal_name() {
		return real_name;
	}

	public void setReal_name(String real_name) {
		this.real_name = real_name;
	}

	public String getIds() {
		return ids;
	}

	public void setIds(String ids) {
		this.ids = ids;
	}

	public String getUser_mail() {
		return user_mail;
	}

	public void setUser_mail(String user_mail) {
		this.user_mail = user_mail;
	}

	public String getTask_name() {
		return task_name;
	}

	public void setTask_name(String task_name) {
		this.task_name = task_name;
	}

	public String getTask_type() {
		return task_type;
	}

	public void setTask_type(String task_type) {
		this.task_type = task_type;
	}

	public String getTask_desc() {
		return task_desc;
	}

	public void setTask_desc(String task_desc) {
		this.task_desc = task_desc;
	}

	public String getUser_phone() {
		return user_phone;
	}

	public String getUser_address() {
		return user_address;
	}

	public String getTask_pic() {
		return task_pic;
	}

	public int getTask_age() {
		return task_age;
	}

	public void setUser_phone(String user_phone) {
		this.user_phone = user_phone;
	}

	public void setUser_address(String user_address) {
		this.user_address = user_address;
	}

	public void setTask_pic(String task_pic) {
		this.task_pic = task_pic;
	}

	public void setTask_age(int task_age) {
		this.task_age = task_age;
	}

	public String getLost_date() {
		return lost_date;
	}

	public void setLost_date(String lost_date) {
		this.lost_date = lost_date;
	}
	 

}
