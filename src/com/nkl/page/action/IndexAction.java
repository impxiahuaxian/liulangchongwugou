package com.nkl.page.action;

import java.util.List;

import com.nkl.common.action.BaseAction;
import com.nkl.common.util.Md5;
import com.nkl.common.util.Param;
import com.nkl.page.domain.Exper;
import com.nkl.page.domain.Info;
import com.nkl.page.domain.Lost;
import com.nkl.page.domain.Race;
import com.nkl.page.domain.SblogReply;
import com.nkl.page.domain.Task;
import com.nkl.page.domain.User;
import com.nkl.page.manager.IndexManager;

public class IndexAction  extends BaseAction {

	private static final long serialVersionUID = 1L;
	IndexManager indexManager = new IndexManager();

	//抓取页面参数
	User paramsUser;
	Task paramsTask;
	Race paramsRace;
	Info paramsInfo;
	Lost paramsLost; 
	Exper paramsExper;
	SblogReply paramsSblogReply;
	String tip;
	
	public String index(){
		try {
			//查询最新网站动态
			Info info = new Info();
			info.setStart(0);
			info.setLimit(8);
			List<Info> infos = indexManager.listInfos(info,null); 
			Param.setAttribute("infos", infos);
			
			//查询最新宠物寄养
			Task task = new Task();
			task.setStart(0);
			task.setLimit(8);
			task.setTask_status(1);
			List<Task> tasks = indexManager.listTasks(task,null); 
			Param.setAttribute("tasks", tasks);
			
			//查询最新宠物走失
			Lost lost = new Lost();
			lost.setStart(0);
			lost.setLimit(8);
			List<Lost> losts = indexManager.listLosts(lost,null); 
			Param.setAttribute("losts", losts);
			
			//查询最新养宠经验
			Exper exper = new Exper();
			exper.setStart(0);
			exper.setLimit(8);
			List<Exper> expers = indexManager.listExpers(exper,null); 
			Param.setAttribute("expers", expers);
			
		} catch (Exception e) {
			e.printStackTrace();
			return "error";
		}
		
		return "index";
	}
	
	/**
	 * @Title: listTasks
	 * @Description: 查询宠物寄养
	 * @return String
	 */
	public String listTasks(){
		try {
			if (paramsTask==null) {
				paramsTask = new Task();
			}
			//设置分页信息
			setPagination(paramsTask);
			//总的条数
			int[] sum={0};
			//查询宠物寄养
			paramsTask.setTask_status(1);
			List<Task> tasks = indexManager.listTasks(paramsTask,sum); 
			
			Param.setAttribute("tasks", tasks);
			setTotalCount(sum[0]);
			
		} catch (Exception e) {
			e.printStackTrace();
			return "error";
		}
		
		return "task";
	}
	
	/**
	 * @Title: queryTask
	 * @Description: 查询宠物寄养详情
	 * @return String
	 */
	public String queryTask(){
		try {
			 //得到宠物寄养
			Task task = indexManager.queryTask(paramsTask);
			Param.setAttribute("task", task);
			
		} catch (Exception e) {
			e.printStackTrace();
			return "error";
		}
		
		return "taskDetail";
	}
	
	/**
	 * @Title: addRaceShow
	 * @Description: 新增竞标界面
	 * @return String
	 */
	public String addRaceShow(){
		try {
			//查询宠物寄养
			Task task = indexManager.queryTask(paramsTask);
			Param.setAttribute("task", task);
		} catch (Exception e) {
			e.printStackTrace();
			return "error";
		}
		return "raceAdd";
	}
	
	/**
	 * @Title: addRace
	 * @Description: 新增领养申请
	 * @return String
	 */
	public String addRace(){
		try {
			//查询用户是否已经参与竞标
			Race race = new Race();
			race.setRace_flag(1);
			race.setUser_id(paramsRace.getUser_id());
			race.setTask_id(paramsRace.getTask_id());
			race = indexManager.queryRace(paramsRace);
			if (race!=null) {
				setErrorReason("您已经提交该领养申请！请等待审核。");
				return "error2";
			}
			
			//新增领养申请
			indexManager.addRace(paramsRace);
		} catch (Exception e) {
			e.printStackTrace();
			setErrorReason("提交领养申请失败！");
			return "error2";
		}
		return "success";
	}
	
	/**
	 * @Title: listInfos
	 * @Description: 查询网站动态
	 * @return String
	 */
	public String listInfos(){
		try {
			if (paramsInfo==null) {
				paramsInfo = new Info();
			}
			//设置分页信息
			setPagination(paramsInfo);
			//总的条数
			int[] sum={0};
			//查询网站动态列表
			List<Info> infos = indexManager.listInfos(paramsInfo,sum); 
			
			Param.setAttribute("infos", infos);
			setTotalCount(sum[0]);
			
		} catch (Exception e) {
			e.printStackTrace();
			return "error";
		}
		
		return "info";
	}
	
	/**
	 * @Title: queryInfo
	 * @Description: 查询网站动态
	 * @return String
	 */
	public String queryInfo(){
		try {
			 //得到网站动态
			Info info = indexManager.queryInfo(paramsInfo);
			Param.setAttribute("info", info);
			
		} catch (Exception e) {
			e.printStackTrace();
			return "error";
		}
		
		return "infoDetail";
	}
	
	/**
	 * @Title: listLosts
	 * @Description: 查询宠物走失
	 * @return String
	 */
	public String listLosts(){
		try {
			if (paramsLost==null) {
				paramsLost = new Lost();
			}
			//设置分页信息
			setPagination(paramsLost);
			//总的条数
			int[] sum={0};
			//查询宠物走失列表
			List<Lost> losts = indexManager.listLosts(paramsLost,sum); 
			
			Param.setAttribute("losts", losts);
			setTotalCount(sum[0]);
			
		} catch (Exception e) {
			e.printStackTrace();
			return "error";
		}
		
		return "lost";
	}
	
	/**
	 * @Title: queryLost
	 * @Description: 查询宠物走失
	 * @return String
	 */
	public String queryLost(){
		try {
			 //得到宠物走失
			Lost lost = indexManager.queryLost(paramsLost);
			Param.setAttribute("lost", lost);
			
		} catch (Exception e) {
			e.printStackTrace();
			return "error";
		}
		
		return "lostDetail";
	}
	
	/**
	 * @Title: listExpers
	 * @Description: 查询养宠经验
	 * @return String
	 */
	public String listExpers(){
		try {
			if (paramsExper==null) {
				paramsExper = new Exper();
			}
			//设置分页信息
			setPagination(paramsExper);
			//总的条数
			int[] sum={0};
			//查询养宠经验列表
			List<Exper> expers = indexManager.listExpers(paramsExper,sum); 
			
			Param.setAttribute("expers", expers);
			setTotalCount(sum[0]);
			
		} catch (Exception e) {
			e.printStackTrace();
			return "error";
		}
		
		return "exper";
	}
	
	/**
	 * @Title: queryExper
	 * @Description: 查询养宠经验
	 * @return String
	 */
	public String queryExper(){
		try {
			 //得到养宠经验
			Exper exper = indexManager.queryExper(paramsExper);
			Param.setAttribute("exper", exper);
			
			//查询回复集合
			if (paramsSblogReply==null) {
				paramsSblogReply = new SblogReply();
				paramsSblogReply.setExper_id(paramsExper.getExper_id());
			}
			//分页信息设置
			setPagination(paramsSblogReply);
			int[] sum={0};
			//查询回复集合
			List<SblogReply> sblogReplys = indexManager.listSblogReplys(paramsSblogReply,sum); 
			Param.setAttribute("sblogReplys", sblogReplys);
			setTotalCount(sum[0]);
			
		} catch (Exception e) {
			e.printStackTrace();
			return "error";
		}
		
		return "experDetail";
	}
	
	/**
	 * @Title: addSblogReply
	 * @Description: 新增留言回复
	 * @return String
	 */
	public String addSblogReply(){
		try {
			//新增留言回复
			indexManager.addSblogReply(paramsSblogReply);
			
		} catch (Exception e) {
			e.printStackTrace();
			return "error";
		}
		
		return "success";
	}
	
	/**
	 * @Title: saveUserFront
	 * @Description: 保存修改个人信息
	 * @return String
	 */
	public String saveUserFront(){
		try {
			 //保存修改个人信息
			indexManager.updateUser(paramsUser);
			//更新session
			User userFront = new User();
			userFront.setUser_id(paramsUser.getUser_id());
			userFront = indexManager.getUser(userFront);
			Param.setSession("userFront", userFront);
			
		} catch (Exception e) {
			e.printStackTrace();
			tip = "修改失败";
			return "userInfo";
		}
		tip = "修改成功";
		return "userInfo";
	}
	
	/**
	 * @Title: saveUserFrontPass
	 * @Description: 保存修改个人密码
	 * @return String
	 */
	public String saveUserFrontPass(){
		try {
			 //保存修改个人密码
			User userFront = (User)Param.getSession("userFront");
			String user_opass = Md5.makeMd5(paramsUser.getUser_opass());
			if (!user_opass.equals(userFront.getUser_pass())) {
				tip = "原密码输入错误";
				return "userPwd";
			}
			indexManager.updateUser(paramsUser);
			//更新session
			if (userFront!=null) {
				userFront.setUser_pass(paramsUser.getUser_pass());
				Param.setSession("userFront", userFront);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
			tip = "修改失败";
			return "userPwd";
		}
		tip = "修改成功";
		return "userPwd";
	}
	
	/**
	 * @Title: listMyTasks
	 * @Description: 查询我的宠物寄养
	 * @return String
	 */
	public String listMyTasks(){
		try {
			if (paramsTask==null) {
				paramsTask = new Task();
			}
			//获取用户,用户只能查询自己的宠物寄养
			User userFront = (User)Param.getSession("userFront");
			if (userFront.getUser_type()==1) {
				paramsTask.setUser_id(userFront.getUser_id());
			}
			//设置分页信息
			setPagination(paramsTask);
			//总的条数
			int[] sum={0};
			//查询宠物寄养列表
			List<Task> tasks = indexManager.listTasks(paramsTask,sum); 
			
			Param.setAttribute("tasks", tasks);
			setTotalCount(sum[0]);
			
		} catch (Exception e) {
			e.printStackTrace();
			return "error";
		}
		
		return "taskShow";
	}
	
	/**
	 * @Title: queryMyTask
	 * @Description: 查看宠物寄养详情
	 * @return String
	 */
	public String queryMyTask(){
		try {
			//查询宠物寄养
			Task task = indexManager.queryTask(paramsTask);
			Param.setAttribute("task",task);
			
		} catch (Exception e) {
			e.printStackTrace();
			return "error";
		}
		
		return "taskMyDetail";
	}
	
	/**
	 * @Title: addTaskShow
	 * @Description: 新增宠物寄养界面
	 * @return String
	 */
	public String addTaskShow(){
		return "taskEdit";
	}
	
	/**
	 * @Title: addTask
	 * @Description: 新增宠物寄养
	 * @return String
	 */
	public String addTask(){
		try {
			//新增宠物寄养
			indexManager.addTask(paramsTask);
			
		} catch (Exception e) {
			e.printStackTrace();
			return "error";
		}
		
		return "success";
	}
	
	/**
	 * @Title: editTask
	 * @Description: 编辑宠物寄养界面
	 * @return String
	 */
	public String editTask(){
		try {
			//查询宠物寄养
			Task task = indexManager.queryTask(paramsTask);
			Param.setAttribute("task",task);
			
		} catch (Exception e) {
			e.printStackTrace();
			return "error";
		}
		
		return "taskEdit";
	}
	
	/**
	 * @Title: saveTask
	 * @Description: 保存编辑宠物寄养
	 * @return String
	 */
	public String saveTask(){
		try {
			//编辑宠物寄养
			indexManager.updateTask(paramsTask);
			
		} catch (Exception e) {
			e.printStackTrace();
			return "error";
		}
		
		return "success";
	}
	
	/**
	 * @Title: delTask
	 * @Description: 撤销宠物寄养
	 * @return String
	 */
	public String delTask(){
		try {
			//撤销宠物寄养
			indexManager.delTask(paramsTask);
		} catch (Exception e) {
			e.printStackTrace();
			return "error";
		}
		return "success";
	}
	
	/**
	 * @Title: listRaces
	 * @Description: 查询宠物寄养的申请情况
	 * @return String
	 */
	public String listRaces(){
		try {
			if (paramsRace==null) {
				paramsRace = new Race();
			}
			//设置分页信息
			setPagination(paramsRace);
			//总的条数
			int[] sum={0};
			//查询宠物寄养的申请列表
			List<Race> races = indexManager.listRaces(paramsRace,sum); 
			Param.setAttribute("races", races);
			setTotalCount(sum[0]);
			
			//保存宠物寄养状态
			Param.setAttribute("task_status",paramsRace.getTask_status());
			Param.setAttribute("task_id",paramsRace.getTask_id());
			
		} catch (Exception e) {
			e.printStackTrace();
			return "error";
		}
		
		return "raceShow";
	}
	
	/**
	 * @Title: selectRace
	 * @Description: 确定领养人
	 * @return String
	 */
	public String selectRace(){
		try {
			//选为中标
			indexManager.selectRace(paramsRace);
		} catch (Exception e) {
			e.printStackTrace();
			setErrorReason("确定领养人失败，后台服务器繁忙");
			return "error2";
		}
		return "success";
	}
	
	/**
	 * @Title: updateRaceScoreShow
	 * @Description: 给领养人打分
	 * @return String
	 */
	public String updateRaceScoreShow(){
		try {
			 //得到申请详情
			Race race = indexManager.queryRace(paramsRace);
			Param.setAttribute("race", race);
			
		} catch (Exception e) {
			e.printStackTrace();
			return "error";
		}
		
		return "raceScoreEdit";
	}
	
	/**
	 * @Title: updateRaceScore
	 * @Description: 给领养人打分
	 * @return String
	 */
	public String updateRaceScore(){
		try {
			//给领养人打分
			indexManager.updateRaceScore(paramsRace);
		} catch (Exception e) {
			e.printStackTrace();
			setErrorReason("打分失败，后台服务器繁忙");
			return "error2";
		}
		return "success";
	}
	
	/**
	 * @Title: listMyRaces
	 * @Description: 查询我的领养申请
	 * @return String
	 */
	public String listMyRaces(){
		try {
			if (paramsRace==null) {
				paramsRace = new Race();
			}
			//获取用户,用户只能查询自己的领养申请
			User userFront = (User)Param.getSession("userFront");
			if (userFront.getUser_type()==1) {
				paramsRace.setUser_id(userFront.getUser_id());
			}
			//设置分页信息
			setPagination(paramsRace);
			//总的条数
			int[] sum={0};
			//查询图书借阅列表
			List<Race> races = indexManager.listRaces(paramsRace,sum); 
			
			Param.setAttribute("races", races);
			setTotalCount(sum[0]);
			
		} catch (Exception e) {
			e.printStackTrace();
			return "error";
		}
		
		return "myRaceShow";
	}
	
	/**
	 * @Title: listMyLosts
	 * @Description: 查询我的宠物走失
	 * @return String
	 */
	public String listMyLosts(){
		try {
			if (paramsLost==null) {
				paramsLost = new Lost();
			}
			//获取用户,用户只能查询自己的宠物走失
			User userFront = (User)Param.getSession("userFront");
			if (userFront.getUser_type()==1) {
				paramsLost.setUser_id(userFront.getUser_id());
			}
			//设置分页信息
			setPagination(paramsLost);
			//总的条数
			int[] sum={0};
			//查询宠物走失列表
			List<Lost> losts = indexManager.listLosts(paramsLost,sum); 
			
			Param.setAttribute("losts", losts);
			setTotalCount(sum[0]);
			
		} catch (Exception e) {
			e.printStackTrace();
			return "error";
		}
		
		return "lostShow";
	}
	
	/**
	 * @Title: queryMyLost
	 * @Description: 编辑宠物走失界面
	 * @return String
	 */
	public String queryMyLost(){
		try {
			//查询宠物走失
			Lost lost = indexManager.queryLost(paramsLost);
			Param.setAttribute("lost",lost);
			
		} catch (Exception e) {
			e.printStackTrace();
			return "error";
		}
		
		return "lostMyDetail";
	}
	
	/**
	 * @Title: addLostShow
	 * @Description: 新增宠物走失界面
	 * @return String
	 */
	public String addLostShow(){
		return "lostEdit";
	}
	
	/**
	 * @Title: addLost
	 * @Description: 新增宠物走失
	 * @return String
	 */
	public String addLost(){
		try {
			//新增宠物走失
			indexManager.addLost(paramsLost);
			
		} catch (Exception e) {
			e.printStackTrace();
			return "error";
		}
		
		return "success";
	}
	
	/**
	 * @Title: editLost
	 * @Description: 编辑宠物走失界面
	 * @return String
	 */
	public String editLost(){
		try {
			//查询宠物走失
			Lost lost = indexManager.queryLost(paramsLost);
			Param.setAttribute("lost",lost);
			
		} catch (Exception e) {
			e.printStackTrace();
			return "error";
		}
		
		return "lostEdit";
	}
	
	/**
	 * @Title: saveLost
	 * @Description: 保存编辑宠物走失
	 * @return String
	 */
	public String saveLost(){
		try {
			//编辑宠物走失
			indexManager.updateLost(paramsLost);
			
		} catch (Exception e) {
			e.printStackTrace();
			return "error";
		}
		
		return "success";
	}
	
	/**
	 * @Title: delLost
	 * @Description: 撤销宠物走失
	 * @return String
	 */
	public String delLost(){
		try {
			//撤销宠物走失
			indexManager.delLost(paramsLost);
		} catch (Exception e) {
			e.printStackTrace();
			return "error";
		}
		return "success";
	}
	
	/**
	 * @Title: listMyExpers
	 * @Description: 查询我的养宠经验
	 * @return String
	 */
	public String listMyExpers(){
		try {
			if (paramsExper==null) {
				paramsExper = new Exper();
			}
			//获取用户,用户只能查询自己的养宠经验
			User userFront = (User)Param.getSession("userFront");
			if (userFront.getUser_type()==1) {
				paramsExper.setUser_id(userFront.getUser_id());
			}
			//设置分页信息
			setPagination(paramsExper);
			//总的条数
			int[] sum={0};
			//查询养宠经验列表
			List<Exper> expers = indexManager.listExpers(paramsExper,sum); 
			
			Param.setAttribute("expers", expers);
			setTotalCount(sum[0]);
			
		} catch (Exception e) {
			e.printStackTrace();
			return "error";
		}
		
		return "experShow";
	}
	
	/**
	 * @Title: addExperShow
	 * @Description: 新增养宠经验界面
	 * @return String
	 */
	public String addExperShow(){
		return "experEdit";
	}
	
	/**
	 * @Title: addExper
	 * @Description: 新增养宠经验
	 * @return String
	 */
	public String addExper(){
		try {
			//新增养宠经验
			indexManager.addExper(paramsExper);
			
		} catch (Exception e) {
			e.printStackTrace();
			return "error";
		}
		
		return "success";
	}
	
	/**
	 * @Title: editExper
	 * @Description: 编辑养宠经验界面
	 * @return String
	 */
	public String editExper(){
		try {
			//查询养宠经验
			Exper exper = indexManager.queryExper(paramsExper);
			Param.setAttribute("exper",exper);
			
		} catch (Exception e) {
			e.printStackTrace();
			return "error";
		}
		
		return "experEdit";
	}
	
	/**
	 * @Title: saveExper
	 * @Description: 保存编辑养宠经验
	 * @return String
	 */
	public String saveExper(){
		try {
			//编辑养宠经验
			indexManager.updateExper(paramsExper);
			
		} catch (Exception e) {
			e.printStackTrace();
			return "error";
		}
		
		return "success";
	}
	
	/**
	 * @Title: delExper
	 * @Description: 撤销养宠经验
	 * @return String
	 */
	public String delExper(){
		try {
			//撤销养宠经验
			indexManager.delExper(paramsExper);
		} catch (Exception e) {
			e.printStackTrace();
			return "error";
		}
		return "success";
	}
	
	/**
	 * @Title: reg
	 * @Description: 跳转注册页面
	 * @return String
	 */
	public String reg(){
		return "reg";
	}
	
	/**
	 * @Title: myInfo
	 * @Description: 跳转个人信息页面
	 * @return String
	 */
	public String myInfo(){
		return "userInfo";
	}
	
	/**
	 * @Title: myPwd
	 * @Description: 跳转个人密码页面
	 * @return String
	 */
	public String myPwd(){
		return "userPwd";
	}

	public String getTip() {
		return tip;
	}

	public void setTip(String tip) {
		this.tip = tip;
	}

	public User getParamsUser() {
		return paramsUser;
	}

	public void setParamsUser(User paramsUser) {
		this.paramsUser = paramsUser;
	}

	public Task getParamsTask() {
		return paramsTask;
	}

	public void setParamsTask(Task paramsTask) {
		this.paramsTask = paramsTask;
	}

	public Info getParamsInfo() {
		return paramsInfo;
	}

	public void setParamsInfo(Info paramsInfo) {
		this.paramsInfo = paramsInfo;
	}

	public Race getParamsRace() {
		return paramsRace;
	}

	public void setParamsRace(Race paramsRace) {
		this.paramsRace = paramsRace;
	}

	public Lost getParamsLost() {
		return paramsLost;
	}

	public Exper getParamsExper() {
		return paramsExper;
	}

	public void setParamsLost(Lost paramsLost) {
		this.paramsLost = paramsLost;
	}

	public void setParamsExper(Exper paramsExper) {
		this.paramsExper = paramsExper;
	}

	public SblogReply getParamsSblogReply() {
		return paramsSblogReply;
	}

	public void setParamsSblogReply(SblogReply paramsSblogReply) {
		this.paramsSblogReply = paramsSblogReply;
	}

}
