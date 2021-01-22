package com.nkl.page.dao;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.List;

import com.nkl.common.dao.BaseDao;
import com.nkl.common.util.StringUtil;
import com.nkl.page.domain.Exper;
import com.nkl.page.domain.User;

public class ExperDao {

	public int addExper(Exper exper, Connection conn){
		String sql = "INSERT INTO exper(exper_id,exper_title,exper_content,user_id,exper_date) values(null,?,?,?,?)";
		Object[] params = new Object[] {
			exper.getExper_title(),
			exper.getExper_content(),
			exper.getUser_id(),
			exper.getExper_date() 

		};
		return BaseDao.executeUpdate(sql, params, conn );
	}

	public int delExper(String exper_id, Connection conn){
		String sql = "DELETE FROM exper WHERE exper_id=?";

		Object[] params = new Object[] { new Integer(exper_id)};
		return BaseDao.executeUpdate(sql, params, conn);
	}

	public int delExpers(String[] exper_ids, Connection conn){
		StringBuilder sBuilder = new StringBuilder();
		for (int i = 0; i <exper_ids.length; i++) {
			sBuilder.append("?");
			if (i !=exper_ids.length-1) {
				sBuilder.append(",");
			}
		}
		String sql = "DELETE FROM exper WHERE exper_id IN(" +sBuilder.toString()+")";

		Object[] params = exper_ids;

		return BaseDao.executeUpdate(sql, params, conn);	
	}
	
	public int updateExper(Exper exper, Connection conn){
		StringBuilder sBuilder = new StringBuilder();
		sBuilder.append("UPDATE exper SET exper_id = " + exper.getExper_id() +" ");
		if (!StringUtil.isEmptyString(exper.getExper_title())) {
			sBuilder.append(" ,exper_title = '" + exper.getExper_title()+"'" );
		}
		if (!StringUtil.isEmptyString(exper.getExper_content())) {
			sBuilder.append(" ,exper_content = '" + exper.getExper_content()+"'" );
		}
		sBuilder.append(" where exper_id = " + exper.getExper_id() );

		Object[] params = null;
		return BaseDao.executeUpdate(sBuilder.toString(), params, conn);	}

	public Exper getExper(Exper exper, Connection conn){
		Exper _exper=null;
		StringBuilder sBuilder = new StringBuilder();
		sBuilder.append("SELECT s.*,u.real_name,u.user_phone,u.user_address,u.user_mail,u.user_level From exper s ");
		sBuilder.append("  left join user u on s.user_id=u.user_id");
		sBuilder.append(" WHERE s.exper_id = " + exper.getExper_id() );

		List<Object> list = BaseDao.executeQuery(Exper.class.getName(), sBuilder.toString(), null, conn);
		if (list != null && list.size() > 0) {
			 _exper = (Exper)list.get(0);
		}
		return _exper;
	}

	public List<Exper>  listExpers(Exper exper, Connection conn){
		List<Exper> expers = null;
		StringBuilder sBuilder = new StringBuilder();
		sBuilder.append("SELECT * FROM (");
		sBuilder.append("SELECT s.*,u.real_name,u.user_phone,u.user_address,u.user_mail,u.user_level From exper s ");
		sBuilder.append("  left join user u on s.user_id=u.user_id");
		sBuilder.append(" WHERE 1=1 ");
		if (exper.getExper_id()!=0) {
			sBuilder.append(" and s.exper_id = " + exper.getExper_id() );
		}
		if (exper.getUser_id()!=0) {
			sBuilder.append(" and s.user_id = " + exper.getUser_id() );
		}
		if (!StringUtil.isEmptyString(exper.getExper_title())) {
			sBuilder.append(" and s.exper_title like '%" + exper.getExper_title() +"%'");
		}
		
		sBuilder.append(" order by s.exper_date desc,s.exper_id asc) t");
		
		if (exper.getStart() != -1) {
			sBuilder.append(" limit " + exper.getStart() + "," + exper.getLimit());
		}

		List<Object> list = BaseDao.executeQuery(Exper.class.getName(), sBuilder.toString(), null, conn);
		if (list != null && list.size() > 0) {
			expers = new ArrayList<Exper>();
			for (Object object : list) {
				expers.add((Exper)object);
			}
		}
		return expers;
	}
	
	public int  listExpersCount(Exper exper, Connection conn){
		int sum = 0;
		StringBuilder sBuilder = new StringBuilder();
		sBuilder.append("SELECT count(*) FROM exper s ");
		sBuilder.append(" WHERE 1=1");
		if (exper.getExper_id()!=0) {
			sBuilder.append(" and s.exper_id = " + exper.getExper_id() );
		}
		if (exper.getUser_id()!=0) {
			sBuilder.append(" and s.user_id = " + exper.getUser_id() );
		}
		if (!StringUtil.isEmptyString(exper.getExper_title())) {
			sBuilder.append(" and s.exper_title like '%" + exper.getExper_title() +"%'");
		}
		
		long count = (Long)BaseDao.executeQueryObject(sBuilder.toString(), null, conn);
		sum = (int)count;
		return sum;
	}
	
	public int  getExperId(User user, Connection conn){
		int exper_id = 0;
		StringBuilder sBuilder = new StringBuilder();
		sBuilder.append("SELECT max(exper_id) FROM exper WHERE user_id="+user.getUser_id());
		
		long count = (Integer)BaseDao.executeQueryObject(sBuilder.toString(), null, conn);
		exper_id = (int)count;
		return exper_id;
	}

}
