package com.bioc.erms;

import java.util.ArrayList;
import java.util.List;
import java.util.ListIterator;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bioc.beans.ClientCounterParty;
import com.bioc.beans.CreditAccountDetails;
//import com.bioc.beans.Guarantor;
//import com.bioc.beans.LastUpdateDetails;
//import com.bioc.beans.ThirdPartyCollateral;
import com.bioc.beans.CreditGroupList;


@Controller
public class CreditExposureTree {
	@RequestMapping(value = "/counterpartyexposure", method = RequestMethod.GET)
	public String counterpartyexposure(){
		return "counterpartyexposure";
	}
	
	@RequestMapping(value = "/creditData", method = RequestMethod.GET)
	public @ResponseBody List<CreditGroupList> creditData(HttpServletRequest request) throws Exception{
		List<CreditGroupList> creditDet = null;
		HttpSession session = request.getSession();
		
			creditDet = mockCreditData();
			session.setAttribute("crcounterparties", creditDet);
		
		return creditDet;
	}
	
	public List<CreditGroupList> mockCreditData(){
		List<CreditGroupList> creditgrouplist = new ArrayList<CreditGroupList>();
		CreditGroupList mockObj1 = new CreditGroupList();
		mockObj1.setCreditGroup("ACME");
		mockObj1.setCounterpartyName("Party Name");
		mockObj1.setAccEntity("CHAN PING CJH");
		mockObj1.setAccountNo(""); 
		mockObj1.setSubAcc("");
		mockObj1.setAccStatus("");
		mockObj1.setAccAccType("");
		mockObj1.setBusinessUnit("");
		mockObj1.setLimitHierarchyLevel("");
		mockObj1.setParentLimitType("");
		mockObj1.setFacilityID("");
		mockObj1.setLimitExpiryDate("");
		mockObj1.setLimitCcy("");
		mockObj1.setLimitAmount("");
		mockObj1.setLimitAmountLEEBased("");
		//mockObj1.setCounterpartyName("");
		creditgrouplist.add(mockObj1);
		
		CreditGroupList mockObj2 = new CreditGroupList();
		mockObj2.setCreditGroup("ACME1");
		mockObj2.setCounterpartyName("Party Name1");
		mockObj2.setAccEntity("CJH");
		mockObj2.setAccountNo(""); 
		mockObj2.setSubAcc("");
		mockObj2.setAccStatus("");
		mockObj2.setAccAccType("");
		mockObj2.setBusinessUnit("");
		mockObj2.setLimitHierarchyLevel("");
		mockObj2.setParentLimitType("");
		mockObj2.setFacilityID("");
		mockObj2.setLimitExpiryDate("");
		mockObj2.setLimitCcy("");
		mockObj2.setLimitAmount("");
		mockObj2.setLimitAmountLEEBased("");
		//mockObj2.setCounterpartyName("");
		creditgrouplist.add(mockObj2);
		
		CreditGroupList mockObj3 = new CreditGroupList();
		mockObj3.setCreditGroup("ACME2");
		mockObj3.setCounterpartyName("Party Name2");
		mockObj3.setAccEntity("PING");
		mockObj3.setAccountNo(""); 
		mockObj3.setSubAcc("");
		mockObj3.setAccStatus("");
		mockObj3.setAccAccType("");
		mockObj3.setBusinessUnit("");
		mockObj3.setLimitHierarchyLevel("");
		mockObj3.setParentLimitType("");
		mockObj3.setFacilityID("");
		mockObj3.setLimitExpiryDate("");
		mockObj3.setLimitCcy("");
		mockObj3.setLimitAmount("");
		mockObj3.setLimitAmountLEEBased("");
		//mockObj3.setCounterpartyName("");
		creditgrouplist.add(mockObj3);
		
		
		return creditgrouplist;
	}
	
	/*@RequestMapping(value = "/creditAccount", method = RequestMethod.GET)
	public @ResponseBody List<CreditAccountDetails> creditAccount(HttpServletRequest request) throws Exception{
		List<CreditAccountDetails> creditAcc = null;
		HttpSession session = request.getSession();
		
			creditAcc = mockCreditAcc();
			session.setAttribute("accountNo", creditAcc);
		
		return creditAcc;
	}*/
	
	
	/*@RequestMapping(value = "/creditAccount", method = RequestMethod.GET)
	public @ResponseBody String creditAccount(@RequestBody CreditAccountDetails ccparty,HttpServletRequest request) throws Exception{
	//public @ResponseBody CreditAccountDetails  getCounterpartyName(HttpServletRequest request) throws Exception{
		List<CreditAccountDetails> creditVal = null;
		HttpSession session = request.getSession();
		if(session !=null && session.getAttribute("counterpartyName")!=null){
			creditVal  = (List<CreditAccountDetails>)session.getAttribute("counterpartyName");
		}else{
			if(ccparty.getCounterpartyName().equalsIgnoreCase("Party Name")){
				creditVal = mockCreditAcc();
				session.setAttribute("counterpartyName", creditVal);
			}
			//creditVal = mockCreditAcc();
			
		}
		String vals = request.getParameter("counterpartyName");
		if(vals!=null){
			for (CreditAccountDetails creditAccountDetails : creditVal) {
				if(creditAccountDetails.getCounterpartyName().equalsIgnoreCase(vals)){
					return "counterpartyexposure";
				}
			}
		}
		return null;
	}*/
	
	/*@RequestMapping(value = "/creditAccount", method = RequestMethod.GET)
	public @ResponseBody String creditAccount(@RequestBody CreditAccountDetails ccparty,HttpServletRequest request) throws Exception{
		System.out.println("Update CR method called");
		HttpSession session = request.getSession();
		
		List<CreditAccountDetails> ccrcounterparties = null;
		//List<CreditAccountDetails> counterparties = null;
		
		if(session !=null && session.getAttribute("crcounterparties")!=null){
			ccrcounterparties = (List<CreditAccountDetails>)session.getAttribute("crcounterparties");
			//counterparties = (List<CreditAccountDetails>)session.getAttribute("counterparties");
		}
		
		if(ccparty.getCounterpartyName().equalsIgnoreCase("Party Name")){
			ccrcounterparties = mockCreditAcc();
			session.setAttribute("creditparties",ccrcounterparties);
		}else if(ccparty.getCounterpartyName().equalsIgnoreCase("Party Name1")){
			return null;
		}
		
		return "ccrcounterparties";
	}*/
	
	  @RequestMapping(value = "/creditAccount", method = RequestMethod.GET)
	    public @ResponseBody List<CreditAccountDetails> creditJson(HttpServletRequest request){
		  List<CreditAccountDetails> ccCRData = null;
	       System.out.println(request.getParameter("ccpDetial"));
	       
	       String val = request.getParameter("ccpDetial");
	       if(val!=null){
		       if(val.equalsIgnoreCase("Party Name")){
		    	   ccCRData = mockCreditAcc();
		    	   //return ccCRData;
		       }else if(val.equalsIgnoreCase("Party Name1")){
		    	   ccCRData = mockCreditAcc1();
		    	   //return ccCRData;
		       }else if(val.equalsIgnoreCase("Party Name2")){
		    	   ccCRData = mockCreditAcc2();
		    	   //return ccCRData;
		       }
	       }
	       return ccCRData;
	       //session.setAttribute("crcounterparties",ccCRData);
	        
	    }
	
	
	
	
	
	public List<CreditAccountDetails> mockCreditAcc(){
		List<CreditAccountDetails> creditacclist = new ArrayList<CreditAccountDetails>();
		CreditAccountDetails mockObj1 = new CreditAccountDetails();
		mockObj1.setCounterpartyName("Party Name");
		mockObj1.setAccountNo("1 - account"); 
		mockObj1.setSubAcc("1- subAcc");
		mockObj1.setAccStatus("1");
		mockObj1.setAccAccType("1 - T");
		mockObj1.setBusinessUnit("1 - B");
		mockObj1.setLimitType("1 - L");
		creditacclist.add(mockObj1);
		
		
		CreditAccountDetails mockObj2 = new CreditAccountDetails();
		mockObj2.setCounterpartyName("Party Name");
		mockObj2.setAccountNo("2 - account"); 
		mockObj2.setSubAcc("2- subAcc");
		mockObj2.setAccStatus("2");
		mockObj2.setAccAccType("2 - T");
		mockObj2.setBusinessUnit("2 - B");
		mockObj2.setLimitType("2 - L");
		creditacclist.add(mockObj2);
		
		CreditAccountDetails mockObj3 = new CreditAccountDetails();
		mockObj3.setCounterpartyName("Party Name");
		mockObj3.setAccountNo("3 - account"); 
		mockObj3.setSubAcc("3- subAcc");
		mockObj3.setAccStatus("3");
		mockObj3.setAccAccType("3 - T");
		mockObj3.setBusinessUnit("3 - B");
		mockObj3.setLimitType("3 - L");
		creditacclist.add(mockObj3);
		
		return creditacclist;
	}
	
	public List<CreditAccountDetails> mockCreditAcc1(){
		List<CreditAccountDetails> creditacclist = new ArrayList<CreditAccountDetails>();
		CreditAccountDetails mockObj1 = new CreditAccountDetails();
		mockObj1.setCounterpartyName("Party Name1");
		mockObj1.setAccountNo("2.1 - account"); 
		mockObj1.setSubAcc("2.1- subAcc");
		mockObj1.setAccStatus("2.1");
		mockObj1.setAccAccType("2.1 - T");
		mockObj1.setBusinessUnit("2.1 - B");
		mockObj1.setLimitType("2.1 - L");
		creditacclist.add(mockObj1);
		
		
		CreditAccountDetails mockObj2 = new CreditAccountDetails();
		mockObj2.setCounterpartyName("Party Name1");
		mockObj2.setAccountNo("2.2 - account"); 
		mockObj2.setSubAcc("2.2- subAcc");
		mockObj2.setAccStatus("2.2");
		mockObj2.setAccAccType("2.2 - T");
		mockObj2.setBusinessUnit("2.2 - B");
		mockObj2.setLimitType("2.2 - L");
		creditacclist.add(mockObj2);
		
		CreditAccountDetails mockObj3 = new CreditAccountDetails();
		mockObj3.setCounterpartyName("Party Name1");
		mockObj3.setAccountNo("2.3 - account"); 
		mockObj3.setSubAcc("2.3- subAcc");
		mockObj3.setAccStatus("2.3");
		mockObj3.setAccAccType("2.3 - T");
		mockObj3.setBusinessUnit("2.3 - B");
		mockObj3.setLimitType("2.3 - L");
		creditacclist.add(mockObj3);
		
		return creditacclist;
	}
	
	public List<CreditAccountDetails> mockCreditAcc2(){
		List<CreditAccountDetails> creditacclist = new ArrayList<CreditAccountDetails>();
		CreditAccountDetails mockObj1 = new CreditAccountDetails();
		mockObj1.setCounterpartyName("Party Name2");
		mockObj1.setAccountNo("3.1 - account"); 
		mockObj1.setSubAcc("3.1- subAcc");
		mockObj1.setAccStatus("3.1");
		mockObj1.setAccAccType("3.1 - T");
		mockObj1.setBusinessUnit("3.1 - B");
		mockObj1.setLimitType("3.1 - L");
		creditacclist.add(mockObj1);
		
		
		CreditAccountDetails mockObj2 = new CreditAccountDetails();
		mockObj2.setCounterpartyName("Party Name2");
		mockObj2.setAccountNo("3.2 - account"); 
		mockObj2.setSubAcc("3.2- subAcc");
		mockObj2.setAccStatus("3.2");
		mockObj2.setAccAccType("3.2 - T");
		mockObj2.setBusinessUnit("3.2 - B");
		mockObj2.setLimitType("3.2 - L");
		creditacclist.add(mockObj2);
		
		CreditAccountDetails mockObj3 = new CreditAccountDetails();
		mockObj3.setCounterpartyName("Party Name3");
		mockObj3.setAccountNo("3.3 - account"); 
		mockObj3.setSubAcc("3.3- subAcc");
		mockObj3.setAccStatus("3.3");
		mockObj3.setAccAccType("3.3 - T");
		mockObj3.setBusinessUnit("3.3 - B");
		mockObj3.setLimitType("3.3 - L");
		creditacclist.add(mockObj3);
		
		return creditacclist;
	}
	
}

