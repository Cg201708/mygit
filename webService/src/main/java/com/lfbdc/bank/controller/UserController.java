package com.lfbdc.bank.controller;

import javax.annotation.Resource;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.lfbdc.bank.model.DysJ;
import com.lfbdc.bank.model.User;
import com.lfbdc.bank.service.TestService;
import com.lfbdc.bank.service.UserService;

@Controller
@RequestMapping("/user")
public class UserController {
	
	@Resource
	private TestService testService;
	
	@Resource
	private UserService userService;
	
	
	private static Logger logger = LogManager.getLogger(UserController.class);
	
	/**
	 * 用户登录
	 * @param user
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/login")
	@ResponseBody
	public ModelAndView login(Model model,User user) throws Exception{
		User resultUser = userService.login(user);
		
		if (resultUser != null) {
			logger.info("账户密码正确登陆成功");
			//HttpSession session = request.getSession();
			//session.setAttribute("currentUser", resultUser);
			
			model.addAttribute("currentUser", resultUser);
			
			model.addAttribute(resultUser);
			
			return new ModelAndView("main");
			
		}else {
			//request.setAttribute("user", resultUser);

			model.addAttribute("user", resultUser);
			//request.setAttribute("errorMsg", "用户名或密码错误");

			return new ModelAndView("index");
		}
	}

}
