package com.nkl.page.domain;

import com.nkl.common.domain.BaseDomain;
import com.nkl.common.util.StringUtil;
import com.nkl.common.util.Transcode;

public class Task extends BaseDomain {

	/**
	 * @Fields serialVersionUID : TODO
	 */
	private static final long serialVersionUID = -6925524708882684408L;
	private int task_id; // 
	private int user_id; // 
	private String user_phone; //  
	private String user_address; // 
	private String user_mail; // 
	private String task_name; // 
	private String task_type; // 
	private String task_pic; // 
	private String task_desc; // 
	private int task_age; // 
	private String task_start; // 
	private String task_end; // 
	private String task_require; // 
	private int task_status; // 1:待领养 2:已领养
	
	private String real_name; // 
	private String nick_name; //
	private String task_date_min;
	private String task_date_max;
	
	private String race_user; //中标人
	
	private String ids;
	
	public String getTask_statusDesc(){
		switch (task_status) {
		case 1:
			return "待领养";
		case 2:
			return "已领养"; 
		default:
			return "";
		}
	}
	
	public String getTask_descShow() {
		if (!StringUtil.isEmptyString(task_desc)) {
			return Transcode.htmlDiscode(task_desc);
		}
		return task_desc;
	}
	
	public String getTask_requireShow() {
		if (!StringUtil.isEmptyString(task_require)) {
			return Transcode.htmlDiscode(task_require);
		}
		return task_require;
	}
	
	public int getTask_id() {
		return task_id;
	}

	public void setTask_id(int task_id) {
		this.task_id = task_id;
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

	public String getTask_date_min() {
		return task_date_min;
	}

	public void setTask_date_min(String task_date_min) {
		this.task_date_min = task_date_min;
	}

	public String getTask_date_max() {
		return task_date_max;
	}

	public void setTask_date_max(String task_date_max) {
		this.task_date_max = task_date_max;
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

	public String getTask_start() {
		return task_start;
	}

	public void setTask_start(String task_start) {
		this.task_start = task_start;
	}

	public String getTask_end() {
		return task_end;
	}

	public void setTask_end(String task_end) {
		this.task_end = task_end;
	}

	public int getTask_status() {
		return task_status;
	}

	public String getRace_user() {
		return race_user;
	}

	public void setRace_user(String race_user) {
		this.race_user = race_user;
	}

	public void setTask_status(int task_status) {
		this.task_status = task_status;
	}

	public String getNick_name() {
		return nick_name;
	}

	public void setNick_name(String nick_name) {
		this.nick_name = nick_name;
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

	public String getTask_require() {
		return task_require;
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

	public void setTask_require(String task_require) {
		this.task_require = task_require;
	}

	 

}
