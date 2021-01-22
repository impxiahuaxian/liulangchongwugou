package com.nkl.admin.manager;

import java.sql.Connection;
import java.util.Date;
import java.util.List;

import com.nkl.common.dao.BaseDao;
import com.nkl.common.util.DateUtil;
import com.nkl.common.util.Md5;
import com.nkl.common.util.StringUtil;
import com.nkl.common.util.Transcode;
import com.nkl.page.dao.ExperDao;
import com.nkl.page.dao.InfoDao;
import com.nkl.page.dao.LostDao;
import com.nkl.page.dao.RaceDao;
import com.nkl.page.dao.TaskDao;
import com.nkl.page.dao.UserDao;
import com.nkl.page.domain.Info;
import com.nkl.page.domain.User;

public class AdminManager {

	UserDao userDao = new UserDao();
	ExperDao experDao = new ExperDao();
	InfoDao infoDao = new InfoDao();
	TaskDao taskDao = new TaskDao();
	RaceDao raceDao = new RaceDao();
	LostDao lostDao = new LostDao();
	
	/**
	 * @Title: listUsers
	 * @Description: 用户查询 
	 * @param user
	 * @return List<User>
	 */
	public List<User>  listUsers(User user,int[] sum){
		Connection conn = BaseDao.getConnection();
		if (sum!=null) {
			sum[0] = userDao.listUsersCount(user, conn);
		}
		List<User> users = userDao.listUsers(user,conn);
		
		BaseDao.closeDB(null, null, conn);
		return users;
	}
	
	/**
	 * @Title: getUser
	 * @Description: 用户查询
	 * @param user
	 * @return User
	 */
	public User  getUser(User user){
		Connection conn = BaseDao.getConnection();
		User _user = userDao.getUser(user, conn);
		BaseDao.closeDB(null, null, conn);
		return _user;
	}
	 
	/**
	 * @Title: addUser
	 * @Description: 添加用户
	 * @param user
	 * @return void
	 */
	public void  addUser(User user){
		Connection conn = BaseDao.getConnection();
		if (!StringUtil.isEmptyString(user.getUser_pass())) {
			user.setUser_pass(Md5.makeMd5(user.getUser_pass()));
		}
		userDao.addUser(user, conn);
		BaseDao.closeDB(null, null, conn);
	}
	
	/**
	 * @Title: updateUser
	 * @Description: 更新用户信息
	 * @param user
	 * @return void
	 */
	public void  updateUser(User user){
		Connection conn = BaseDao.getConnection();
		if (!StringUtil.isEmptyString(user.getUser_pass())) {
			user.setUser_pass(Md5.makeMd5(user.getUser_pass()));
		}
		userDao.updateUser(user, conn);
		BaseDao.closeDB(null, null, conn);
	}
	
	/**
	 * @Title: delUsers
	 * @Description: 删除用户信息
	 * @param user
	 * @return void
	 */
	public void  delUsers(User user){
		Connection conn = BaseDao.getConnection();
		userDao.delUsers(user.getIds().split(","), conn);
		BaseDao.closeDB(null, null, conn);
	}
	
	/**
	 * @Title: listInfos
	 * @Description: 网站推送查询
	 * @param info
	 * @return List<Info>
	 */
	public List<Info> listInfos(Info info, int[] sum) {
		Connection conn = BaseDao.getConnection();
		if (sum != null) {
			sum[0] = infoDao.listInfosCount(info, conn);
		}
		List<Info> infos = infoDao.listInfos(info, conn);

		BaseDao.closeDB(null, null, conn);
		return infos;
	}

	/**
	 * @Title: queryInfo
	 * @Description: 网站推送查询
	 * @param info
	 * @return Info
	 */
	public Info queryInfo(Info info) {
		Connection conn = BaseDao.getConnection();
		Info _info = infoDao.getInfo(info, conn);
		BaseDao.closeDB(null, null, conn);
		return _info;
	}

	/**
	 * @Title: addInfo
	 * @Description: 添加网站推送
	 * @param info
	 * @return void
	 */
	public void addInfo(Info info) {
		Connection conn = BaseDao.getConnection();
		if (!StringUtil.isEmptyString(info.getInfo_content())) {
			info.setInfo_content(Transcode.htmlEncode(info.getInfo_content()));
		}
		info.setInfo_date(DateUtil.dateToDateString(new Date()));
		infoDao.addInfo(info, conn);
		BaseDao.closeDB(null, null, conn);
	}

	/**
	 * @Title: updateInfo
	 * @Description: 更新网站推送信息
	 * @param info
	 * @return void
	 */
	public void updateInfo(Info info) {
		Connection conn = BaseDao.getConnection();
		if (!StringUtil.isEmptyString(info.getInfo_content())) {
			info.setInfo_content(Transcode.htmlEncode(info.getInfo_content()));
		}
		infoDao.updateInfo(info, conn);
		BaseDao.closeDB(null, null, conn);
	}

	/**
	 * @Title: delInfo
	 * @Description: 删除网站推送信息
	 * @param info
	 * @return void
	 */
	public void delInfos(Info info) {
		Connection conn = BaseDao.getConnection();
		infoDao.delInfos(info.getIds().split(","), conn);
		BaseDao.closeDB(null, null, conn);
	}
	
}
