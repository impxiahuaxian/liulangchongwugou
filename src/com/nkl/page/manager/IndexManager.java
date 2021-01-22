package com.nkl.page.manager;

import java.sql.Connection;
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
import com.nkl.page.dao.SblogReplyDao;
import com.nkl.page.dao.TaskDao;
import com.nkl.page.dao.UserDao;
import com.nkl.page.domain.Exper;
import com.nkl.page.domain.Info;
import com.nkl.page.domain.Lost;
import com.nkl.page.domain.Race;
import com.nkl.page.domain.SblogReply;
import com.nkl.page.domain.Task;
import com.nkl.page.domain.User;

public class IndexManager {

	UserDao userDao = new UserDao();
	ExperDao experDao = new ExperDao();
	InfoDao infoDao = new InfoDao();
	TaskDao taskDao = new TaskDao();
	RaceDao raceDao = new RaceDao();
	LostDao lostDao = new LostDao();
	SblogReplyDao sblogReplyDao = new SblogReplyDao();
	
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
	 * @Title: listTasks
	 * @Description: 宠物寄养查询
	 * @param task
	 * @return List<Task>
	 */
	public List<Task> listTasks(Task task, int[] sum) {
		Connection conn = BaseDao.getConnection();
		//更新过期任务为竞标结束
		taskDao.updateTaskStatus(conn);
		//查询宠物寄养
		if (sum != null) {
			sum[0] = taskDao.listTasksCount(task, conn);
		}
		List<Task> tasks = taskDao.listTasks(task, conn);

		BaseDao.closeDB(null, null, conn);
		return tasks;
	}
	
	/**
	 * @Title: queryTask
	 * @Description: 宠物寄养查询
	 * @param task
	 * @return Task
	 */
	public Task queryTask(Task task) {
		Connection conn = BaseDao.getConnection();
		Task _task = taskDao.getTask(task, conn);
		BaseDao.closeDB(null, null, conn);
		return _task;
	}
	
	/**
	 * @Title: addTask
	 * @Description: 发布宠物寄养
	 * @param race
	 * @return Task
	 */
	public void addTask(Task task) {
		Connection conn = BaseDao.getConnection();
		if (!StringUtil.isEmptyString(task.getTask_desc())) {
			task.setTask_desc(Transcode.htmlEncode(task.getTask_desc()));
		}
		if (!StringUtil.isEmptyString(task.getTask_require())) {
			task.setTask_require(Transcode.htmlEncode(task.getTask_require()));
		}
		task.setTask_status(1);//1-待领养
		taskDao.addTask(task, conn);
		BaseDao.closeDB(null, null, conn);
	}
	
	/**
	 * @Title: updateTask
	 * @Description: 更新宠物寄养
	 * @param race
	 * @return Task
	 */
	public void updateTask(Task task) {
		Connection conn = BaseDao.getConnection();
		if (!StringUtil.isEmptyString(task.getTask_desc())) {
			task.setTask_desc(Transcode.htmlEncode(task.getTask_desc()));
		}
		if (!StringUtil.isEmptyString(task.getTask_require())) {
			task.setTask_require(Transcode.htmlEncode(task.getTask_require()));
		}
		taskDao.updateTask(task, conn);
		BaseDao.closeDB(null, null, conn);
	}
	
	/**
	 * @Title: delTask
	 * @Description: 撤销宠物寄养
	 * @param race
	 * @return Task
	 */
	public void delTask(Task task) {
		Connection conn = BaseDao.getConnection();
		taskDao.delTask(task.getTask_id()+"", conn);
		BaseDao.closeDB(null, null, conn);
	}
	
	/**
	 * @Title: addRace
	 * @Description: 添加领养申请
	 * @param race
	 * @return Race
	 */
	public void addRace(Race race) {
		Connection conn = BaseDao.getConnection();
		race.setRace_flag(1);//竞标中
		race.setRace_date(DateUtil.getCurDate());
		raceDao.addRace(race, conn);
		BaseDao.closeDB(null, null, conn);
	}
	
	/**
	 * @Title: listRaces
	 * @Description: 领养申请查询
	 * @param race
	 * @return List<Race>
	 */
	public List<Race> listRaces(Race race, int[] sum) {
		Connection conn = BaseDao.getConnection();
		if (sum != null) {
			sum[0] = raceDao.listRacesCount(race, conn);
		}
		List<Race> races = raceDao.listRaces(race, conn);

		BaseDao.closeDB(null, null, conn);
		return races;
	}

	/**
	 * @Title: queryRace
	 * @Description: 领养申请查询
	 * @param race
	 * @return Race
	 */
	public Race queryRace(Race race) {
		Connection conn = BaseDao.getConnection();
		Race _race = raceDao.getRace(race, conn);
		BaseDao.closeDB(null, null, conn);
		return _race;
	}
	
	/**
	 * @Title: selectRace
	 * @Description: 确定领养人
	 * @param race
	 * @return selectRace
	 */
	public void selectRace(Race race) {
		Connection conn = BaseDao.getConnection();
		//查询领养信息
		race = raceDao.getRace(race, conn);
		race.setRace_flag(3);//3：审批通过
		raceDao.updateRace(race, conn);
		
		//更新其他竞标者为-未通过
		raceDao.updateRaceByTaskId(race.getTask_id(), conn);
		
		//更新宠物寄养状态
		Task task = new Task();
		task.setTask_id(race.getTask_id());
		task.setTask_status(2);//4-已领养
		taskDao.updateTask(task, conn);
		
		BaseDao.closeDB(null, null, conn);
	}
	
	/**
	 * @Title: updateRaceScore
	 * @Description: 对领养人打分--前台传递领养人ID
	 * @param race
	 * @return selectRace
	 */
	public void updateRaceScore(Race race) {
		Connection conn = BaseDao.getConnection();
		//更新打分信息
		raceDao.updateRace(race, conn);
		if (race.getRace_score()==1) {
			//更新领养人信用等级
			User user = new User();
			user.setUser_id(race.getUser_id());
			user.setUser_level(1);
			userDao.updateUserLevel(user, conn);
		}else if (race.getRace_score()==3) {
			//更新领养人信用等级
			User user = new User();
			user.setUser_id(race.getUser_id());
			user.setUser_level(-1);
			userDao.updateUserLevel(user, conn);
		}
		
		BaseDao.closeDB(null, null, conn);
	}
	
	/**
	 * @Title: listInfos
	 * @Description: 网站动态查询
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
	 * @Description: 网站动态查询
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
	 * @Title: listLosts
	 * @Description: 宠物走失查询
	 * @param lost
	 * @return List<Lost>
	 */
	public List<Lost> listLosts(Lost lost, int[] sum) {
		Connection conn = BaseDao.getConnection();
		//查询宠物走失
		if (sum != null) {
			sum[0] = lostDao.listLostsCount(lost, conn);
		}
		List<Lost> losts = lostDao.listLosts(lost, conn);

		BaseDao.closeDB(null, null, conn);
		return losts;
	}
	
	/**
	 * @Title: queryLost
	 * @Description: 宠物走失查询
	 * @param lost
	 * @return Lost
	 */
	public Lost queryLost(Lost lost) {
		Connection conn = BaseDao.getConnection();
		Lost _lost = lostDao.getLost(lost, conn);
		BaseDao.closeDB(null, null, conn);
		return _lost;
	}
	
	/**
	 * @Title: addLost
	 * @Description: 发布宠物走失
	 * @param race
	 * @return Lost
	 */
	public void addLost(Lost lost) {
		Connection conn = BaseDao.getConnection();
		if (!StringUtil.isEmptyString(lost.getTask_desc())) {
			lost.setTask_desc(Transcode.htmlEncode(lost.getTask_desc()));
		}
		lostDao.addLost(lost, conn);
		BaseDao.closeDB(null, null, conn);
	}
	
	/**
	 * @Title: updateLost
	 * @Description: 更新宠物走失
	 * @param race
	 * @return Lost
	 */
	public void updateLost(Lost lost) {
		Connection conn = BaseDao.getConnection();
		if (!StringUtil.isEmptyString(lost.getTask_desc())) {
			lost.setTask_desc(Transcode.htmlEncode(lost.getTask_desc()));
		}
		lostDao.updateLost(lost, conn);
		BaseDao.closeDB(null, null, conn);
	}
	
	/**
	 * @Title: delLost
	 * @Description: 撤销宠物走失
	 * @param race
	 * @return Lost
	 */
	public void delLost(Lost lost) {
		Connection conn = BaseDao.getConnection();
		lostDao.delLost(lost.getLost_id()+"", conn);
		BaseDao.closeDB(null, null, conn);
	} 
	
	/**
	 * @Title: listExpers
	 * @Description: 养宠经验查询
	 * @param exper
	 * @return List<Exper>
	 */
	public List<Exper> listExpers(Exper exper, int[] sum) {
		Connection conn = BaseDao.getConnection();
		//查询养宠经验
		if (sum != null) {
			sum[0] = experDao.listExpersCount(exper, conn);
		}
		List<Exper> expers = experDao.listExpers(exper, conn);

		BaseDao.closeDB(null, null, conn);
		return expers;
	}
	
	/**
	 * @Title: queryExper
	 * @Description: 养宠经验查询
	 * @param exper
	 * @return Exper
	 */
	public Exper queryExper(Exper exper) {
		Connection conn = BaseDao.getConnection();
		Exper _exper = experDao.getExper(exper, conn);
		BaseDao.closeDB(null, null, conn);
		return _exper;
	}
	
	/**
	 * @Title: addExper
	 * @Description: 发布养宠经验
	 * @param race
	 * @return Exper
	 */
	public void addExper(Exper exper) {
		Connection conn = BaseDao.getConnection();
		if (!StringUtil.isEmptyString(exper.getExper_content())) {
			exper.setExper_content(Transcode.htmlEncode(exper.getExper_content()));
		}
		exper.setExper_date(DateUtil.getCurDateTime());
		experDao.addExper(exper, conn);
		BaseDao.closeDB(null, null, conn);
	}
	
	/**
	 * @Title: updateExper
	 * @Description: 更新养宠经验
	 * @param race
	 * @return Exper
	 */
	public void updateExper(Exper exper) {
		Connection conn = BaseDao.getConnection();
		if (!StringUtil.isEmptyString(exper.getExper_content())) {
			exper.setExper_content(Transcode.htmlEncode(exper.getExper_content()));
		}
		experDao.updateExper(exper, conn);
		BaseDao.closeDB(null, null, conn);
	}
	
	/**
	 * @Title: delExper
	 * @Description: 撤销养宠经验
	 * @param race
	 * @return Exper
	 */
	public void delExper(Exper exper) {
		Connection conn = BaseDao.getConnection();
		experDao.delExper(exper.getExper_id()+"", conn);
		BaseDao.closeDB(null, null, conn);
	} 
	
	/**
	 * @Title: listSblogReplys
	 * @Description: 查询帖子信息留言回复
	 * @param sblogReply
	 * @return List<SblogReply>
	 */
	public List<SblogReply>  listSblogReplys(SblogReply sblogReply,int[] sum){
		Connection conn = BaseDao.getConnection();
		if (sum!=null) {
			sum[0] = sblogReplyDao.listSblogReplysCount(sblogReply, conn);
		}
		List<SblogReply> sblogReplys = sblogReplyDao.listSblogReplys(sblogReply,conn);
		BaseDao.closeDB(null, null, conn);
		return sblogReplys;
	}
	
	/**
	 * @Title: addSblogReply
	 * @Description: 新增留言回复
	 * @param sblogReply
	 * @return void
	 */
	public void  addSblogReply(SblogReply sblogReply){
		Connection conn = BaseDao.getConnection();
		sblogReply.setReply_date(DateUtil.getCurDateTime());
		sblogReplyDao.addSblogReply(sblogReply, conn);
	}
}
