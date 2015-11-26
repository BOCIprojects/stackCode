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
	/* .k-grid .k-header {
   		display: none;
	} */
	#list .k-detail-row .k-detail-cell{
		background:  rgba(255, 0, 0, 0.48) !important;
	}
	#list .k-hierarchy-cell a{
		background: #777 !important;
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
	function dataGrids(e){
		console.log(e);
		$(".empty-height").hide();
		
		//$(".k-grid .k-grid-header").show();
		openModal();
		var searchCriteria = {
			groupType:$('#groupType').val(),groupName:$('#groupName').val(),ccdId:$('#ccdId').val()
		};
				
		
		var getCCPDetailsURL = "/ermsweb/creditData";
		
		var activeDataSource = new kendo.data.DataSource({
										transport: {
											read: {
												url: getCCPDetailsURL,
												dataType: "json"
												//data:searchCriteria
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
						
						counterpartyName: { type: "string" },
						accEntity: { type: "string" },
						accountNo: { type: "string" },
						subAcc: { type: "string" },
						accStatus: { type: "string" },
						accAccType: { type: "string" },
						businessUnit: { type: "string" },
						limitType: { type: "string" },
						limitHierarchyLevel: { type: "string" },
						parentLimitType: { type: "string" },
						facilityID: { type: "string" },
						limitExpiryDate: { type: "string" },
						limitCcy: { type: "string" },
						limitAmount: { type: "string" },
						limitAmountLEEBased: { type: "string" },
						counterpartyName: { type: "string" }
					}
				  }
			},
			
			scrollable:true,
			pageable: true, 
			detailInit: detailInit,
			dataBound: function (e) {
				console.log(e);
			    //this.expandRow(this.tbody.find("tr.k-master-row").html(counterpartyName));
			}, 
			excelExport: function(e) {
				e.preventDefault();
				promises[0].resolve(e.workbook);
			},
			columns: [
					{ field: "creditGroup", title: "Credit Group" , width: 120},
					{ field: "counterpartyName", title: "Counterparty Name" , width: 120/* , template:"#=replaceActionGraphics(',',counterpartyName,ccdId)#" */},
					{ field: "accEntity", title: "Acc – Entity", width: 120},
					{ field: "accountNo", title: "Account No", width: 120},
					{ field: "subAcc", title: "Sub Acc", width: 120},
					{ field: "accStatus", title: "Acc - Status", width: 120},
					{ field: "accAccType", title: "Acc - Type", width: 120},
					{ field: "businessUnit", title: "Business Unit", width: 120},
					{ field: "limitType", title: "Limit Type", width: 120},
					{ field: "limitHierarchyLevel", title: "Limit Hierarchy Level", width: 120},
					{ field: "parentLimitType", title: "Parent Limit Type", width: 120},
					{ field: "facilityID", title: "Facility ID", width: 120},
					{ field: "limitExpiryDate", title: "Limit Expiry Date", width: 120},
					{ field: "limitCcy", title: "Limit Ccy", width: 120},
					{ field: "limitAmount", title: "Limit Amount", width: 120},
					{ field: "limitAmountLEEBased", title: "Limit Amount – LEE Based", width: 120},
					
					
			]
		});
				
		
		closeModal();
	}
	
	
	function detailInit(e) {
		console.log(e);
		
		var countVal = e.data.counterpartyName;
		console.log(countVal);
		//alert($(this).find(".k-grid-content .k-grid-header").html());
		//countVal = $(this).find("tbody tr.k-master-row").attr("role", "gridcell").find("td:eq(1)").html();
		//alert($(".k-master-row").attr("role", "gridcell").find("td:eq(1)").html());
		
		var getCCPDetailsURL = "/ermsweb/creditAccount?ccpDetial="+countVal;
		  $("<div/>").appendTo(e.detailCell).kendoGrid({
		    dataSource: {
		        type: "json",
		        transport: {
		            read: getCCPDetailsURL
		        },
		        serverPaging: false,
		        serverSorting: false,
		        serverFiltering: false,
		        pageSize: 5,
		        //filter: { field: "counterpartyName", title: "Counter name", operator: "eq", value: e.data.counterpartyName }
		    },
		    scrollable: false,
		    sortable: false,
		    selectable: false,
		    //pageable: true,
		    columns:
		            [
						{ field: "counterpartyName", title: "Counterparty Name", width: "20px;"},
						{ field: "accountNo", title: "AccountNo", width: 20},
						{ field: "accStatus", title: "Acc - Status", width: 20},
						{ field: "accAccType", title: "Acc - Type", width: 20}
						
		            ]
		  }).data("kendoGrid");
		 }
	
	function replaceActionGraphics(delim, data, ccdid){
		if(data!=null){
			var spltarr = data.split(delim);
			var split_string = "";
					split_string = split_string+"<a href='/ermsweb/counterpartyexposure?ccdId="+ccdid+"'><img src='/ermsweb/resources/images/bg_view.png'/></a>";
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
		<%@ include file="header.jsp" %>
		</br>
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
					<td colspan="1">Credit Group &nbsp;</td>
					<td colspan="6"><input id="groupType" type="text" style="width: 280px;margin-right: 520px;"/></td>
				</tr>
				<tr>
					<td colspan="6">&nbsp;</td>
				</tr>
				<tr>
					<td colspan="1">Client/Counterparty Name &nbsp;</td>
					<td colspan="6"><input id="groupName" type="text" style="width: 280px;"/></td>
				</tr>
				<tr>
					<td colspan="6">&nbsp;</td>
				</tr>
				<tr>
					<td colspan="1">Account No &nbsp;</td>
					<td colspan="6"><input id="ccdId" type="text" style="width: 280px;"/></td>
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
		
	</body>
</html>	