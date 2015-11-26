package com.bioc.erms;

import java.util.ArrayList;
import java.util.Enumeration;
import java.util.List;
import java.util.ListIterator;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.bioc.beans.ClientCounterParty;
import com.bioc.beans.Guarantor;
import com.bioc.beans.LastUpdateDetails;
import com.bioc.beans.ThirdPartyCollateral;


@Controller
public class ClientCounterPartyController {
	
	@RequestMapping(value = "/ccprmddetailmaintenance", method = RequestMethod.GET)
	public String ccprmddetailmaintenance(){
		return "ccprmddetailmaintenance";
	}
	
	@RequestMapping(value = "/searchData", method = RequestMethod.GET)
	public @ResponseBody List<ClientCounterParty> search(HttpServletRequest request) throws Exception{
		List<ClientCounterParty> counterparties  = null;
		HttpSession session = request.getSession();
		if(session !=null && session.getAttribute("counterparties")!=null){
			counterparties  = (List<ClientCounterParty>)session.getAttribute("counterparties");
		}else{
			counterparties = mockCounterParty();
			session.setAttribute("counterparties",counterparties);
		}
		Enumeration<String> paramNames = request.getParameterNames();
		while(paramNames.hasMoreElements()){
			String paramName = paramNames.nextElement();
			String val = request.getParameter(paramName);
			if(val!=null){
				if(paramName.equalsIgnoreCase("ccdId")){
					for (ClientCounterParty clientCounterParty : counterparties) {
						if(clientCounterParty.getCcdId().equalsIgnoreCase(val)){
							List<ClientCounterParty> searchVal = new ArrayList<ClientCounterParty>();
							searchVal.add(clientCounterParty);
							return searchVal;
						}
					}
				}
			}
		}
		
		return counterparties;
	}
	
	@RequestMapping(value = "/searchCRData", method = RequestMethod.GET)
	public @ResponseBody List<ClientCounterParty> searchCRData(HttpServletRequest request) throws Exception{
		List<ClientCounterParty> ccCRData = null;
		HttpSession session = request.getSession();
		if(session !=null && session.getAttribute("crcounterparties")!=null){
			ccCRData = (List<ClientCounterParty>)session.getAttribute("crcounterparties");
		}else{
			ccCRData = mockCRCounterParty();
			session.setAttribute("crcounterparties",ccCRData);
		}
		return ccCRData;
	}
	
	@RequestMapping(value = "/viewUpdate", method = RequestMethod.GET)
	public ModelAndView viewUpdate(HttpServletRequest request) throws Exception{
		String val = request.getParameter("ccdId");
		return new ModelAndView("ccpDetailMaintenanceUpdate", "ccdId", val);
	}
	
	@RequestMapping(value = "/viewCounterParty", method = RequestMethod.GET)
	public ModelAndView viewCounterParty(HttpServletRequest request) throws Exception{
		String val = request.getParameter("ccdId");
		return new ModelAndView("ccpDetailMaintenanceView", "ccdId", val);
	}
	
	@RequestMapping(value = "/viewVerifyCounterParty", method = RequestMethod.GET)
	public ModelAndView viewVerifyCounterParty(HttpServletRequest request) throws Exception{
		String val = request.getParameter("ccdId");
		return new ModelAndView("ccpDetailMaintenanceVerify", "ccdId", val);
	}
	
	@RequestMapping(value = "/discardCounterParty", method = RequestMethod.GET)
	public ModelAndView discardCounterParty(HttpServletRequest request) throws Exception{
		String val = request.getParameter("ccdId");
		return new ModelAndView("ccpDetailMaintenanceDiscard", "ccdId", val);
	}
	
	@RequestMapping(value = "/getDataByccdId", method = RequestMethod.GET)
	public @ResponseBody ClientCounterParty  getDataByccId(HttpServletRequest request) throws Exception{
		List<ClientCounterParty> counterparties =null;
		HttpSession session = request.getSession();
		if(session !=null && session.getAttribute("counterparties")!=null){
			counterparties  = (List<ClientCounterParty>)session.getAttribute("counterparties");
		}else{
			counterparties = mockCounterParty();
			session.setAttribute("counterparties",counterparties);
		}
		String val = request.getParameter("ccdId");
		if(val!=null){
			for (ClientCounterParty clientCounterParty : counterparties) {
				if(clientCounterParty.getCcdId().equalsIgnoreCase(val)){
					return clientCounterParty;
				}
			}
		}
		return null;
	}
	
	@RequestMapping(value = "/getCrDataByccdId", method = RequestMethod.GET)
	public @ResponseBody ClientCounterParty getCrDataByccdId(HttpServletRequest request) throws Exception{
		List<ClientCounterParty> ccrcounterparties = null;
		HttpSession session = request.getSession();
		
		if(session !=null && session.getAttribute("crcounterparties")!=null){
			ccrcounterparties = (List<ClientCounterParty>)session.getAttribute("crcounterparties");
		}
		
		String val = request.getParameter("ccdId");
		if(val!=null){
			for (ClientCounterParty clientCounterParty : ccrcounterparties) {
				if(clientCounterParty.getCcdId().equalsIgnoreCase(val)){
					return clientCounterParty;
				}
			}
		}
		return null;
	}
	
	
	@RequestMapping(value = "/updateDataByccdId", method = RequestMethod.POST)
	public @ResponseBody String updateDataByccId(@RequestBody ClientCounterParty ccparty,HttpServletRequest request) throws Exception{
		System.out.println("Update method called");
		
		HttpSession session = request.getSession();
		
		List<ClientCounterParty> ccrcounterparties = null;
		
		if(session !=null && session.getAttribute("crcounterparties")!=null){
			ccrcounterparties = (List<ClientCounterParty>)session.getAttribute("crcounterparties");
		}else{
			ccrcounterparties = mockCRCounterParty();
		}
		//ccparty.setStatus("Saved");
		if(ccparty.getStatus().equalsIgnoreCase("submit")){
			ccparty.setStatus("Pending for Verification");
			ccparty.setAction("A,D,V");
		}else if(ccparty.getStatus().equalsIgnoreCase("save")){
			ccparty.setStatus("Saved");
			ccparty.setAction("D");
		}
		
		ccrcounterparties.add(ccparty);
		
		if(session !=null && session.getAttribute("crcounterparties")!=null){
			session.setAttribute("crcounterparties",ccrcounterparties);
		}else{
			session.setAttribute("crcounterparties",ccrcounterparties);
		}
		
		if(session !=null && session.getAttribute("counterparties")!=null){
			List<ClientCounterParty> counterparties = (List<ClientCounterParty>) session.getAttribute("counterparties");
			ListIterator<ClientCounterParty> countryIterator = counterparties.listIterator();
			while(countryIterator.hasNext()){
				if(countryIterator.next().getCcdId().equalsIgnoreCase(ccparty.getCcdId())){					
					countryIterator.remove();
				}
			}
		}
		
		return "ccprmddetailmaintenance";
	}
	
	
	@RequestMapping(value = "/updateCrDataByccdId", method = RequestMethod.POST)
	public @ResponseBody String updateCrDataByccdId(@RequestBody ClientCounterParty ccparty,HttpServletRequest request) throws Exception{
		System.out.println("Update CR method called");
		HttpSession session = request.getSession();
		
		List<ClientCounterParty> ccrcounterparties = null;
		List<ClientCounterParty> counterparties = null;
		
		if(session !=null && session.getAttribute("crcounterparties")!=null){
			ccrcounterparties = (List<ClientCounterParty>)session.getAttribute("crcounterparties");
			counterparties = (List<ClientCounterParty>)session.getAttribute("counterparties");
		}
		
		if(ccparty.getStatus().equalsIgnoreCase("return")){
			ListIterator<ClientCounterParty> counterIterator = ccrcounterparties.listIterator();
			while(counterIterator.hasNext()){
				ClientCounterParty ccpIterator = counterIterator.next();
				if(ccpIterator.getCcdId().equalsIgnoreCase(ccparty.getCcdId())){					
					ccpIterator.setStatus("Return");
					ccpIterator.setAction("A,D,V");
				}
			}
		}else if(ccparty.getStatus().equalsIgnoreCase("closed")){
			ccparty.setAction("V|E");
			counterparties.add(ccparty);
			ListIterator<ClientCounterParty> counterIterator = ccrcounterparties.listIterator();
			while(counterIterator.hasNext()){
				if(counterIterator.next().getCcdId().equalsIgnoreCase(ccparty.getCcdId())){					
					counterIterator.remove();
				}
			}
		}
		
		return "ccprmddetailmaintenance";
	}
	
	
	public List<ClientCounterParty> mockCounterParty(){
		List<ClientCounterParty> clientCounterParties = new ArrayList<ClientCounterParty>();
		ClientCounterParty mockObj1 = new ClientCounterParty();
		mockObj1.setCcdId("37512");
		mockObj1.setClnCptyName("CHAN PING CJH");
		mockObj1.setClnCptyCat("CLIENT"); 
		mockObj1.setCreditRatingInternal("AAA");
		mockObj1.setDomicile("HK");
		mockObj1.setNationality("HK");
		mockObj1.setBusNature("PB");
		mockObj1.setAnnualIncome("1000000");
		mockObj1.setEstNetWorth("1000000");	
		mockObj1.setCreditRatingMoody("AAA");
		mockObj1.setCreditRatingFitch("AAA");
		mockObj1.setLastCreditCheckAprvdRmk("N/A");
		mockObj1.setStockCode("00005");
		mockObj1.setAumBociGrp("1212");
		mockObj1.setExternalKey1("");
		mockObj1.setExternalKey2("");
		mockObj1.setExternalKey3("");
		mockObj1.setExternalKey4("");
		mockObj1.setExternalKey5("");
		mockObj1.setExternalKey6("");
		mockObj1.setExternalKey7("");
		mockObj1.setExternalKey8("");
		mockObj1.setExternalKey9(""); 
		mockObj1.setExternalKey10("");
		mockObj1.setUpdateBy("SYSTEM");
		mockObj1.setLastUpdated("5/1/2015");
		mockObj1.setAction("V|E"); 
		clientCounterParties.add(mockObj1);
		
		ClientCounterParty mockObj2 = new ClientCounterParty();
		mockObj2.setCcdId("76258");
		mockObj2.setClnCptyName("GUO LI");
		mockObj2.setClnCptyCat("BROKER"); 
		mockObj2.setCreditRatingInternal("AAA");
		mockObj2.setDomicile("HK");
		mockObj2.setNationality("HK");
		mockObj2.setBusNature("PB");
		mockObj2.setAnnualIncome("1000000");
		mockObj2.setEstNetWorth("1000000");	
		mockObj2.setCreditRatingMoody("AAA");
		mockObj2.setCreditRatingSNP("AAA");
		mockObj2.setCreditRatingFitch("AAA");
		mockObj2.setLastCreditCheckAprvdRmk("N/A");
		mockObj2.setStockCode("00005");
		mockObj2.setAumBociGrp("1212");
		mockObj2.setExternalKey1("");
		mockObj2.setExternalKey2("");
		mockObj2.setExternalKey3("");
		mockObj2.setExternalKey4("");
		mockObj2.setExternalKey5("");
		mockObj2.setExternalKey6("");
		mockObj2.setExternalKey7("");
		mockObj2.setExternalKey8("");
		mockObj2.setExternalKey9(""); 
		mockObj2.setExternalKey10("");
		mockObj2.setUpdateBy("SYSTEM");
		mockObj2.setLastUpdated("5/1/2015");
		mockObj2.setAction("V|E"); 
		clientCounterParties.add(mockObj2);
		
		ClientCounterParty mockObj3 = new ClientCounterParty();
		mockObj3.setCcdId("89438");
		mockObj3.setClnCptyName("GUO LI");
		mockObj3.setClnCptyCat("CLIENT"); 
		mockObj3.setCreditRatingInternal("AAA");
		mockObj3.setDomicile("HK");
		mockObj3.setNationality("HK");
		mockObj3.setBusNature("PB");
		mockObj3.setAnnualIncome("1000000");
		mockObj3.setEstNetWorth("1000000");	
		mockObj3.setCreditRatingMoody("AAA");
		mockObj3.setCreditRatingSNP("AAA");
		mockObj3.setCreditRatingFitch("AAA");
		mockObj3.setLastCreditCheckAprvdRmk("N/A");
		mockObj3.setStockCode("00005");
		mockObj3.setAumBociGrp("1212");
		mockObj3.setExternalKey1("");
		mockObj3.setExternalKey2("");
		mockObj3.setExternalKey3("");
		mockObj3.setExternalKey4("");
		mockObj3.setExternalKey5("");
		mockObj3.setExternalKey6("");
		mockObj3.setExternalKey7("");
		mockObj3.setExternalKey8("");
		mockObj3.setExternalKey9(""); 
		mockObj3.setExternalKey10("");
		mockObj3.setUpdateBy("SYSTEM");
		mockObj3.setLastUpdated("5/1/2015");
		mockObj3.setAction("V"); 
		clientCounterParties.add(mockObj3);
		
		ClientCounterParty mockObj4 = new ClientCounterParty();
		mockObj4.setCcdId("58761");
		mockObj4.setClnCptyName("CHEN CHENG");
		mockObj4.setClnCptyCat("CLIENT"); 
		mockObj4.setCreditRatingInternal("AAA");
		mockObj4.setDomicile("");
		mockObj4.setDomicile("HK");
		mockObj4.setNationality("HK");
		mockObj4.setBusNature("PB");
		mockObj4.setAnnualIncome("1000000");
		mockObj4.setEstNetWorth("1000000");	
		mockObj4.setCreditRatingMoody("AAA");
		mockObj4.setCreditRatingSNP("AAA");
		mockObj4.setCreditRatingFitch("AAA");
		mockObj4.setLastCreditCheckAprvdRmk("N/A");
		mockObj4.setStockCode("00005");
		mockObj4.setAumBociGrp("1212");
		mockObj4.setExternalKey1("");
		mockObj4.setExternalKey2("");
		mockObj4.setExternalKey3("");
		mockObj4.setExternalKey4("");
		mockObj4.setExternalKey5("");
		mockObj4.setExternalKey6("");
		mockObj4.setExternalKey7("");
		mockObj4.setExternalKey8("");
		mockObj4.setExternalKey9(""); 
		mockObj4.setExternalKey10("");
		mockObj4.setUpdateBy("SYSTEM");
		mockObj4.setLastUpdated("5/1/2015");
		mockObj4.setAction("V|E"); 
		clientCounterParties.add(mockObj4);
		
		ClientCounterParty mockObj5 = new ClientCounterParty();
		mockObj5.setCcdId("12596");
		mockObj5.setClnCptyName("CHEN HONG");
		mockObj5.setClnCptyCat("CLIENT"); 
		mockObj5.setCreditRatingInternal("AAA");
		mockObj5.setDomicile("");
		mockObj5.setNationality("");
		mockObj5.setBusNature("");
		mockObj5.setAnnualIncome("");
		mockObj5.setEstNetWorth("");	
		mockObj5.setCreditRatingMoody("");
		mockObj5.setCreditRatingSNP("");
		mockObj5.setCreditRatingFitch("");
		mockObj5.setLastCreditCheckAprvdRmk("");
		mockObj5.setStockCode("");
		mockObj5.setAumBociGrp("");
		mockObj5.setExternalKey1("");
		mockObj5.setExternalKey2("");
		mockObj5.setExternalKey3("");
		mockObj5.setExternalKey4("");
		mockObj5.setExternalKey5("");
		mockObj5.setExternalKey6("");
		mockObj5.setExternalKey7("");
		mockObj5.setExternalKey8("");
		mockObj5.setExternalKey9(""); 
		mockObj5.setExternalKey10("");
		mockObj5.setUpdateBy("SYSTEM");
		mockObj5.setLastUpdated("5/1/2015");
		mockObj5.setAction("V");
		clientCounterParties.add(mockObj5);
		
		ClientCounterParty mockObj6 = new ClientCounterParty();
		mockObj6.setCcdId("15932");
		mockObj6.setClnCptyName("CHEN ZHEN");
		mockObj6.setClnCptyCat("CLIENT"); 
		mockObj6.setCreditRatingInternal("AAA");
		mockObj6.setDomicile("HK");
		mockObj6.setNationality("HK");
		mockObj6.setBusNature("PB");
		mockObj6.setAnnualIncome("1000000");
		mockObj6.setEstNetWorth("1000000");	
		mockObj6.setCreditRatingMoody("AAA");
		mockObj6.setCreditRatingSNP("AAA");
		mockObj6.setCreditRatingFitch("AAA");
		mockObj6.setLastCreditCheckAprvdRmk("N/A");
		mockObj6.setStockCode("00005");
		mockObj6.setAumBociGrp("1212");
		mockObj6.setExternalKey1("");
		mockObj6.setExternalKey2("");
		mockObj6.setExternalKey3("");
		mockObj6.setExternalKey4("");
		mockObj6.setExternalKey5("");
		mockObj6.setExternalKey6("");
		mockObj6.setExternalKey7("");
		mockObj6.setExternalKey8("");
		mockObj6.setExternalKey9(""); 
		mockObj6.setExternalKey10("");
		mockObj6.setUpdateBy("");
		mockObj6.setLastUpdated("");
		mockObj6.setAction("V"); 
		clientCounterParties.add(mockObj6);
		
		return clientCounterParties;
	}
	
	
	public List<ClientCounterParty> mockCRCounterParty(){
		List<ClientCounterParty> clientCounterParties = new ArrayList<ClientCounterParty>();
		return clientCounterParties;
	}
	
	
	@RequestMapping(value = "/guarantor", method = RequestMethod.GET)
	public @ResponseBody List<Guarantor> guarantor(HttpServletRequest request) throws Exception{
		List<Guarantor> guarantorList = new ArrayList<Guarantor>();
		List<Guarantor> mockGurantorList = mockGurantorData();
		String ccdId = request.getParameter("ccdId");
		for(Guarantor guarantor : mockGurantorList){
			if(ccdId.equalsIgnoreCase(guarantor.getCcdId())){
				guarantorList.add(guarantor);
			}
		}
	
		return guarantorList;
	}
	
	
	public List<Guarantor> mockGurantorData(){
		List<Guarantor> guarantorList = new ArrayList<Guarantor>();
		
		Guarantor mockObj = new Guarantor();
		
		mockObj.setGuarId("111111");
		mockObj.setCcdId("76258");
		mockObj.setLimitType("A");
		mockObj.setFacId("15498461"); 
		mockObj.setGuarName("ABC");
		mockObj.setRelWithBwr("NA");
		mockObj.setGuarDomicile("HK");
		mockObj.setGuarAddr("HK");
		mockObj.setCreditSupScope("NA");
		mockObj.setGuarCollAmtCapCcy("HKD");	
		mockObj.setGuatColAmtCap("10000");
		mockObj.setGuarExpDate("5/1/2015");
		mockObj.setNoticePeriod("50");
		guarantorList.add(mockObj);
		
		Guarantor mockObj1 = new Guarantor();
		
		mockObj1.setGuarId("111112");
		mockObj1.setCcdId("76258");
		mockObj1.setLimitType("A");
		mockObj1.setFacId("15498462"); 
		mockObj1.setGuarName("CDF");
		mockObj1.setRelWithBwr("NA");
		mockObj1.setGuarDomicile("US");
		mockObj1.setGuarAddr("US");
		mockObj1.setCreditSupScope("NA");
		mockObj1.setGuarCollAmtCapCcy("HKD");	
		mockObj1.setGuatColAmtCap("20000");
		mockObj1.setGuarExpDate("5/1/2015");
		mockObj1.setNoticePeriod("50");
		guarantorList.add(mockObj1);
		
		Guarantor mockObj2 = new Guarantor();
		
		mockObj2.setGuarId("111113");
		mockObj2.setCcdId("76258");
		mockObj2.setLimitType("A/E");
		mockObj2.setFacId("15498463"); 
		mockObj2.setGuarName("FGB");
		mockObj2.setRelWithBwr("NA");
		mockObj2.setGuarDomicile("US");
		mockObj2.setGuarAddr("US");
		mockObj2.setCreditSupScope("NA");
		mockObj2.setGuarCollAmtCapCcy("HKD");	
		mockObj2.setGuatColAmtCap("30000");
		mockObj2.setGuarExpDate("5/1/2015");
		mockObj2.setNoticePeriod("50");
		guarantorList.add(mockObj2);
		
		Guarantor mockObj3= new Guarantor();
		
		mockObj3.setGuarId("111114");
		mockObj3.setLimitType("A/E");
		mockObj3.setFacId("15498463"); 
		mockObj3.setGuarName("GDS");
		mockObj3.setRelWithBwr("NA");
		mockObj3.setGuarDomicile("US");
		mockObj3.setGuarAddr("US");
		mockObj3.setCreditSupScope("NA");
		mockObj3.setGuarCollAmtCapCcy("GDS");	
		mockObj3.setGuatColAmtCap("40000");
		mockObj3.setGuarExpDate("5/1/2015");
		mockObj3.setNoticePeriod("50");
		guarantorList.add(mockObj3);
	
		return guarantorList;
	}
	
	@RequestMapping(value = "/getThirdPartyCollateraList", method = RequestMethod.GET)
	public @ResponseBody List<ThirdPartyCollateral> getThirdPartyCollateraList(HttpServletRequest request) throws Exception{
		List<ThirdPartyCollateral> collateralList = new ArrayList<ThirdPartyCollateral>();
		List<ThirdPartyCollateral> mockcollateralList = mockThirdPartyCollateral();
		String ccdId = request.getParameter("ccdId");
		for(ThirdPartyCollateral collateral:mockcollateralList){
			if(collateral.getCcdId().equalsIgnoreCase(ccdId)){
				collateralList.add(collateral);
			}
		}
		return collateralList;
	}
	
	public List<ThirdPartyCollateral> mockThirdPartyCollateral(){
		List<ThirdPartyCollateral> collateralList = new ArrayList<ThirdPartyCollateral>();
		
		ThirdPartyCollateral mockObj = new ThirdPartyCollateral();		
		mockObj.setRelationship("Spouse");
		mockObj.setCcdId("76258");
		mockObj.setChargorBwrName("CHAN HEI");
		mockObj.setCrossCollCapCcyOnRel("12165");
		mockObj.setCrossCollCapAmtOnRel("HKD");
		mockObj.setRelExpDate("5/1/2019");
		collateralList.add(mockObj);
		
		ThirdPartyCollateral mockObj1 = new ThirdPartyCollateral();
		mockObj1.setRelationship("Borther");
		mockObj1.setCcdId("76258");
		mockObj1.setChargorBwrName("CHAN WONG");
		mockObj1.setCrossCollCapCcyOnRel("15641");
		mockObj1.setCrossCollCapAmtOnRel("HKD");
		mockObj1.setRelExpDate("5/1/2019");
		collateralList.add(mockObj1);
		
		return collateralList;
	}
	
	
	@RequestMapping(value = "/getLastUpdateDetails", method = RequestMethod.GET)
	public @ResponseBody List<LastUpdateDetails> getLastUpdateDetails(HttpServletRequest request) throws Exception{
		List<LastUpdateDetails> lastUpdateList = new ArrayList<LastUpdateDetails>();
		LastUpdateDetails mocklastUpdateDetails = mockgetLastUpdateDetails();
		String ccdId = request.getParameter("ccdId");
		
		if(mocklastUpdateDetails.getCcdId().equalsIgnoreCase(ccdId)){
			lastUpdateList.add(mocklastUpdateDetails);
		}
		return lastUpdateList;
	}
	
	public LastUpdateDetails mockgetLastUpdateDetails(){
		LastUpdateDetails mockObj = new LastUpdateDetails();
		mockObj.setCcdId("76258");
		mockObj.setCreatedBy("DAVID HO");
		mockObj.setCreatedAt("5/1/2015");		
		mockObj.setUpdatedAt("5/1/2015");
		mockObj.setUpdatedBy("");
		mockObj.setVerifiedBy("MIKE HO");
		mockObj.setVerifiedAt("5/1/2015");
		mockObj.setStatus("status");
		
		return mockObj;
	}
	
	@RequestMapping(value = "/viewChangeReq", method = RequestMethod.GET)
	public ModelAndView viewChangeReq(HttpServletRequest request) throws Exception{
		String val = request.getParameter("ccdId");
			return new ModelAndView("ccpDetailChangeRequestUpdate", "ccdId", val);			
	}
	
}
