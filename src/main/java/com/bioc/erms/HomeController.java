package com.bioc.erms;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bioc.beans.UserInformation;


/**
 * Handles requests for the application home page.
 */


@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/home", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		
		model.addAttribute("serverTime", formattedDate );
		
		return "home";
	}
	
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public @ResponseBody UserInformation validate(Locale locale, Model model,HttpServletRequest request) throws Exception{
		
		logger.info("Welcome Login update! The client locale is {}.", locale);
		System.out.println("login method");
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		String username=request.getParameter("username");
		String password=request.getParameter("password");
		String domain=request.getParameter("domain");
		
//		System.out.println(request.getParameter("models"));
//		User[] user = (User[])fromJson(request.getParameter("models"));
//		System.out.println(user[0].getUsername());
//		model.addAttribute("serverTime", formattedDate );
		
//		if(user[0].getUsername().equalsIgnoreCase("nagendar")){
//			return "valid";
//		}else if(user[0].getUsername().equalsIgnoreCase("Roy")){
//			user=null;
//			String userName=user[0].getUsername();	
//			throw new Exception("Roy is dangerous");
//		}
//		else{
//			return "notvalid";
//		}
		UserInformation userInformation=new UserInformation();
		if(password.equals("risk1234")){
			System.out.println("success logged in");
			userInformation.setAction("success");
			userInformation.setMessage("successful authentication");
			userInformation.setLastLogin("19/10/2015 15:29:55");
			userInformation.setUsername("riskadmin");
			userInformation.setUserRole("RISKADMIN");
			
		}
		return userInformation;
	}
	
	@RequestMapping(value = "/index", method = RequestMethod.GET)
	public String loggedin(Locale locale, Model model) {
		logger.info("You are in index already.");
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		String formattedDate = dateFormat.format(date);
		model.addAttribute("serverTime", formattedDate );
		
		return "index";	
	}
	@RequestMapping(value = "/dashboard", method = RequestMethod.GET)
	public String dashboard(Locale locale, Model model) {
		logger.info("Directing to group_rmd_detail_maintenance", locale);

		return "dashboard";
	}
	
	@RequestMapping(value = "/groupMaintenanceList", method = RequestMethod.GET)
	public String groupTypeMain(Locale locale, Model model) {
		logger.info("Directing to group_rmd_detail_maintenance", locale);

		return "groupMaintenanceList";
	}
	
	@RequestMapping(value = "/ccpDetailMaintenanceView", method = RequestMethod.GET)
	public String clientCounterpartyDetailMaintenance(Locale locale, Model model) {
		logger.info("clientCounterpartyDetailMaintenance", locale);

		return "ccpDetailMaintenanceView";
	}
	
	@RequestMapping(value = "/ccpDetailMaintenanceUpdate", method = RequestMethod.GET)
	public String ccpDetailMaintenanceUpdate(Locale locale, Model model) {
		logger.info("ccpDetailMaintenanceUpdate", locale);

		return "ccpDetailMaintenanceUpdate";
	}
	@RequestMapping(value = "/groupMaintenanceDetail", method = RequestMethod.GET)
	public String groupTypeMainMaker(Locale locale, Model model) {
		logger.info("Directing to group_rmd_detail_maintenance", locale);

		return "groupMaintenanceDetail";
	}
	
	@RequestMapping(value = "/groupMaintenanceChangeRequest", method = RequestMethod.GET)
	public String groupTypeMainChecker() {
		return "groupMaintenanceChangeRequest";
	}
	
	@RequestMapping(value = "/accountDetailMaintenance", method = RequestMethod.GET)
	public String accountDetailMaintenance() {
		return "accountDetailMaintenance";
	}
	
	
}
