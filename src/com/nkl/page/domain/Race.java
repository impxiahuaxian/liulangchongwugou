package com.nkl.page.domain;

import com.nkl.common.domain.BaseDomain;
import com.nkl.common.util.StringUtil;
import com.nkl.common.util.Transcode;

public class Race extends BaseDomain {

	/**
	 * @Fields serialVersionUID : TODO
	 */
	private static final long serialVersionUID = -6925524708882684408L;
	private int race_id; // 
	private int task_id; // 
	private int user_id; // 
	private String race_date; // 
	private String race_desc; // 
	private int race_score; // 1:好评 2:中评 3:差评
	private int race_flag; // 1:申请中 2:未通过 3:审批通过 

	
	private int task_status; // 1:待领养 2:已领养
	private String task_name; //
	private String task_type; // 
	private int task_age; // 
	private String real_name; // 
	private String user_address; // 
	private String user_phone; // 
	private String user_mail; // 
	private int user_level; // 
	private int user_levelMin; // 
	private int user_levelMax; // 
	private String ids;
	
	public String getRace_scoreDesc(){
		switch (race_score) {
		case 1:
			return "好评";
		case 2:
			return "中评"; 
		case 3:
			return "差评"; 
		default:
			return "";
		}
	}
	
	public String getRace_flagDesc(){
		switch (race_flag) {
		case 1:
			return "申请中";
		case 2:
			return "未通过"; 
		case 3:
			return "审批通过"; 
		default:
			return "";
		}
	}
	
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
	
	public String getRace_descShow() {
		if (!StringUtil.isEmptyString(race_desc)) {
			return Transcode.htmlDiscode(race_desc);
		}
		return race_desc;
	}
	
	public int getRace_id() {
		return race_id;
	}

	public void setRace_id(int race_id) {
		this.race_id = race_id;
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

	public String getRace_desc() {
		return race_desc;
	}

	public void setRace_desc(String race_desc) {
		this.race_desc = race_desc;
	}

	public int getTask_id() {
		return task_id;
	}

	public void setTask_id(int task_id) {
		this.task_id = task_id;
	}

	public String getRace_date() {
		return race_date;
	}

	public void setRace_date(String race_date) {
		this.race_date = race_date;
	}

	public int getRace_flag() {
		return race_flag;
	}

	public void setRace_flag(int race_flag) {
		this.race_flag = race_flag;
	}

	public String getTask_name() {
		return task_name;
	}

	public void setTask_name(String task_name) {
		this.task_name = task_name;
	}

	public int getTask_status() {
		return task_status;
	}

	public void setTask_status(int task_status) {
		this.task_status = task_status;
	}

	public int getRace_score() {
		return race_score;
	}

	public void setRace_score(int race_score) {
		this.race_score = race_score;
	}

	public String getUser_address() {
		return user_address;
	}

	public String getUser_phone() {
		return user_phone;
	}

	public String getUser_mail() {
		return user_mail;
	}

	public int getUser_level() {
		return user_level;
	}

	public void setUser_address(String user_address) {
		this.user_address = user_address;
	}

	public void setUser_phone(String user_phone) {
		this.user_phone = user_phone;
	}

	public void setUser_mail(String user_mail) {
		this.user_mail = user_mail;
	}

	public void setUser_level(int user_level) {
		this.user_level = user_level;
	}

	public String getTask_type() {
		return task_type;
	}

	public int getTask_age() {
		return task_age;
	}

	public void setTask_type(String task_type) {
		this.task_type = task_type;
	}

	public void setTask_age(int task_age) {
		this.task_age = task_age;
	}

	public int getUser_levelMin() {
		return user_levelMin;
	}

	public int getUser_levelMax() {
		return user_levelMax;
	}

	public void setUser_levelMin(int user_levelMin) {
		this.user_levelMin = user_levelMin;
	}

	public void setUser_levelMax(int user_levelMax) {
		this.user_levelMax = user_levelMax;
	}

}
