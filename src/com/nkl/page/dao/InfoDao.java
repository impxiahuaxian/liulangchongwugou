package com.nkl.page.dao;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.List;

import com.nkl.common.dao.BaseDao;
import com.nkl.common.util.StringUtil;
import com.nkl.page.domain.Info;
import com.nkl.page.domain.User;

public class InfoDao {

	public int addInfo(Info info, Connection conn){
		String sql = "INSERT INTO info(info_id,info_title,info_content,info_admin,info_date) values(null,?,?,?,?)";
		Object[] params = new Object[] {
			info.getInfo_title(),
			info.getInfo_content(),
			info.getInfo_admin(), 
			info.getInfo_date()
		};
		return BaseDao.executeUpdate(sql, params, conn );
	}

	public int delInfo(String info_id, Connection conn){
		String sql = "DELETE FROM info WHERE info_id=?";

		Object[] params = new Object[] { new Integer(info_id)};
		return BaseDao.executeUpdate(sql, params, conn);
	}

	public int delInfos(String[] info_ids, Connection conn){
		StringBuilder sBuilder = new StringBuilder();
		for (int i = 0; i <info_ids.length; i++) {
			sBuilder.append("?");
			if (i !=info_ids.length-1) {
				sBuilder.append(",");
			}
		}
		String sql = "DELETE FROM info WHERE info_id IN(" +sBuilder.toString()+")";

		Object[] params = info_ids;

		return BaseDao.executeUpdate(sql, params, conn);	
	}
	
	public int updateInfo(Info info, Connection conn){
		StringBuilder sBuilder = new StringBuilder();
		sBuilder.append("UPDATE info SET info_id = " + info.getInfo_id() +" ");
		if (!StringUtil.isEmptyString(info.getInfo_title())) {
			sBuilder.append(" ,info_title = '" + info.getInfo_title()+"'" );
		}
		if (!StringUtil.isEmptyString(info.getInfo_content())) {
			sBuilder.append(" ,info_content = '" + info.getInfo_content()+"'" );
		}
		if (!StringUtil.isEmptyString(info.getInfo_admin())) {
			sBuilder.append(" ,info_admin = '" + info.getInfo_admin()+"'" );
		}
		sBuilder.append(" where info_id = " + info.getInfo_id() );

		Object[] params = null;
		return BaseDao.executeUpdate(sBuilder.toString(), params, conn);	}

	public Info getInfo(Info info, Connection conn){
		Info _info=null;
		StringBuilder sBuilder = new StringBuilder();
		sBuilder.append("SELECT s.* From info s ");
		sBuilder.append(" WHERE s.info_id = " + info.getInfo_id() );

		List<Object> list = BaseDao.executeQuery(Info.class.getName(), sBuilder.toString(), null, conn);
		if (list != null && list.size() > 0) {
			 _info = (Info)list.get(0);
		}
		return _info;
	}

	public List<Info>  listInfos(Info info, Connection conn){
		List<Info> infos = null;
		StringBuilder sBuilder = new StringBuilder();
		sBuilder.append("SELECT * FROM (");
		sBuilder.append("SELECT s.* FROM info s ");
		sBuilder.append(" WHERE 1=1 ");
		if (info.getInfo_id()!=0) {
			sBuilder.append(" and s.info_id = " + info.getInfo_id() );
		}
		if (!StringUtil.isEmptyString(info.getInfo_title())) {
			sBuilder.append(" and s.info_title like '%" + info.getInfo_title() +"%'");
		}
		
		sBuilder.append(" order by s.info_date desc,s.info_id asc) t");
		
		if (info.getStart() != -1) {
			sBuilder.append(" limit " + info.getStart() + "," + info.getLimit());
		}

		List<Object> list = BaseDao.executeQuery(Info.class.getName(), sBuilder.toString(), null, conn);
		if (list != null && list.size() > 0) {
			infos = new ArrayList<Info>();
			for (Object object : list) {
				infos.add((Info)object);
			}
		}
		return infos;
	}
	
	public int  listInfosCount(Info info, Connection conn){
		int sum = 0;
		StringBuilder sBuilder = new StringBuilder();
		sBuilder.append("SELECT count(*) FROM info s ");
		sBuilder.append(" WHERE 1=1");
		if (info.getInfo_id()!=0) {
			sBuilder.append(" and s.info_id = " + info.getInfo_id() );
		}
		if (!StringUtil.isEmptyString(info.getInfo_title())) {
			sBuilder.append(" and s.info_title like '%" + info.getInfo_title() +"%'");
		}
		
		long count = (Long)BaseDao.executeQueryObject(sBuilder.toString(), null, conn);
		sum = (int)count;
		return sum;
	}
	
	public int  getInfoId(User user, Connection conn){
		int info_id = 0;
		StringBuilder sBuilder = new StringBuilder();
		sBuilder.append("SELECT max(info_id) FROM info WHERE user_id="+user.getUser_id());
		
		long count = (Integer)BaseDao.executeQueryObject(sBuilder.toString(), null, conn);
		info_id = (int)count;
		return info_id;
	}

}
