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

    <!-- <head>Enquiry Loan Sub-Participation Ratio</head> -->
<style type="text/css">
	.k-grid-header tr th.k-


{
		background-color:#B54D4D; font-size:13px; color:#fff;
		white-space:pre-line;
	}
</style>
 	<script>
	        $(document).ready(function () {
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
				//Search button click
				$("#submitBtn").kendoButton({
					click: function(){
						var input = $("input:text, select");
						var valid=0;
						for(var i=0;i<input.length;i++){
							if($.trim($(input[i]).val()).length > 0){
								valid = valid + 1;
							}
						}
						if(valid >0){
							dataGrids();
						}
						else{
							alert("Atleast One Field is Required");
						}				
					}
				});
				$("#resetBtn").kendoButton();
				$("#exportBtn").kendoButton();				
        	});
	
	//Displaying Data in the Grids
	function dataGrids(){
		$(".empty-height").hide();
		openModal();
		var searchCriteria = {
			groupType:$('#groupType').val(),groupName:$('#groupName').val(),ccdId:$('#ccdId').val(),cmdClientId:$('#cmdClientId').val(),clientCptyName:$('#clientCptyName').val(),accountNo:$('#accountNo').val(),subAcc:$('#subAcc').val(),accName:$('#accName').val(),accBizUnit:$('#accBizUnit').val()
		};
				
		
		var getCCPDetailsURL = "/ermsweb/searchData";
		
		var activeDataSource = new kendo.data.DataSource({
										transport: {
											read: {
												url: getCCPDetailsURL,
												dataType: "json",
												data:searchCriteria
											}
										},
										pageSize: 3
									});
		
		var getCCPCrDetailsURL = "/ermsweb/searchCRData";
		
		var changeRequestDataSource = new kendo.data.DataSource({
										transport: {
											read: {
												url: getCCPCrDetailsURL,
												dataType: "json",
												data:searchCriteria
											}
										},
										pageSize: 3
									});
		
		
		$("#list").kendoGrid({
			excel: {
				 allPages: true
			},
			dataSource: activeDataSource,
				pageSize: 1,
				schema: {
				  model: {
					fields: {
					  ccdId: { type: "string" },
					  clnCptyName: { type: "string" },
					  clnCptyCat: { type: "string" },
					  creditRatingInteral: { type: "string" },					  
					  externalKey1: { type: "string" },
					  externalKey2: { type: "string" },
					  externalKey3: { type: "string" },
					  externalKey4: { type: "string" },
					  externalKey5: { type: "string" },
					  externalKey6: { type: "string" },
					  externalKey7: { type: "string" },
					  externalKey8: { type: "string" },
					  externalKey9: { type: "string" },
					  externalKey10: { type: "string" },
					  lastUpdateBy: { type: "date" },
					  lastUpdateDt: { type: "date" },
					  action: { type: "string" }			  
					}
				  }
			},
			
			scrollable:true,
			pageable: true, 
			excelExport: function(e) {
				e.preventDefault();
				promises[0].resolve(e.workbook);
			},
			columns: [
					{ field: "ccdId", title: "CCD ID" , width: 120},
					{ field: "clnCptyName", title: "Client/Counterparty Name", width: 120},
					{ field: "clnCptyCat", title: "Client/Counterparty Category", width: 120},
					{ field: "creditRatingInteral", title: "Credit Rating - Internal (Private)", width: 120},
					{ field: "externalKey1", title: "External Key ID #1", width: 120},
					{ field: "externalKey2", title: "External Key ID #2", width: 120},
					{ field: "externalKey3", title: "External Key ID #3", width: 120},
					{ field: "externalKey4", title: "External Key ID #4", width: 120},
					{ field: "externalKey5", title: "External Key ID #5", width: 120},
					{ field: "externalKey6", title: "External Key ID #6", width: 120},
					{ field: "externalKey7", title: "External Key ID #7", width: 120},
					{ field: "externalKey8", title: "External Key ID #8", width: 120},
					{ field: "externalKey9", title: "External Key ID #9", width: 120},
					{ field: "externalKey10", title: "External Key ID #10", width: 120},
					{ field: "updateBy", title: "Updated by", width: 120},
					{ field: "lastUpdated", title: "Last Updated", width: 120},
					{ field: "action", title: "Action", template:"#=replaceActionGraphics('|',action,ccdId)#", width: 120}
			]
		});
				
		$("#list1").kendoGrid({
				dataSource: changeRequestDataSource,
					pageSize: 1,
					schema: {
					  model: {
						fields: {
						  ccdId: { type: "string" },
						  clnCptyName: { type: "string" },
						  clnCptyCat: { type: "string" },
						  creditRatingInteral: { type: "string" },					  
						  externalKey1: { type: "string" },
						  externalKey2: { type: "string" },
						  externalKey3: { type: "string" },
						  externalKey4: { type: "string" },
						  externalKey5: { type: "string" },
						  externalKey6: { type: "string" },
						  externalKey7: { type: "string" },
						  externalKey8: { type: "string" },
						  externalKey9: { type: "string" },
						  externalKey10: { type: "string" },
						  lastUpdateBy: { type: "date" },
						  lastUpdateDt: { type: "date" },
						  action: { type: "string" }						  
						}
					  }
				},
				scrollable:true,
				pageable: true,
				excelExport: function(e) {
					e.preventDefault();
					promises[1].resolve(e.workbook);
				},
				columns: [
						{ field: "ccdId", title: "CCD ID" , width: 120},
						{ field: "clnCptyName", title: "Client/Counterparty Name", width: 120},
						{ field: "clnCptyCat", title: "Client/Counterparty Category", width: 120},
						{ field: "creditRatingInteral", title: "Credit Rating - Internal (Private)", width: 120},
						{ field: "externalKey1", title: "External Key ID #1", width: 120},
						{ field: "externalKey2", title: "External Key ID #2", width: 120},
						{ field: "externalKey3", title: "External Key ID #3", width: 120},
						{ field: "externalKey4", title: "External Key ID #4", width: 120},
						{ field: "externalKey5", title: "External Key ID #5", width: 120},
						{ field: "externalKey6", title: "External Key ID #6", width: 120},
						{ field: "externalKey7", title: "External Key ID #7", width: 120},
						{ field: "externalKey8", title: "External Key ID #8", width: 120},
						{ field: "externalKey9", title: "External Key ID #9", width: 120},
						{ field: "externalKey10", title: "External Key ID #10", width: 120},
						{ field: "status", title: "Status", width: 120},
						{ field: "updateBy", title: "Updated by", width: 120},
						{ field: "lastUpdated", title: "Last Updated", width: 120},
						{ field: "action", title: "Action", template:"#=replaceActionGraphics(',',action,ccdId)#", width: 120}
				]
		});
		closeModal();
	}

	
	function replaceActionGraphics(delim, data, ccdid){
		if(data!=null){
			var spltarr = data.split(delim);
			var split_string = "";
			$.each(spltarr, function(j){
				console.log(spltarr[j]);
				if(spltarr[j] != ""){
					//split_string = (spltarr[j] == "V") ? split_string+"<a href='/ermsweb/viewCounterParty?ccdId="+ccdid+"'><img src='/ermsweb/resources/images/bg_view.png'/></a>" : split_string+"<a href='/ermsweb/viewUpdate?ccdId="+ccdid+"'><img src='/ermsweb/resources/images/bg_update.png'/></a>";
					switch(spltarr[j]){
					case "V":
						split_string = split_string+"<a href='/ermsweb/viewCounterParty?ccdId="+ccdid+"'><img src='/ermsweb/resources/images/bg_view.png'/></a>";
						break;
					case "E":
						split_string = split_string+"<a href='/ermsweb/viewUpdate?ccdId="+ccdid+"'><img src='/ermsweb/resources/images/bg_update.png'/></a>";
						break;
					case "A":
						split_string = split_string+"<a href='/ermsweb/verifyCounterParty?ccdId="+ccdid+"'><img src='/ermsweb/resources/images/bg_update.png'/></a>";
						break;
					case "D":
						split_string = split_string+"<a href='/ermsweb/viewChangeReq?ccdId="+ccdid+"'><img src='/ermsweb/resources/images/bg_view.png'/></a>";
						break;
					default:
						split_string = "";
						break;
					}
				}
			});
			console.log("split_string: "+split_string);
			return split_string;
		}
	}
	
	function expandCriteria(){
		var filterBody = document.getElementById("filterBody").style.display;
		if(filterBody == "block"){
			document.getElementById("filterBody").style.display = "none";
			document.getElementById("filterTable").innerHTML = "(+) Filter Criteria";
		}else{
			document.getElementById("filterBody").style.display = "block";
			document.getElementById("filterTable").innerHTML= "(-) Filter Criteria";
		}
	}
	
	function openModal() {
	     $("#modal, #modal1").show();
	}

	function closeModal() {
	    $("#modal, #modal1").hide();	    
	}
    </script>

	<body>
<!-- 		<script type="text/javascript" src="js/header.js"></script> -->
		<div style="background-color:pink; width:1000" class="pageTitle">Client Counterparty RMD Detail Maintenance</div>
		<br>

		<table id="listTable" width="1000" style="background-color:#DBE5F1; overflow-x:scroll" cellpadding="0" cellspacing="0">
			<tr>
				<td colspan="6" style="background-color:#8DB4E3; width:100%;">
				<b><div id="filterTable" onclick="expandCriteria()">(-) Filter Criteria</div></b></td>
			</tr>
			<tr>
				<td><br/></td>
			</tr>
			<tbody id="filterBody" style="display: block">
				<tr width="100%">
					<td>Group Type.</td>
					<td><input id="groupType" type="text"/></td>									
					
					<td>Group Name.</td>
					<td><input id="groupName" type="text"/></td>
					
					<td>CCD ID.</td>
					<td><input id="ccdId" type="text"/></td>
				</tr>
				<tr>
					<td colspan="6">&nbsp;</td>
				</tr>
				<tr>
					<td>CMD Client ID.</td>
					<td><input id="cmdClientId" type="text"/></td>					
				
					<td>Client/Counterparty Name.</td>
					<td><input id="clientCptyName" type="text"/></td>
				
					<td>Account No.</td>
					<td><input id="accountNo" type="text"/></td>
				</tr>
				<tr>
					<td colspan="6">&nbsp;</td>
				</tr>
				<tr>
					<td>Sub-acc.</td>
					<td><input id="subAcc" type="text"/></td>
				
					<td>Account - Name.</td>
					<td><input id="accName" type="text"/></td>
					
					<td>Acc - Biz Unit.</td>
					<td><input id="accBizUnit" type="text"/></td>
				</tr>
				<tr>
					<td colspan="6">&nbsp;</td>
				</tr>
				<tr>
					<td colspan="6" align="right">
						<button id="submitBtn" class="k-button" type="button">Search</button>
						<button id="resetBtn" type="button">Reset</button>
						<button id="exportBtn" type="button">Export</button>
					</td>
				</tr>
			</tbody>
		</table>
		<br/>		
		<div style="overflow-x: scroll; width:1000px;">
			<table width="1000" cellpadding="0" cellspacing="0">
				<tr style="background-color:#5A2727; color:white">
					<td>
						Client Counterparty Table
					</td>
				</tr>
				<tr>
					<td>
						<div id="list">
													
						</div>
						<p class="empty-height">&nbsp;</p>
						<div id="modal" align="center" style="display:none;">
							<img id="loader" src="/ermsweb/resources/images/ajax-loader.gif" />
						</div>						
					</td>
				</tr>				
			</table>
		</div>
		<!-- <div style="font-size: 13px" id="countRow"></div>
		<div id="pager1"></div> -->
		<br/>
		<div style="overflow-x: scroll; width:1000px;">
			<table width="100%" cellpadding="0" cellspacing="0">
				<tr style="background-color:#5A2727; color:white">
					<td colspan="17">
						Client Counterparty RMD Detail change request Table
					</td>
				</tr>
				<tr>
					<td>
						<div id="list1">
													
						</div>
						<p class="empty-height">&nbsp;</p>
						<div id="modal" align="center" style="display:none;">
							<img id="loader" src="/ermsweb/resources/images/ajax-loader.gif" />
						</div>						
					</td>
				</tr>				
			</table>
		</div>		
	</body>
</html>	