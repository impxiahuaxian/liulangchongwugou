package com.nkl.page.dao;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.List;

import com.nkl.common.dao.BaseDao;
import com.nkl.page.domain.SblogReply;

public class SblogReplyDao {

	public int addSblogReply(SblogReply sblogReply, Connection conn){
		String sql = "INSERT INTO sblog_reply(sblog_reply_id,exper_id,user_id,reply_title,reply_content,reply_date,sblog_pic) values(null,?,?,?,?,?,?)";
		Object[] params = new Object[] {
			sblogReply.getExper_id(),
			sblogReply.getUser_id(),
			sblogReply.getReply_title(),
			sblogReply.getReply_content(),
			sblogReply.getReply_date(),
			sblogReply.getSblog_pic() 

		};
		return BaseDao.executeUpdate(sql, params, conn );
	}

	public int delSblogReply(String sblog_reply_id, Connection conn){
		String sql = "DELETE FROM sblog_reply WHERE sblog_reply_id=?";

		Object[] params = new Object[] { new Integer(sblog_reply_id)};
		return BaseDao.executeUpdate(sql, params, conn);
	}

	public int delSblogReplys(String[] sblog_reply_ids, Connection conn){
		StringBuilder sBuilder = new StringBuilder();
		for (int i = 0; i <sblog_reply_ids.length; i++) {
			sBuilder.append("?");
			if (i !=sblog_reply_ids.length-1) {
				sBuilder.append(",");
			}
		}
		String sql = "DELETE FROM sblog_reply WHERE sblog_reply_id IN(" +sBuilder.toString()+")";

		Object[] params = sblog_reply_ids;

		return BaseDao.executeUpdate(sql, params, conn);	}

	public int updateSblogReply(SblogReply sblogReply, Connection conn){
		StringBuilder sBuilder = new StringBuilder();
		sBuilder.append("UPDATE sblog_reply SET sblog_reply_id = " + sblogReply.getSblog_reply_id() +" ");

		sBuilder.append("where sblog_reply_id = " + sblogReply.getSblog_reply_id());

		Object[] params = null;
		return BaseDao.executeUpdate(sBuilder.toString(), params, conn);	}

	public SblogReply getSblogReply(SblogReply sblogReply, Connection conn){
		SblogReply _sblogReply=null;
		StringBuilder sBuilder = new StringBuilder();
		sBuilder.append("SELECT sr.*,u.nick_name FROM sblog_reply sr join user u on sr.user_id = u.user_id WHERE sblog_reply_id = " + sblogReply.getSblog_reply_id() +" ");

		List<Object> list = BaseDao.executeQuery(SblogReply.class.getName(), sBuilder.toString(), null, conn);
		if (list != null && list.size() > 0) {
			 _sblogReply = (SblogReply)list.get(0);
		}
		return _sblogReply;
	}

	public List<SblogReply>  listSblogReplys(SblogReply sblogReply, Connection conn){
		List<SblogReply> sblogReplys = null;
		StringBuilder sBuilder = new StringBuilder();
		sBuilder.append("SELECT * FROM (");
		sBuilder.append("SELECT sr.*,u.nick_name FROM sblog_reply sr join user u on sr.user_id = u.user_id WHERE 1=1");
		
		if (sblogReply.getSblog_reply_id()!=0) {
			sBuilder.append(" and sblog_reply_id = " + sblogReply.getSblog_reply_id());
		}
		if (sblogReply.getExper_id()!=0) {
			sBuilder.append(" and exper_id = " + sblogReply.getExper_id());
		}
		sBuilder.append(" order by reply_date asc) t");
		
		if (sblogReply.getStart() != -1) {
			sBuilder.append(" limit " + sblogReply.getStart() + "," + sblogReply.getLimit());
		}

		List<Object> list = BaseDao.executeQuery(SblogReply.class.getName(), sBuilder.toString(), null, conn);
		if (list != null && list.size() > 0) {
			sblogReplys = new ArrayList<SblogReply>();
			for (Object object : list) {
				sblogReplys.add((SblogReply)object);
			}
		}
		return sblogReplys;
	}
	
	public int  listSblogReplysCount(SblogReply sblogReply, Connection conn){
		int sum = 0;
		StringBuilder sBuilder = new StringBuilder();
		sBuilder.append("SELECT count(*) FROM sblog_reply sr join user u on sr.user_id = u.user_id WHERE 1=1");
		if (sblogReply.getSblog_reply_id()!=0) {
			sBuilder.append(" and sblog_reply_id = " + sblogReply.getSblog_reply_id());
		}
		if (sblogReply.getExper_id()!=0) {
			sBuilder.append(" and exper_id = " + sblogReply.getExper_id());
		}
		
		long count = (Long)BaseDao.executeQueryObject(sBuilder.toString(), null, conn);
		sum = (int)count;
		return sum;
	}

}
