package com.myhostelmanager.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.myhostelmanager.form.LoginForm;
import com.myhostelmanager.service.BlockService;
import com.myhostelmanager.service.LoginService;
import com.myhostelmanager.validator.LoginValidator;

@Controller
public class MainController {

	@Autowired
	private LoginService loginService;
	@Autowired
	private BlockService blockService;
	
	Logger logger=LoggerFactory.getLogger(MainController.class);

	@RequestMapping(value="/index", method=RequestMethod.GET)
	private ModelAndView index(){
		logger.info("Redirecting from Index page");
		return new ModelAndView("redirect:login.LoRe");	
	}
	
	@RequestMapping(value="/login", method=RequestMethod.GET)
	private ModelAndView showLoginForm(@ModelAttribute("loginForm") LoginForm loginForm, ModelMap model,HttpServletRequest request){
		logger.info("Redirecting to Login page");
		model.addAttribute("loginForm");
		return new ModelAndView("login");
	}
	
	@RequestMapping(value="/signin", method=RequestMethod.POST)
	private ModelAndView Signin(@ModelAttribute("loginForm") LoginForm loginForm, BindingResult result, ModelMap model){
		logger.info("Uid "+loginForm.getUid()+ " " + loginForm.getPwd());
		ModelAndView modelView=null;
		LoginValidator loginValidator = new LoginValidator();
		loginValidator.validateUser(loginForm, result);
		if(result.hasErrors()){
			logger.info("Has Errors");
			modelView=new ModelAndView("login");
		}else{
			logger.info("before isUserValid");
			boolean b = loginService.isUserValid(loginForm.getUid(), loginForm.getPwd());
			if(b){
				logger.info("Getting Hostel Id.");
				String hostelId=loginService.getHostelId(loginForm.getUid(), loginForm.getPwd());
				logger.info("Hostel Id: "+ hostelId);
				model.addAttribute("hostelId", hostelId);
				logger.info("Getting Hostel Name.");
				model.addAttribute("hostelName", loginService.getHostelName(hostelId));
				logger.info("Getting Block Names");
				Map<String, String> blockNamesMap = blockService.getBlockIdNames(hostelId);
				model.addAttribute("BlockNames", blockNamesMap);
				if(blockNamesMap.size()==1){
					logger.info("Redirecting to Options page");
					modelView=new ModelAndView("options");
				}else{
					logger.info("Redirecting to BlockHome page");
					modelView=new ModelAndView("BlockHome");				
				}
			}
			else{
				logger.info("In valid User");
				model.addAttribute("status","In Valid User");
				modelView=new ModelAndView("login");
			}
		}
		return modelView;
	}
	
	@RequestMapping(value="/register", method=RequestMethod.GET)
	private String signUp(){
		logger.info("Redirecting to Sign Up");
		return "signup";	
	}
	
	
}
