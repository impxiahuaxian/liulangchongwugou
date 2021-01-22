package com.nkl.page.domain;

import com.nkl.common.domain.BaseDomain;
import com.nkl.common.util.StringUtil;
import com.nkl.common.util.Transcode;

public class Exper extends BaseDomain {
	/**
	 * @Fields serialVersionUID : TODO
	 */
	private static final long serialVersionUID = -674161960515333295L;
	private int exper_id; // 
	private String exper_title; // 
	private String exper_content; //
	private int user_id; // 
	private String exper_date; // 
	
	private String real_name; // 
	private String user_address; // 
	private String user_phone; //  
	private String user_mail; // 
	private int user_level; // 
	private String random; // 
	private String ids; // 

	public void setExper_id(int exper_id){
		this.exper_id=exper_id;
	}

	public int getExper_id(){
		return exper_id;
	}

	public void setExper_title(String exper_title){
		this.exper_title=exper_title;
	}

	public String getExper_title(){
		return exper_title;
	}

	public void setExper_content(String exper_content){
		this.exper_content=exper_content;
	}

	public String getExper_contentShow(){
		if (!StringUtil.isEmptyString(exper_content)) {
			return Transcode.htmlDiscode(exper_content);
		}
		return exper_content;
	}
	
	public String getExper_content(){
		return exper_content;
	}

	public void setExper_date(String exper_date){
		this.exper_date=exper_date;
	}

	public String getExper_date(){
		return exper_date;
	}

	public String getRandom() {
		return random;
	}

	public void setRandom(String random) {
		this.random = random;
	}

	public String getIds() {
		return ids;
	}

	public void setIds(String ids) {
		this.ids = ids;
	}

	public int getUser_id() {
		return user_id;
	}

	public String getReal_name() {
		return real_name;
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

	public void setUser_id(int user_id) {
		this.user_id = user_id;
	}

	public void setReal_name(String real_name) {
		this.real_name = real_name;
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

}
