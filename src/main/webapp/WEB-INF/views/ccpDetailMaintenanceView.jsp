<html lang="en">

	<meta http-equiv="Content-Style-Type" content="text/css">
    <meta http-equiv="Content-Script-Type" content="text/javascript">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <script type="text/javascript" src="/ermsweb/resources/js/validation.js"></script>
    
    <!-- General layout Style -->
    <link href="/ermsweb/resources/css/layout.css" rel="stylesheet" type="text/css">

    <!-- Kendo UI API -->
    <link rel="stylesheet" href="/ermsweb/resources/css/kendo.common.min.css">
    <link rel="stylesheet" href="/ermsweb/resources/css/kendo.rtl.min.css">
    <link rel="stylesheet" href="/ermsweb/resources/css/kendo.default.min.css">
    <link rel="stylesheet" href="/ermsweb/resources/css/kendo.dataviz.min.css">
    <link rel="stylesheet" href="/ermsweb/resources/css/kendo.dataviz.default.min.css">
    <link rel="stylesheet" href="/ermsweb/resources/css/kendo.mobile.all.min.css">

    <!-- jQuery JavaScript -->
    <script src="/ermsweb/resources/js/jquery.min.js"></script>

    <!-- Kendo UI combined JavaScript -->
    <script src="/ermsweb/resources/js/kendo.all.min.js"></script>

	<style type="text/css">
		.k-grid-header tr th.k-header, .grid-container tr th{
			background-color:#B54D4D; font-size:13px; color:#fff;
			white-space:pre-line;
		}
		
		.grid-container tr th{
			min-width:150px;
			padding:5px;
			white-space:nowrap;
			border-right:1px solid #c5c5c5;
			background-image: none, linear-gradient(to bottom, rgba(255, 255, 255, 0.6) 0px, rgba(255, 255, 255, 0) 100%);
		}
		
		#filterBody tr td:nth-child(even){
			padding-right:10px;
		}
		.empty-height{padding:10px;margin:0;}
	</style>
 	<script>
	var objPastToPager = null; // This value will be used to pass the value to another list

	var initialLoad = true; // Nothing
		$(document).ready(
		function(){
			/* Control and initialize the menu bar of header
			 (8 options of menu)
			*/
			$("#menu1").kendoMenu({
				animation: {open: {effects: "slideIn:down"}}
			});
			$("#menu2").kendoMenu({
				animation: {open: {effects: "slideIn:down"}}
			});
			$("#menu3").kendoMenu({
				animation: {open: {effects: "slideIn:down"}}
			});
			$("#menu4").kendoMenu({
				animation: {open: {effects: "slideIn:down"}}
			});
			$("#menu5").kendoMenu({
				animation: {open: {effects: "slideIn:down"}}
			});
			$("#menu6").kendoMenu({
				animation: {open: {effects: "slideIn:down"}}
			});
			$("#menu7").kendoMenu({
				animation: {open: {effects: "slideIn:down"}}
			});

			/* Calling the ajax loader image */
			openModal();
			
			var paramCCDID = ${ccdId};// ${ccdId} is from server which returns ccdID 
			
			/*Datasource for ClientCounterDetails*/
			var dataSource = new kendo.data.DataSource({
				transport: {
					read: {
						url: "/ermsweb/getDataByccdId?ccdId="+paramCCDID,
						dataType: "json"
					}
				},
				schema: {                               // describe the result format
		            data: function(data) {              // the data which the data source will be bound to is in the values field
		                //console.log(data);
		                return [data];
		            }
		        }
			});
			/*Binding Data for ClientCounter Details*/
			dataSource.fetch(function(){
				var jsonObj = this.view();
				$.each(jsonObj, function(i){
					if(jsonObj[i].ccdId == paramCCDID){
						$("#pageTitle").html("Maintenance - Client Counterparty RMD Detail Maintenance - View Client Counterparty Detail");
						$("#ccd_id_label").html("<label>"+jsonObj[i].ccdId+"</label>");
						$("#client_counterparty_name_label").html("<label>"+jsonObj[i].clnCptyName+"</label>");
						$("#client_counterparty_category_label").html("<label>"+jsonObj[i].clnCptyCat+"</label>");
						$("#domicile_label").html("<label>"+jsonObj[i].domicile+"</label>");
						$("#nationality_label").html("<label>"+jsonObj[i].nationality+"</label>");
						$("#business_nature_label").html("<label>"+jsonObj[i].busNature+"</label>");
						$("#annual_income_label").html("<label>"+jsonObj[i].annualIncome+"</label>");
						$("#estimate_net_worth_label").html("<label>"+jsonObj[i].estNetWorth+"</label>");
						$("#credit_rating_internal_private_label").html("<label>"+jsonObj[i].creditRatingInternal+"</label>");
						$("#credit_rating_moodys_label").html("<label>"+jsonObj[i].CreditRatingMoody+"</label>");
						$("#credit_rating_s_p_label").html("<label>"+jsonObj[i].creditRatingSNP+"</label>");
						$("#credit_rating_fitch_label").html("<label>"+jsonObj[i].creditRatingFitch+"</label>");
						$("#last_credit_check_approved_condition_remark_label").html("<label>"+jsonObj[i].lastCreditCheckAprvdRmk+"</label>");
						$("#stock_code_for_listed_company_label").html("<label>"+jsonObj[i].stockCode+"</label>");
						$("#aum_in_boci_group_label").html("<label>"+jsonObj[i].aumBociGrp+"</label>");							
						$("#checkEXTKey1").html("<label>"+jsonObj[i].externalKey1+"</label>");
						$("#checkEXTKey2").html("<label>"+jsonObj[i].externalKey2+"</label>");
						$("#checkEXTKey3").html("<label>"+jsonObj[i].externalKey3+"</label>");
						$("#checkEXTKey4").html("<label>"+jsonObj[i].externalKey4+"</label>");
						$("#checkEXTKey5").html("<label>"+jsonObj[i].externalKey5+"</label>");
						$("#checkEXTKey6").html("<label>"+jsonObj[i].externalKey6+"</label>");
						$("#checkEXTKey7").html("<label>"+jsonObj[i].externalKey7+"</label>");
						$("#checkEXTKey8").html("<label>"+jsonObj[i].externalKey8+"</label>");
						$("#checkEXTKey9").html("<label>"+jsonObj[i].externalKey9+"</label>");
						$("#checkEXTKey10").html("<label>"+jsonObj[i].externalKey10+"</label>");
						$("#buttonType").html("<button id=\"updateBtn\" style=\"background:blue; color:white\" type=\"button\" data-role=\"button\" class=\"k-button\" role=\"button\" aria-disabled=\"false\" tabindex=\"0\" onclick=\"toUpdate('"+jsonObj[i].ccdId+"')\">Update</button><label>    </label><button id=\"backBtn\" onclick=\"toBack()\" type=\"button\" data-role=\"button\" class=\"k-button\" role=\"button\" aria-disabled=\"false\" tabindex=\"0\">Back</button>");
					}
				});
			});
			
		/*Datasource for Guarantor List*/
		var guarantordataSource = new kendo.data.DataSource({
			transport: {
				read: {
					url: "/ermsweb/guarantor?ccdId="+paramCCDID,//"/ermsweb/resources/js/guarantor.json",
					dataType: "json"
				}
			},
			pageSize:3		
		});
		/*Binding Data for Guarantor List to the Grid*/
		$("#guarantorList").kendoGrid({
			dataSource: guarantordataSource,
			scrollable:true,
			pageable: true,
			columns: [
				{ field: "guarId", title: "Guarantor ID " , width: 30},
				{ field: "limitType", title: "Limit Type ", width: 30},
				{ field: "facId", title: "Facility ID", width: 30},
				{ field: "guarName", title: "Guarantor Name", width: 30},
				{ field: "relWithBwr", title: "Relationship with Borrower", width: 30},
				{ field: "guarDomicile", title: "Guarantor Domicile", width: 30},
				{ field: "guarAddr", title: "Guarantor Address", width: 30},
				{ field: "creditSupScope", title: "Credit Support Scope ", width: 30},
				{ field: "Support_Type", title: "Support Type", width: 30},
				{ field: "guarCollAmtCapCcy", title: "Guarantee / Collateral Amount Cap Ccy ", width: 30},
				{ field: "guatColAmtCap", title: "Guarantee / Collateral Amount Cap ", width: 30},
				{ field: "guarExpDate", title: "Guarantee Expiry Date ", width: 30},
				{ field: "noticePeriod", title: "Notice Period", width:30}
			]
		});
		
		/*Datasource for ThirdPartyCollateral List*/
		var collateraldataSource = new kendo.data.DataSource({
			transport: {
				read: {
					url: "/ermsweb/getThirdPartyCollateraList?ccdId="+paramCCDID,
					dataType: "json"
				}
			},
			pageSize:1									
		});
		/*Binding Data for ThirdPartyCollateral List to the Grid*/
		$("#collateralList").kendoGrid({
			dataSource: collateraldataSource,
			scrollable:true,
			pageable: true,
			columns: [
				{ field: "relationship", title: "Relationship" , width: 30},
				{ field: "chargorBwrName", title: "Chargor/Borrower Name", width: 30},
				{ field: "crossCollCapCcyOnRel", title: "Cross collateral cap currency on Relationship", width: 30},
				{ field: "crossCollCapAmtOnRel", title: "Cross collateral cap amount on Relationship ", width: 30},
				{ field: "relExpDate", title: "Relationship Expiry Date", width: 30}
			 ]
		});
	 	
		/*Datasource for Audit Details*/
	 	var updatedetailsdataSource = new kendo.data.DataSource({
			transport: {
				read: {
					url: "/ermsweb/getLastUpdateDetails?ccdId="+paramCCDID,
					dataType: "json"
				}
			},
			schema: {                               // describe the result format
	            data: function(data) {              // the data which the data source will be bound to is in the values field
	                return data;
	            }
	        }
    	});
	 	/*Binding Data for Audit Details*/
	 	updatedetailsdataSource.fetch(function(){
			var jsonObj = this.view();
			$.each(jsonObj, function(i){
				if(jsonObj[i].ccdId == paramCCDID){
					$("#created_by").html(jsonObj[i].createdBy);
					$("#created_at").html(jsonObj[i].createdAt);
					$("#updated_by").html(jsonObj[i].updatedBy);
					$("#updated_at").html(jsonObj[i].updatedAt);
					$("#verified_by").html(jsonObj[i].verifiedBy);
					$("#verified_at").html(jsonObj[i].verifiedAt);
					$("#status_last").html(jsonObj[i].status);
				}
			});
		});
		/*Calling the method for hiding the ajaxloader image*/
		closeModal();
});
	
	
	/* Open spinner while getting the data from back-end*/
	function openModal() {
		$("#modal, #modal1, #modal2, #modal3").show();
	}
	/* Close spinner after getting the data from back-end*/
	function closeModal() {
		$("#modal, #modal1, #modal2, #modal3").hide();	    
	}

	/* Action - Save button */
	function toUpdate(uid){
		window.location = "/ermsweb/viewUpdate?ccdId="+uid;
	}
	
	/* Action - Back button */
	function toBack(){
		//window.history.back();
		window.location = "/ermsweb/ccprmddetailmaintenance";
	}
		
    </script>

	<body>
		<div id="pageTitle" style="background-color:pink; width:100%">
		</div>
		<br>

		<table id="listTable" width="500" style=" overflow-y :scroll" >
			<tr>
				<td></td>				
				<td align="right">
					<div id="buttonType">
						
					</div>
				</td>
			</tr>
			<tr>
				<td colspan="4" style="background-color:#393052;color:white; width:500; font-size:13px">Client Counterparty RMD Detail section</td>
			</tr>
			<tr>
				<td width="166" style="font-size:13px; background-color:#B5A2C6">CCD ID.</td>
				<td width="333" style="font-size:13px; background-color:#E7E3EF"><div id="ccd_id_label"><label></label></div></td>				
			</tr>
			<tr>
				<td width="166" style="font-size:13px; background-color:#B5A2C6">Client/Counterparty Name.</td>
				<td width="333" style="font-size:13px; background-color:#E7E3EF"><div id="client_counterparty_name_label"><label></label></div></td>				
			</tr>
			<tr>
				<td width="166" style="font-size:13px; background-color:#B5A2C6">Client/Counterparty Category.</td>
				<td width="333" style="font-size:13px; background-color:#E7E3EF"><div id="client_counterparty_category_label"><label></label></div></td>				
			</tr>
			<tr>
				<td width="166" style="font-size:13px; background-color:#B5A2C6">Domicile.</td>
				<td width="333" style="font-size:13px; background-color:#E7E3EF"><div id="domicile_label"><label></label></div></td>				
			</tr>
			<tr>
				<td width="166" style="font-size:13px; background-color:#B5A2C6">Nationality.</td>
				<td width="333" style="font-size:13px; background-color:#E7E3EF"><div id="nationality_label"><label></label></div></td>				
			</tr>
			<tr>
				<td width="166" style="font-size:13px; background-color:#B5A2C6">Business Nature.</td>
				<td width="333" style="font-size:13px; background-color:#E7E3EF"><div id="business_nature_label"><label></label></div></td>				
			</tr>
			<tr>
				<td width="166" style="font-size:13px; background-color:#B5A2C6">Annual Income.</td>
				<td width="333" style="font-size:13px; background-color:#E7E3EF"><div id="annual_income_label"><label></label></div></td>				
			</tr>
			<tr>
				<td width="166" style="font-size:13px; background-color:#B5A2C6">Estimate Net Worth.</td>
				<td width="333" style="font-size:13px; background-color:#E7E3EF"><div id="estimate_net_worth_label"><label></label></div></td>				
			</tr>
			<tr>
				<td width="166" style="font-size:13px; background-color:#B5A2C6">Credit Rating - Internal (Private).</td>
				<td width="333" style="font-size:13px; background-color:#E7E3EF"><div id="credit_rating_internal_private_label"><label></label></div></td>				
			</tr>
			<tr>
				<td width="166" style="font-size:13px; background-color:#B5A2C6">Credit Rating - Moody's.</td>
				<td width="333" style="font-size:13px; background-color:#E7E3EF"><div id="credit_rating_moodys_label"><label></label></div></td>				
			</tr>
			<tr>
				<td width="166" style="font-size:13px; background-color:#B5A2C6">Credit Rating - S&nbp;P.</td>
				<td width="333" style="font-size:13px; background-color:#E7E3EF"><div id="credit_rating_s_p_label"><label></label></div></td>				
			</tr>
			<tr>
				<td width="166" style="font-size:13px; background-color:#B5A2C6">Credit Rating – Fitch.</td>
				<td width="333" style="font-size:13px; background-color:#E7E3EF"><div id="credit_rating_fitch_label"><label></label></div></td>				
			</tr>
			<tr>
				<td width="166" style="font-size:13px; background-color:#B5A2C6">Last Credit Check Approved Condition Remark.</td>
				<td width="333" style="font-size:13px; background-color:#E7E3EF"><div id="last_credit_check_approved_condition_remark_label"><label></label></div></td>				
			</tr>
			<tr>
				<td width="166" style="font-size:13px; background-color:#B5A2C6">Stock Code (for listed company).</td>
				<td width="333" style="font-size:13px; background-color:#E7E3EF"><div id="stock_code_for_listed_company_label"><label></label></div></td>				
			</tr>
			<tr>
				<td width="166" style="font-size:13px; background-color:#B5A2C6">AUM in BOCI Group.</td>
				<td width="333" style="font-size:13px; background-color:#E7E3EF"><div id="aum_in_boci_group_label"><label></label></div></td>				
			</tr>			
			<tr>
				<td width="166" style="font-size:13px; background-color:#B5A2C6">External Key ID #1</td>
				<td width="333" style="font-size:13px; background-color:#E7E3EF">
					<div id="checkEXTKey1"/>
				</td>
			</tr>
			<tr>
				<td width="166" style="font-size:13px; background-color:#B5A2C6">External Key ID #2</td>
				<td width="333" style="font-size:13px; background-color:#E7E3EF">
					<div id="checkEXTKey2"/>
				</td>
			</tr>
			<tr>
				<td width="166" style="font-size:13px; background-color:#B5A2C6">External Key ID #3</td>
				<td width="333" style="font-size:13px; background-color:#E7E3EF">
					<div id="checkEXTKey3"/>
				</td>
			</tr>
			<tr>
				<td width="166" style="font-size:13px; background-color:#B5A2C6">External Key ID #4</td>
				<td width="333" style="font-size:13px; background-color:#E7E3EF">
					<div id="checkEXTKey4"/>
				</td>
			</tr>
			<tr>
				<td width="166" style="font-size:13px; background-color:#B5A2C6">External Key ID #5</td>
				<td width="333" style="font-size:13px; background-color:#E7E3EF">
					<div id="checkEXTKey5"/>
				</td>				
			</tr>
			<tr>
				<td width="166" style="font-size:13px; background-color:#B5A2C6">External Key ID #6</td>
				<td width="333" style="font-size:13px; background-color:#E7E3EF">
					<div id="checkEXTKey6"/>
				</td>				
			</tr>
			<tr>
				<td width="166" style="font-size:13px; background-color:#B5A2C6">External Key ID #7</td>
				<td width="333" style="font-size:13px; background-color:#E7E3EF">
					<div id="checkEXTKey7"/>
				</td>				
			</tr>
			<tr>
				<td width="166" style="font-size:13px; background-color:#B5A2C6">External Key ID #8</td>
				<td width="333" style="font-size:13px; background-color:#E7E3EF">
					<div id="checkEXTKey8"/>
				</td>				
			</tr>
			<tr>
				<td width="166" style="font-size:13px; background-color:#B5A2C6">External Key ID #9</td>
				<td width="333" style="font-size:13px; background-color:#E7E3EF">
					<div id="checkEXTKey9"/>
				</td>				
			</tr>
			<tr>
				<td width="166" style="font-size:13px; background-color:#B5A2C6">External Key ID #10</td>
				<td width="333" style="font-size:13px; background-color:#E7E3EF">
					<div id="checkEXTKey10"/>
				</td>				
			</tr>
			<tr>
				<td><br></td>
			</tr>
			<tr></tr>
			<tr></tr>
		</table>
		<br/>
		
		<div>
			<table width="100%">
				<tr style="background-color:#082439; color:white">
					<td colspan="16">
						<div style="font-size:13px">Client Counterparty Account List</div>
					</td>
				</tr>
				<tr>
					<td>
						<div id="accountList">
							<table id="list-header" class="grid-container" cellpadding="0" cellspacing="0" border="0">
								<tr>
									<th width="166">CCD ID&nbsp;</th>
									<th width="166">CMD Client ID&nbsp;</th>
									<th width="166">Client/Counterparty&nbsp;</th>
									<th width="166">Account No.&nbsp;</th>
									<th width="166">Sub Acc&nbsp;</th>
									<th width="166">Account_Name&nbsp;</th>
									<th width="166">Acc - is Joint (Y/N)&nbsp;</th>
									<th width="166">Acc - Acc Type&nbsp;</th>
									<th width="166">Acc - Open Date&nbsp;</th>
									<th width="166">Acc - Status&nbsp;</th>
									<th width="166">Acc - Entity&nbsp;</th>
									<th width="166">Acc - Biz Unit&nbsp;</th>
									<th width="166">Acc - Sales Code&nbsp;</th>
									<th width="166">Acc - Sales Name&nbsp;</th>
									<th width="166">Acc - Dept Code&nbsp;</th>
									<th width="166">Acc - Source System&nbsp;</th>
								</tr>								
							</table>							
						</div>
						<p class="empty-height">&nbsp;</p>
						<div id="modal" align="center" style="display:none;">
							<img id="loader" src="images/ajax-loader.gif" />
						</div>						
					</td>
				</tr>					
			</table>
			<br/>
		</div>
		<div style="font-size: 13px" id="countRow1"></div>
		<br/>
		
		<div>
			<table id="list1" width="100%" >
				<tr style="background-color:#082439; color:white">
					<td colspan="13">
						<div style="font-size:13px">Guarantor List section</div>
					</td>
				</tr>
				<tr>
					<td>
						<div id="guarantorList">
							<table id="list-header" class="grid-container" cellpadding="0" cellspacing="0" border="0">
								<tr>
									<th width="166">Guarantor ID&nbsp;</th>
									<th width="166">Limit Type&nbsp;</th>
									<th width="166">Facility ID&nbsp;</th>
									<th width="166">Guarantor Name&nbsp;</th>
									<th width="166">Relationship with Borrower&nbsp;</th>
									<th width="166">Guarantor Domicile&nbsp;</th>
									<th width="166">Guarantor Address&nbsp;</th>
									<th width="166">Credit Support Scope&nbsp;</th>
									<th width="166">Support Type&nbsp;</th>
									<th width="166">Guarantee / Collateral Amount Cap Ccy&nbsp;</th>
									<th width="166">Guarantee / Collateral Amount Cap&nbsp;</th>
									<th width="166">Guarantee Expiry Date&nbsp;</th>
									<th width="166">Notice Period&nbsp;</th>
								</tr>								
							</table>							
						</div>
						<p class="empty-height">&nbsp;</p>
						<div id="modal1" align="center" style="display:none;">
							<img id="loader" src="images/ajax-loader.gif" />
						</div>						
					</td>
				</tr>					
			</table>
			<br/>
		</div>
		<div style="font-size: 13px" id="countRow2"></div>
		<br/>
		
		<div>
			<table id="list3" width="100%" >
				<tr style="background-color:#082439; color:white">
					<td colspan="5">
						<div style="font-size:13px">3rd Party Collateral Provider List</div>
					</td>
				</tr>
				<tr>
					<td>
						<div id="collateralList">
							<table id="list-header" class="grid-container" cellpadding="0" cellspacing="0" border="0">
								<tr>
									<th width="166">Relationship&nbsp;</th>
									<th width="166">Chargor/Borrower Name&nbsp;</th>
									<th width="166">Cross collateral cap currency on Relationship&nbsp;</th>
									<th width="166">Cross collateral cap amount on Relationship&nbsp;</th>
									<th width="166">Relationship Expiry Date&nbsp;</th>					
								</tr>								
							</table>							
						</div>
						<p class="empty-height">&nbsp;</p>
						<div id="modal2" align="center" style="display:none;">
							<img id="loader" src="images/ajax-loader.gif" />
						</div>						
					</td>
				</tr>			
			</table>
			<br/>
		</div>
		
		<div style="font-size: 13px" id="countRow3"></div>
		<br/>
		<div style="width:100%" id='MyGrid'>
			<div id="modal3" align="center" style="display:none;">
	            <img id="loader2" src="/ermsweb/resources/images/ajax-loader.gif" />
	        </div>
		</div>
		<table border="0" style="background-color:#B5D5AB;width:100%;">
			<tr>
				<td width="195.5" style="font-size:13px"><b>Created By</b></td>
				<td width="195.5" style="font-size:13px"><label id="created_by"></label></td>
				<td width="195.5" style="font-size:13px"></td>
				<td width="195.5" style="font-size:13px"><b>Created At</b></td>
				<td width="195.5" style="font-size:13px"><label id="created_at"></label></td>
			</tr>
			<tr>
				<td width="195.5" style="font-size:13px"><b>Updated By</b></td>
				<td width="195.5" style="font-size:13px"><label id="updated_by"></label></td>
				<td width="195.5" style="font-size:13px"></td>
				<td width="195.5" style="font-size:13px"><b>Updated At</b></td>
				<td width="195.5" style="font-size:13px"><label id="updated_at"></label></td>
			</tr>
			<tr>
				<td width="195.5" style="font-size:13px"><b>Verified By</b></td>
				<td width="195.5" style="font-size:13px"><label id="verified_by"></label></td>
				<td width="195.5" style="font-size:13px"></td>
				<td width="195.5" style="font-size:13px"><b>Verified At</b></td>
				<td width="195.5" style="font-size:13px"><label id="verified_at"></label></td>
			</tr>
			<tr>
				<td width="195.5" style="font-size:13px"><b>Status</b></td>
				<td width="195.5" style="font-size:13px"><label id="status_last"></label></td>
				<td width="195.5" style="font-size:13px"></td>
				<td width="195.5" style="font-size:13px"></td>
				<td width="195.5" style="font-size:13px"></td>
			</tr>
		</table>
	</body>
</html>	