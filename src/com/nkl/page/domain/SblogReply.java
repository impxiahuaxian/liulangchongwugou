package com.nkl.page.domain;

import com.nkl.common.domain.BaseDomain;

public class SblogReply extends BaseDomain {
	/**
	 * @Fields serialVersionUID : TODO
	 */
	private static final long serialVersionUID = 5974537055144250656L;
	private int sblog_reply_id; // 
	private int exper_id; // 
	private int user_id; // 
	private String reply_title; //
	private String reply_content; // 
	private String reply_date; // 
	private String sblog_pic; // 
	 
	private String nick_name;
	private String random; // 
	private String ids; // 

	public void setSblog_reply_id(int sblog_reply_id){
		this.sblog_reply_id=sblog_reply_id;
	}

	public int getSblog_reply_id(){
		return sblog_reply_id;
	}

	public void setUser_id(int user_id){
		this.user_id=user_id;
	}

	public int getUser_id(){
		return user_id;
	}

	public void setReply_content(String reply_content){
		this.reply_content=reply_content;
	}

	public String getReply_content(){
		return reply_content;
	}

	public void setReply_date(String reply_date){
		this.reply_date=reply_date;
	}

	public String getReply_date(){
		return reply_date;
	}

	public void setSblog_pic(String sblog_pic){
		this.sblog_pic=sblog_pic;
	}

	public String getSblog_pic(){
		return sblog_pic;
	}

	public String getNick_name() {
		return nick_name;
	}

	public void setNick_name(String nick_name) {
		this.nick_name = nick_name;
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

	public int getExper_id() {
		return exper_id;
	}

	public String getReply_title() {
		return reply_title;
	}

	public void setExper_id(int exper_id) {
		this.exper_id = exper_id;
	}

	public void setReply_title(String reply_title) {
		this.reply_title = reply_title;
	}

}
