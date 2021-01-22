package com.nkl.page.dao;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.List;

import com.nkl.page.domain.Task;
import com.nkl.common.dao.BaseDao;
import com.nkl.common.util.StringUtil;

public class TaskDao {

	public int addTask(Task task, Connection conn){
		String sql = "INSERT INTO task(task_id,user_id,user_phone,user_address,user_mail,task_name,task_type,task_pic,task_desc,task_age,task_start,task_end,task_require,task_status) values(null,?,?,?,?,?,?,?,?,?,?,?,?,?)";
		Object[] params = new Object[] {
			task.getUser_id(),
			task.getUser_phone(), 
			task.getUser_address(),
			task.getUser_mail(),
			task.getTask_name(),
			task.getTask_type(),
			task.getTask_pic(),
			task.getTask_desc(),
			task.getTask_age(),
			task.getTask_start(),
			task.getTask_end(),
			task.getTask_require(),
			task.getTask_status()

		};
		return BaseDao.executeUpdate(sql, params, conn );
	}

	public int delTask(String task_id, Connection conn){
		String sql = "DELETE FROM task WHERE task_id=?";

		Object[] params = new Object[] { new Integer(task_id)};
		return BaseDao.executeUpdate(sql, params, conn);
	}

	public int delTasks(String[] task_ids, Connection conn){
		StringBuilder sBuilder = new StringBuilder();
		for (int i = 0; i <task_ids.length; i++) {
			sBuilder.append("?");
			if (i !=task_ids.length-1) {
				sBuilder.append(",");
			}
		}
		String sql = "DELETE FROM task WHERE task_id IN(" +sBuilder.toString()+")";

		Object[] params = task_ids;

		return BaseDao.executeUpdate(sql, params, conn);
	}
	
	public int updateTaskStatus(Connection conn){
		String sql = "UPDATE task SET task_status=1 WHERE task_status=2 and DATE_ADD(task_end,INTERVAL 1 DAY) < curdate()";
		String sql2 = "UPDATE race SET race_flag=2 WHERE race_flag=1 and task_id IN(select task_id from task where task_status=2)";
		Object[] params = null;
		BaseDao.executeUpdate(sql, params, conn);
		return BaseDao.executeUpdate(sql2, params, conn);
	}

	public int updateTask(Task task, Connection conn){
		StringBuilder sBuilder = new StringBuilder();
		sBuilder.append("UPDATE task SET task_id = " + task.getTask_id() +" ");
		if (!StringUtil.isEmptyString(task.getUser_phone())) {
			sBuilder.append(" ,user_phone = '" + task.getUser_phone() +"' ");
		}
		if (!StringUtil.isEmptyString(task.getUser_address())) {
			sBuilder.append(" ,user_address = '" + task.getUser_address() +"' ");
		}
		if (!StringUtil.isEmptyString(task.getUser_mail())) {
			sBuilder.append(" ,user_mail = '" + task.getUser_mail() +"' ");
		}
		if (!StringUtil.isEmptyString(task.getTask_name())) {
			sBuilder.append(" ,task_name = '" + task.getTask_name() +"' ");
		}
		if (!StringUtil.isEmptyString(task.getTask_type())) {
			sBuilder.append(" ,task_type = '" + task.getTask_type() +"' ");
		}
		if (!StringUtil.isEmptyString(task.getTask_pic())) {
			sBuilder.append(" ,task_pic = '" + task.getTask_pic() +"' ");
		}
		if (task.getTask_age()!=0) {
			sBuilder.append(" ,task_age = " + task.getTask_age() +" ");
		}
		if (!StringUtil.isEmptyString(task.getTask_desc())) {
			sBuilder.append(" ,task_desc = '" + task.getTask_desc() +"' ");
		}
		if (!StringUtil.isEmptyString(task.getTask_start())) {
			sBuilder.append(" ,task_start = '" + task.getTask_start() +"' ");
		}
		if (!StringUtil.isEmptyString(task.getTask_end())) {
			sBuilder.append(" ,task_end = '" + task.getTask_end() +"' ");
		}
		if (!StringUtil.isEmptyString(task.getTask_require())) {
			sBuilder.append(" ,task_require = '" + task.getTask_require() +"' ");
		}
		if (task.getTask_status()!=0) {
			sBuilder.append(" ,task_status = " + task.getTask_status() +" ");
		}
		
		sBuilder.append(" where task_id = " + task.getTask_id() +" ");

		Object[] params = null;
		return BaseDao.executeUpdate(sBuilder.toString(), params, conn);
	}

	public Task getTask(Task task, Connection conn){
		Task _task=null;
		StringBuilder sBuilder = new StringBuilder();
		sBuilder.append("SELECT b.*,u.real_name,u.nick_name,u2.real_name race_user FROM task b join user u on b.user_id=u.user_id ");
		sBuilder.append("  left join race r on r.task_id=b.task_id and r.race_flag in ('3','4') ");
		sBuilder.append("  left join user u2 on u2.user_id=r.user_id  WHERE 1=1");
		if (task.getTask_id()!=0) {
			sBuilder.append(" and b.task_id = " + task.getTask_id() +" ");
		}

		List<Object> list = BaseDao.executeQuery(Task.class.getName(), sBuilder.toString(), null, conn);
		if (list != null && list.size() > 0) {
			 _task = (Task)list.get(0);
		}
		return _task;
	}

	public List<Task>  listTasks(Task task, Connection conn){
		List<Task> tasks = null;
		StringBuilder sBuilder = new StringBuilder();
		sBuilder.append("SELECT * FROM (");
		sBuilder.append("SELECT b.*,u.real_name,u.nick_name,u2.real_name race_user FROM task b join user u on b.user_id=u.user_id ");
		sBuilder.append("  left join race r on r.task_id=b.task_id and r.race_flag in ('3','4') ");
		sBuilder.append("  left join user u2 on u2.user_id=r.user_id  WHERE 1=1");

		if (task.getTask_id()!=0) {
			sBuilder.append(" and b.task_id = " + task.getTask_id() +" ");
		}
		if (task.getUser_id()!=0) {
			sBuilder.append(" and b.user_id = " + task.getUser_id() +" ");
		}
		if (!StringUtil.isEmptyString(task.getTask_name())) {
			sBuilder.append(" and b.task_name like '%" + task.getTask_name() +"%' ");
		}
		if (!StringUtil.isEmptyString(task.getTask_type())) {
			sBuilder.append(" and b.task_type like '%" + task.getTask_type() +"%' ");
		}
		if (task.getTask_status()!=0) {
			sBuilder.append(" and b.task_status = " + task.getTask_status() +" ");
		}
		sBuilder.append(" order by b.task_id desc) t");

		if (task.getStart() != -1) {
			sBuilder.append(" limit " + task.getStart() + "," + task.getLimit());
		}

		List<Object> list = BaseDao.executeQuery(Task.class.getName(), sBuilder.toString(), null, conn);
		if (list != null && list.size() > 0) {
			tasks = new ArrayList<Task>();
			for (Object object : list) {
				tasks.add((Task)object);
			}
		}
		return tasks;
	}

	public int  listTasksCount(Task task, Connection conn){
		int sum = 0;
		StringBuilder sBuilder = new StringBuilder();
		sBuilder.append("SELECT count(*) FROM task b join user u on b.user_id=u.user_id ");
		sBuilder.append("  left join race r on r.task_id=b.task_id and r.race_flag in ('3','4') ");
		sBuilder.append("  left join user u2 on u2.user_id=r.user_id  WHERE 1=1");

		if (task.getTask_id()!=0) {
			sBuilder.append(" and b.task_id = " + task.getTask_id() +" ");
		}
		if (task.getUser_id()!=0) {
			sBuilder.append(" and b.user_id = " + task.getUser_id() +" ");
		}
		if (!StringUtil.isEmptyString(task.getTask_name())) {
			sBuilder.append(" and b.task_name like '%" + task.getTask_name() +"%' ");
		}
		if (!StringUtil.isEmptyString(task.getTask_type())) {
			sBuilder.append(" and b.task_type like '%" + task.getTask_type() +"%' ");
		}
		if (task.getTask_status()!=0) {
			sBuilder.append(" and b.task_status = " + task.getTask_status() +" ");
		}

		long count = (Long)BaseDao.executeQueryObject(sBuilder.toString(), null, conn);
		sum = (int)count;
		return sum;
	}

}
