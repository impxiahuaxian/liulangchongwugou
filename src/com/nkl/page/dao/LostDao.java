package com.nkl.page.dao;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.List;

import com.nkl.page.domain.Lost;
import com.nkl.common.dao.BaseDao;
import com.nkl.common.util.StringUtil;

public class LostDao {

	public int addLost(Lost lost, Connection conn){
		String sql = "INSERT INTO lost(lost_id,user_id,user_phone,user_address,user_mail,task_name,task_type,task_pic,task_age,task_desc,lost_date) values(null,?,?,?,?,?,?,?,?,?,?)";
		Object[] params = new Object[] {
			lost.getUser_id(),
			lost.getUser_phone(),
			lost.getUser_address(),
			lost.getUser_mail(),
			lost.getTask_name(), 
			lost.getTask_type(),
			lost.getTask_pic(),
			lost.getTask_age(),
			lost.getTask_desc(),
			lost.getLost_date()

		};
		return BaseDao.executeUpdate(sql, params, conn );
	}

	public int delLost(String lost_id, Connection conn){
		String sql = "DELETE FROM lost WHERE lost_id=?";

		Object[] params = new Object[] { new Integer(lost_id)};
		return BaseDao.executeUpdate(sql, params, conn);
	}

	public int delLosts(String[] lost_ids, Connection conn){
		StringBuilder sBuilder = new StringBuilder();
		for (int i = 0; i <lost_ids.length; i++) {
			sBuilder.append("?");
			if (i !=lost_ids.length-1) {
				sBuilder.append(",");
			}
		}
		String sql = "DELETE FROM lost WHERE lost_id IN(" +sBuilder.toString()+")";

		Object[] params = lost_ids;

		return BaseDao.executeUpdate(sql, params, conn);
	}

	public int updateLost(Lost lost, Connection conn){
		StringBuilder sBuilder = new StringBuilder();
		sBuilder.append("UPDATE lost SET lost_id = " + lost.getLost_id() +" ");
		if (!StringUtil.isEmptyString(lost.getUser_phone())) {
			sBuilder.append(" ,user_phone = '" + lost.getUser_phone() +"' ");
		}
		if (!StringUtil.isEmptyString(lost.getUser_address())) {
			sBuilder.append(" ,user_address = '" + lost.getUser_address() +"' ");
		}
		if (!StringUtil.isEmptyString(lost.getUser_mail())) {
			sBuilder.append(" ,user_mail = '" + lost.getUser_mail() +"' ");
		}
		if (!StringUtil.isEmptyString(lost.getTask_name())) {
			sBuilder.append(" ,task_name = '" + lost.getTask_name() +"' ");
		}
		if (!StringUtil.isEmptyString(lost.getTask_type())) {
			sBuilder.append(" ,task_type = '" + lost.getTask_type() +"' ");
		}
		if (!StringUtil.isEmptyString(lost.getTask_pic())) {
			sBuilder.append(" ,task_pic = '" + lost.getTask_pic() +"' ");
		}
		if (!StringUtil.isEmptyString(lost.getTask_desc())) {
			sBuilder.append(" ,task_desc = '" + lost.getTask_desc() +"' ");
		}
		if (!StringUtil.isEmptyString(lost.getLost_date())) {
			sBuilder.append(" ,lost_date = '" + lost.getLost_date() +"' ");
		}
		
		sBuilder.append(" where lost_id = " + lost.getLost_id() +" ");

		Object[] params = null;
		return BaseDao.executeUpdate(sBuilder.toString(), params, conn);
	}

	public Lost getLost(Lost lost, Connection conn){
		Lost _lost=null;
		StringBuilder sBuilder = new StringBuilder();
		sBuilder.append("SELECT b.*,u.real_name FROM lost b join user u on b.user_id=u.user_id WHERE 1=1");
		if (lost.getLost_id()!=0) {
			sBuilder.append(" and b.lost_id = " + lost.getLost_id() +" ");
		}

		List<Object> list = BaseDao.executeQuery(Lost.class.getName(), sBuilder.toString(), null, conn);
		if (list != null && list.size() > 0) {
			 _lost = (Lost)list.get(0);
		}
		return _lost;
	}

	public List<Lost>  listLosts(Lost lost, Connection conn){
		List<Lost> losts = null;
		StringBuilder sBuilder = new StringBuilder();
		sBuilder.append("SELECT * FROM (");
		sBuilder.append("SELECT b.*,u.real_name FROM lost b join user u on b.user_id=u.user_id WHERE 1=1");

		if (lost.getLost_id()!=0) {
			sBuilder.append(" and b.lost_id = " + lost.getLost_id() +" ");
		}
		if (lost.getUser_id()!=0) {
			sBuilder.append(" and b.user_id = " + lost.getUser_id() +" ");
		}
		if (!StringUtil.isEmptyString(lost.getTask_name())) {
			sBuilder.append(" and b.task_name like '%" + lost.getTask_name() +"%' ");
		}
		if (!StringUtil.isEmptyString(lost.getTask_type())) {
			sBuilder.append(" and b.task_type like '%" + lost.getTask_type() +"%' ");
		}
		sBuilder.append(" order by b.lost_id desc) t");

		if (lost.getStart() != -1) {
			sBuilder.append(" limit " + lost.getStart() + "," + lost.getLimit());
		}

		List<Object> list = BaseDao.executeQuery(Lost.class.getName(), sBuilder.toString(), null, conn);
		if (list != null && list.size() > 0) {
			losts = new ArrayList<Lost>();
			for (Object object : list) {
				losts.add((Lost)object);
			}
		}
		return losts;
	}

	public int  listLostsCount(Lost lost, Connection conn){
		int sum = 0;
		StringBuilder sBuilder = new StringBuilder();
		sBuilder.append("SELECT count(*) FROM lost b  WHERE 1=1");

		if (lost.getLost_id()!=0) {
			sBuilder.append(" and b.lost_id = " + lost.getLost_id() +" ");
		}
		if (lost.getUser_id()!=0) {
			sBuilder.append(" and b.user_id = " + lost.getUser_id() +" ");
		}
		if (!StringUtil.isEmptyString(lost.getTask_name())) {
			sBuilder.append(" and b.task_name like '%" + lost.getTask_name() +"%' ");
		}
		if (!StringUtil.isEmptyString(lost.getTask_type())) {
			sBuilder.append(" and b.task_type like '%" + lost.getTask_type() +"%' ");
		}
		long count = (Long)BaseDao.executeQueryObject(sBuilder.toString(), null, conn);
		sum = (int)count;
		return sum;
	}

}
