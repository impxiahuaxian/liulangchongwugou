package com.nkl.page.dao;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.List;

import com.nkl.page.domain.Race;
import com.nkl.common.dao.BaseDao;
import com.nkl.common.util.StringUtil;

public class RaceDao {

	public int addRace(Race race, Connection conn){
		String sql = "INSERT INTO race(race_id,task_id,user_id,race_date,race_desc,race_score,race_flag) values(null,?,?,?,?,?,?)";
		Object[] params = new Object[] {
			race.getTask_id(),
			race.getUser_id(),
			race.getRace_date(),
			race.getRace_desc(),
			race.getRace_score(), 
			race.getRace_flag()

		};
		return BaseDao.executeUpdate(sql, params, conn );
	}


	public int delRace(String race_id, Connection conn){
		String sql = "DELETE FROM race WHERE race_id=?";

		Object[] params = new Object[] { new Integer(race_id)};
		return BaseDao.executeUpdate(sql, params, conn);
	}

	public int delRaces(String[] race_ids, Connection conn){
		StringBuilder sBuilder = new StringBuilder();
		for (int i = 0; i <race_ids.length; i++) {
			sBuilder.append("?");
			if (i !=race_ids.length-1) {
				sBuilder.append(",");
			}
		}
		String sql = "DELETE FROM race WHERE race_id IN(" +sBuilder.toString()+")";

		Object[] params = race_ids;

		return BaseDao.executeUpdate(sql, params, conn);
	}

	public int updateRace(Race race, Connection conn){
		StringBuilder sBuilder = new StringBuilder();
		sBuilder.append("UPDATE race SET race_id = " + race.getRace_id() +" ");
		if (race.getRace_score()!=0) {
			sBuilder.append(" ,race_score= " + race.getRace_score() +" ");
		}
		if (race.getRace_flag()!=0) {
			sBuilder.append(" ,race_flag = " + race.getRace_flag() +" ");
		}
		
		sBuilder.append(" where race_id = " + race.getRace_id() +" ");

		Object[] params = null;
		return BaseDao.executeUpdate(sBuilder.toString(), params, conn);
	}
	
	public int updateRaceByTaskId(int task_id, Connection conn){
		StringBuilder sBuilder = new StringBuilder();
		sBuilder.append("UPDATE race SET race_flag = 2 WHERE race_flag = 1 AND task_id = " + task_id +" ");
		Object[] params = null;
		return BaseDao.executeUpdate(sBuilder.toString(), params, conn);
	}
	
	public Race getRace(Race race, Connection conn){
		Race _race=null;
		StringBuilder sBuilder = new StringBuilder();
		sBuilder.append("SELECT b.*,u.real_name,u.user_phone,u.user_address,u.user_mail,u.user_level,t.task_name,t.task_status,t.task_type,t.task_age " +
				"FROM race b join user u on b.user_id=u.user_id join task t on b.task_id=t.task_id WHERE 1=1");
		if (race.getRace_id()!=0) {
			sBuilder.append(" and race_id = " + race.getRace_id() +" ");
		}
		if (race.getUser_id()!=0) {
			sBuilder.append(" and b.user_id = " + race.getUser_id() +" ");
		}
		if (race.getTask_id()!=0) {
			sBuilder.append(" and b.task_id = " + race.getTask_id() +" ");
		}

		List<Object> list = BaseDao.executeQuery(Race.class.getName(), sBuilder.toString(), null, conn);
		if (list != null && list.size() > 0) {
			 _race = (Race)list.get(0);
		}
		return _race;
	}

	public List<Race>  listRaces(Race race, Connection conn){
		List<Race> races = null;
		StringBuilder sBuilder = new StringBuilder();
		sBuilder.append("SELECT * FROM (");
		sBuilder.append("SELECT b.*,u.real_name,u.user_phone,u.user_address,u.user_mail,u.user_level,t.task_name,t.task_status,t.task_type,t.task_age " +
				"FROM race b join user u on b.user_id=u.user_id join task t on b.task_id=t.task_id WHERE 1=1");
		if (race.getRace_id()!=0) {
			sBuilder.append(" and race_id = " + race.getRace_id() +" ");
		}
		if (race.getTask_id()!=0) {
			sBuilder.append(" and b.task_id = " + race.getTask_id() +" ");
		}
		if (!StringUtil.isEmptyString(race.getTask_name())) {
			sBuilder.append(" and t.task_name like '%" + race.getTask_name() +"%' ");
		}
		if (race.getTask_status()!=0) {
			sBuilder.append(" and t.task_status = " + race.getTask_status() +" ");
		}
		if (race.getUser_id()!=0) {
			sBuilder.append(" and b.user_id = " + race.getUser_id() +" ");
		}
		if (!StringUtil.isEmptyString(race.getReal_name())) {
			sBuilder.append(" and u.real_name like '%" + race.getReal_name() +"%' ");
		}
		if (!StringUtil.isEmptyString(race.getUser_address())) {
			sBuilder.append(" and u.user_address like '%" + race.getUser_address() +"%' ");
		}
		if (race.getUser_levelMin()!=0) {
			sBuilder.append(" and u.user_level >= " + race.getUser_levelMin() +" ");
		}
		if (race.getUser_levelMax()!=0) {
			sBuilder.append(" and u.user_level <= " + race.getUser_levelMax() +" ");
		}
		if (race.getRace_flag()!=0) {
			sBuilder.append(" and race_flag = " + race.getRace_flag() +" ");
		}
		sBuilder.append(" order by race_id desc) t");

		if (race.getStart() != -1) {
			sBuilder.append(" limit " + race.getStart() + "," + race.getLimit());
		}

		List<Object> list = BaseDao.executeQuery(Race.class.getName(), sBuilder.toString(), null, conn);
		if (list != null && list.size() > 0) {
			races = new ArrayList<Race>();
			for (Object object : list) {
				races.add((Race)object);
			}
		}
		return races;
	}

	public int  listRacesCount(Race race, Connection conn){
		int sum = 0;
		StringBuilder sBuilder = new StringBuilder();
		sBuilder.append("SELECT count(*) FROM race b join user u on b.user_id=u.user_id join task t on b.task_id=t.task_id WHERE 1=1");

		if (race.getRace_id()!=0) {
			sBuilder.append(" and race_id = " + race.getRace_id() +" ");
		}
		if (race.getTask_id()!=0) {
			sBuilder.append(" and b.task_id = " + race.getTask_id() +" ");
		}
		if (!StringUtil.isEmptyString(race.getTask_name())) {
			sBuilder.append(" and t.task_name like '%" + race.getTask_name() +"%' ");
		}
		if (race.getTask_status()!=0) {
			sBuilder.append(" and t.task_status = " + race.getTask_status() +" ");
		}
		if (race.getUser_id()!=0) {
			sBuilder.append(" and b.user_id = " + race.getUser_id() +" ");
		}
		if (!StringUtil.isEmptyString(race.getReal_name())) {
			sBuilder.append(" and u.real_name like '%" + race.getReal_name() +"%' ");
		}
		if (!StringUtil.isEmptyString(race.getUser_address())) {
			sBuilder.append(" and u.user_address like '%" + race.getUser_address() +"%' ");
		}
		if (race.getUser_levelMin()!=0) {
			sBuilder.append(" and u.user_level >= " + race.getUser_levelMin() +" ");
		}
		if (race.getUser_levelMax()!=0) {
			sBuilder.append(" and u.user_level <= " + race.getUser_levelMax() +" ");
		}
		if (race.getRace_flag()!=0) {
			sBuilder.append(" and race_flag = " + race.getRace_flag() +" ");
		}

		long count = (Long)BaseDao.executeQueryObject(sBuilder.toString(), null, conn);
		sum = (int)count;
		return sum;
	}

}
