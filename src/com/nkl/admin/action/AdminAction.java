package com.nkl.admin.action;

import java.util.Date;
import java.util.List;

import com.nkl.admin.manager.AdminManager;
import com.nkl.common.action.BaseAction;
import com.nkl.common.util.DateUtil;
import com.nkl.common.util.Md5;
import com.nkl.common.util.Param;
import com.nkl.page.domain.Exper;
import com.nkl.page.domain.Info;
import com.nkl.page.domain.Lost;
import com.nkl.page.domain.Race;
import com.nkl.page.domain.Task;
import com.nkl.page.domain.User;

public class AdminAction  extends BaseAction {

	private static final long serialVersionUID = 1L;
	AdminManager adminManager = new AdminManager();

	//抓取页面参数
	User paramsUser;
	Task paramsTask;
	Race paramsRace;
	Info paramsInfo; 
	Exper paramsExper;
	Lost paramsLost;
	String tip;
	
	
	/**
	 * @Title: saveAdmin
	 * @Description: 保存修改个人信息
	 * @return String
	 */
	public String saveAdmin(){
		try {
			//验证用户会话是否失效
			if (!validateAdmin()) {
				return "loginTip";
			}
			 //保存修改个人信息
			adminManager.updateUser(paramsUser);
			//更新session
			User admin = new User();
			admin.setUser_id(paramsUser.getUser_id());
			admin = adminManager.getUser(admin);
			Param.setSession("admin", admin);
			
		} catch (Exception e) {
			setErrorTip("编辑异常", "modifyInfo.jsp");
		}
		setSuccessTip("编辑成功", "modifyInfo.jsp");
		return "infoTip";
	}
	
	/**
	 * @Title: saveAdminPass
	 * @Description: 保存修改个人密码
	 * @return String
	 */
	public String saveAdminPass(){
		try {
			//验证用户会话是否失效
			if (!validateAdmin()) {
				return "loginTip";
			}
			
			 //保存修改个人密码
			User admin = (User)Param.getSession("admin");
			String user_opass = Md5.makeMd5(paramsUser.getUser_opass());
			if (!user_opass.equals(admin.getUser_pass())) {
				setErrorTip("原密码输入错误", "modifyPwd.jsp");
				return "infoTip";
			}
			adminManager.updateUser(paramsUser);
			//更新session
			if (admin!=null) {
				admin.setUser_pass(paramsUser.getUser_pass());
				Param.setSession("admin", admin);
			}

			setSuccessTip("修改成功", "modifyPwd.jsp");
		} catch (Exception e) {
			setErrorTip("修改异常", "modifyPwd.jsp");
		}
		return "infoTip";
	}
	
	/**
	 * @Title: listUsers
	 * @Description: 查询用户
	 * @return String
	 */
	public String listUsers(){
		try {
			if (paramsUser==null) {
				paramsUser = new User();
			}
			//查询注册用户
			paramsUser.setUser_type(1);
			//设置分页信息
			setPagination(paramsUser);
			int[] sum={0};
			List<User> users = adminManager.listUsers(paramsUser,sum); 
			
			Param.setAttribute("users", users);
			setTotalCount(sum[0]);
			
		} catch (Exception e) {
			setErrorTip("查询用户异常", "main.jsp");
			return "infoTip";
		}
		
		return "userShow";
	}
	
	/**
	 * @Title: addUserShow
	 * @Description: 显示添加用户页面
	 * @return String
	 */
	public String addUserShow(){
		return "userEdit";
	}
	
	/**
	 * @Title: addUser
	 * @Description: 添加用户
	 * @return String
	 */
	public String addUser(){
		try {
			 //添加用户
			paramsUser.setUser_type(1);
			paramsUser.setReg_date(DateUtil.dateToDateString(new Date(), "yyyy-MM-dd HH:mm:ss"));
			paramsUser.setUser_level(1);
			adminManager.addUser(paramsUser);

			setSuccessTip("添加用户成功", "Admin_listUsers.action");
		} catch (Exception e) {
			setErrorTip("添加用户异常", "Admin_listUsers.action");
		}
		return "infoTip";
	}
	
	 
	/**
	 * @Title: editUser
	 * @Description: 编辑用户
	 * @return String
	 */
	public String editUser(){
		try {
			 //得到用户
			User user = adminManager.getUser(paramsUser);
			Param.setAttribute("user", user);
			
		} catch (Exception e) {
			setErrorTip("查询用户异常", "Admin_listUsers.action");
			return "infoTip";
		}
		
		return "userEdit";
	}
	
	/**
	 * @Title: saveUser
	 * @Description: 保存编辑用户
	 * @return String
	 */
	public String saveUser(){
		try {
			 //保存编辑用户
			adminManager.updateUser(paramsUser);
			
		} catch (Exception e) {
			tip="编辑失败";
			Param.setAttribute("user", paramsUser);
			return "userEdit";
		}
		setSuccessTip("编辑用户成功", "Admin_listUsers.action");
		return "infoTip";
	}
	
	/**
	 * @Title: delUsers
	 * @Description: 删除用户
	 * @return String
	 */
	public String delUsers(){
		try {
			 //删除用户
			adminManager.delUsers(paramsUser);

			setSuccessTip("删除用户成功", "Admin_listUsers.action");
		} catch (Exception e) {
			setErrorTip("删除用户异常", "Admin_listUsers.action");
		}
		return "infoTip";
	}
	
	/**
	 * @Title: listInfos
	 * @Description: 查询网站推送
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
			//查询网站推送列表
			List<Info> infos = adminManager.listInfos(paramsInfo,sum); 
			
			Param.setAttribute("infos", infos);
			setTotalCount(sum[0]);
			
		} catch (Exception e) {
			setErrorTip("查询网站推送异常", "main.jsp");
			return "infoTip";
		}
		
		return "infoShow";
	}
	
	/**
	 * @Title: addInfoShow
	 * @Description: 显示添加网站推送页面
	 * @return String
	 */
	public String addInfoShow(){
		return "infoEdit";
	}
	
	/**
	 * @Title: addInfo
	 * @Description: 添加网站推送
	 * @return String
	 */
	public String addInfo(){
		try {
			 //添加网站推送
			adminManager.addInfo(paramsInfo);
			
			setSuccessTip("添加成功", "Admin_listInfos.action");
		} catch (Exception e) {
			setErrorTip("添加网站推送异常", "Admin_listInfos.action");
		}
		
		return "infoTip";
	}
	
	 
	/**
	 * @Title: editInfo
	 * @Description: 编辑网站推送
	 * @return String
	 */
	public String editInfo(){
		try {
			 //得到网站推送
			Info info = adminManager.queryInfo(paramsInfo);
			Param.setAttribute("info", info);
			
		} catch (Exception e) {
			setErrorTip("查询网站推送异常", "Admin_listInfos.action");
			return "infoTip";
		}
		
		return "infoEdit";
	}
	
	/**
	 * @Title: saveInfo
	 * @Description: 保存编辑网站推送
	 * @return String
	 */
	public String saveInfo(){
		try {
			 //保存编辑网站推送
			adminManager.updateInfo(paramsInfo);
			
			setSuccessTip("编辑成功", "Admin_listInfos.action");
		} catch (Exception e) {
			tip="编辑失败";
			Param.setAttribute("info", paramsInfo);
			return "infoEdit";
		}
		
		return "infoTip";
	}
	
	/**
	 * @Title: delInfos
	 * @Description: 删除网站推送
	 * @return String
	 */
	public String delInfos(){
		try {
			 //删除网站推送
			adminManager.delInfos(paramsInfo);
			
			setSuccessTip("删除网站推送成功", "Admin_listInfos.action");
		} catch (Exception e) {
			setErrorTip("删除网站推送异常", "Admin_listInfos.action");
		}
		
		return "infoTip";
	}

	private boolean validateAdmin(){
		User admin = (User)Param.getSession("admin");
		if (admin!=null) {
			return true;
		}else {
			return false;
		}
	}
	
	private void setErrorTip(String tip,String url){
		Param.setAttribute("tipType", "error");
		Param.setAttribute("tip", tip);
		Param.setAttribute("url1", url);
		Param.setAttribute("value1", "确 定");
	}
	
	private void setSuccessTip(String tip,String url){
		Param.setAttribute("tipType", "success");
		Param.setAttribute("tip", tip);
		Param.setAttribute("url1", url);
		Param.setAttribute("value1", "确 定");
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

	public Info getParamsInfo() {
		return paramsInfo;
	}

	public void setParamsInfo(Info paramsInfo) {
		this.paramsInfo = paramsInfo;
	}

	public Task getParamsTask() {
		return paramsTask;
	}

	public void setParamsTask(Task paramsTask) {
		this.paramsTask = paramsTask;
	}

	public Race getParamsRace() {
		return paramsRace;
	}

	public void setParamsRace(Race paramsRace) {
		this.paramsRace = paramsRace;
	}

	public Exper getParamsExper() {
		return paramsExper;
	}

	public Lost getParamsLost() {
		return paramsLost;
	}

	public void setParamsExper(Exper paramsExper) {
		this.paramsExper = paramsExper;
	}

	public void setParamsLost(Lost paramsLost) {
		this.paramsLost = paramsLost;
	}


}
