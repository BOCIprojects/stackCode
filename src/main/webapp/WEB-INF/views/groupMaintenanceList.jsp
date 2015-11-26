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
	
	 	<script>
	 			/* alert("Current Role : " + window.parent.getRole()); */
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
	
		        	var objPastToPager = null;
		        	var initialLoad = true;
		        	
		        	document.getElementById("groupName").value = checkUndefinedElement(sessionStorage.getItem("groupName"));
		        	document.getElementById("groupType").value = checkUndefinedElement(sessionStorage.getItem("groupType"));
		        	document.getElementById("ccdId").value = checkUndefinedElement(sessionStorage.getItem("ccdId"));
		        	document.getElementById("cmdClientId").value = checkUndefinedElement(sessionStorage.getItem("cmdClientId"));
		        	document.getElementById("clientCptyName").value = checkUndefinedElement(sessionStorage.getItem("clientCptyName"));
		        	document.getElementById("accountNo").value = checkUndefinedElement(sessionStorage.getItem("accountNo"));
		        	document.getElementById("subAcc").value = checkUndefinedElement(sessionStorage.getItem("subAcc"));
		        	document.getElementById("accName").value = checkUndefinedElement(sessionStorage.getItem("accName"));
		        	document.getElementById("accBizUnit").value = checkUndefinedElement(sessionStorage.getItem("accBizUnit"));
		        	document.getElementById("returnMessage").innerHTML = checkUndefinedElement(sessionStorage.getItem("message"));
	
		        	/*submitButtonEvent();*/
		        	
					sessionStorage.setItem("groupName","");
		        	sessionStorage.setItem("groupType","");
		        	sessionStorage.setItem("ccdId","");
		        	sessionStorage.setItem("cmdClientId","");
		        	sessionStorage.setItem("clientCptyName","");
		        	sessionStorage.setItem("accountNo","");
		        	sessionStorage.setItem("subAcc","");
		        	sessionStorage.setItem("accName","");
		        	sessionStorage.setItem("accBizUnit","");
		        	sessionStorage.setItem("message","");
		        	
		        	$("#submitBtn").kendoButton({
		        		click: function(e) {
							submitButtonEvent();
			            }
			       	});
		
			       	$("#resetBtn").kendoButton({
			       		click: function(e) {
			       			document.getElementById("groupName").value = "";
			       			document.getElementById("groupType").value = "";
			       			document.getElementById("ccdId").value = "";
			       			document.getElementById("cmdClientId").value = "";
			       			document.getElementById("clientCptyName").value = "";
			       			document.getElementById("accountNo").value = "";
			       			document.getElementById("subAcc").value = "";
			       			document.getElementById("accName").value = "";
			       			document.getElementById("accBizUnit").value = "";
			       			document.getElementById("returnMessage").innerHTML = "";
			       		}
			       	});
			       	$("#exportBtn").kendoButton();
	        	}
	        );
	
		function displayFilterResults() {
		  // Gets the data source from the grid.
		  	var dataSource = $("#MyGrid").data("kendoGrid").dataSource;
		  
		  	 	// Gets the filter from the dataSource
		     	var filters = dataSource.filter();
		     	
		     	// Gets the full set of data from the data source
		     	var allData = dataSource.data();
		     	
		     	// Applies the filter to the data
		     	var query = new kendo.data.Query(allData);
		     	var filteredData = query.filter(filters).data;
		     	
		     	// Output the results
		     	$('#FilterCount').html(filteredData.length);
		     	$('#TotalCount').html(allData.length);
		     	$('#FilterResults').html('');
		    	
		    	$.each(filteredData, function(index, item){
		    	  $('#FilterResults').append('<li>'+item.Site+' : '+item.Visitors+'</li>')
		    	});		
		}
		/* Open spinner while getting the data from back-end*/
		function openModal() {
		     document.getElementById('modal').style.display = 'block';
		     document.getElementById('modal2').style.display = 'block';
		}
	
		/* Close spinner when all the data have been received*/
		function closeModal() {
		    document.getElementById('modal').style.display = 'none';
		    document.getElementById('modal2').style.display = 'none';
		}
		// View - V, Update - E, Discard - D, Verify - A, Returned - R //
		/* Get action type from database and to be replaced image icon */
		function replacedByIconOfDetails(groupId, action_types, group_type, group_name, extKey1, extKey2, extKey3, extKey4, extKey5, userId){
			
			var returnImgHTML = "";
							
			if(new RegExp("V").test(action_types)){ 
				if(new RegExp("E").test(action_types) ){
					returnImgHTML += " <a target=\"main_frame\" href=\"groupMaintenanceDetail?action=view|update&rmdGroupId="+groupId+"&userId="+userId+"\"><img src=\"/ermsweb/resources/images/bg_view.png\" width=\"20\" height=\"20\"/></a> ";
					returnImgHTML += " <a target=\"main_frame\" href=\"groupMaintenanceDetail?action=update&rmdGroupId="+groupId+"&userId="+userId+"\"><img src=\"/ermsweb/resources/images/bg_update.png\" width=\"20\" height=\"20\"/></a> ";
				}else{
					returnImgHTML += " <a target=\"main_frame\" href=\"groupMaintenanceDetail?action=view&rmdGroupId="+groupId+"&userId="+userId+"\"><img src=\"/ermsweb/resources/images/bg_view.png\" width=\"20\" height=\"20\"/></a> ";
				}
			}
			return returnImgHTML;
		}
		function replacedByIconOfCR(crId, action_types, group_type, group_name, extKey1, extKey2, extKey3, extKey4, extKey5, userId){
			
			var returnImgHTML = "";
			
			if(new RegExp("V").test(action_types)){ 
				if(new RegExp("E").test(action_types)){
					returnImgHTML += " <a target=\"main_frame\" href=\"groupMaintenanceChangeRequest?action=view|update&crId="+crId+"&userId="+userId+"\"><img src=\"/ermsweb/resources/images/bg_view.png\" width=\"20\" height=\"20\"/></a> ";
					returnImgHTML += " <a target=\"main_frame\" href=\"groupMaintenanceChangeRequest?action=update&crId="+crId+"&userId="+userId+"\"><img src=\"/ermsweb/resources/images/bg_update.png\" width=\"20\" height=\"20\"/></a> ";
				}else{
					returnImgHTML += " <a target=\"main_frame\" href=\"groupMaintenanceChangeRequest?action=view&crId="+crId+"&userId="+userId+"\"><img src=\"/ermsweb/resources/images/bg_view.png\" width=\"20\" height=\"20\"/></a> ";			
				}
			}
			
			if(new RegExp("A").test(action_types)){ 
				returnImgHTML += " <a target=\"main_frame\" href=\"groupMaintenanceChangeRequest?action=verify&crId="+crId+"&userId="+userId+"\"><img src=\"/ermsweb/resources/images/bg_update.png\" width=\"20\" height=\"20\"/></a> ";
			}	
			return returnImgHTML;
		}
		
		/* Handle underfined / null element */
		function checkUndefinedElement(element){
			if(element === null || element === "undefined"){
				return "";
			}else{
				return element;
			}
		}
		
		function getCookie(key) {  
		   var keyValue = document.cookie.match('(^|;) ?' + key + '=([^;]*)(;|$)');  
		   return keyValue ? keyValue[2] : null;  
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
		function submitButtonEvent(){
	
			document.getElementById("tableScope1").style.display = "block";
			document.getElementById("tableScope2").style.display = "block";
			
	     	/* Delete / Clean rows for refresh the table by delete all of rows */
	     	var oRows = document.getElementById('listTable').getElementsByTagName('tr');
	     	var iRowCount = oRows.length;
	
	     	for (var i = 0; i < 15; i++) {
	        	$('#tabRow'+i).remove();
	     	};
	     	
	     	/* TEST - Get Session */
     		/*var getLogin = "http://lxdapp25:8080/ERMSCore/login?username=riskadmin&password=risk1234&domain=HKDM";

	     	var xhttp = new XMLHttpRequest();
	     	xhttp.onreadystatechange = function() {
			    if (xhttp.readyState == 4 && xhttp.status == 200) {
			     	console.log("Get Login -> " + xhttp.responseText);
			     	var obj = JSON.parse(xhttp.response);
			     	console.log(obj);*/


			  /*var getDetailURL = "http://lxdapp25:8080/ERMSCore/groupDetail/getDetails?groupType="+document.getElementById('groupType').value+"&groupName="+document.getElementById('groupName').value+"&ccdId="+document.getElementById('ccdId').value+"&cmdClientId="+document.getElementById('cmdClientId').value+"&clientCptyName="+document.getElementById('clientCptyName').value+"&accountNo="+document.getElementById('accountNo').value+"&subAcc="+document.getElementById('subAcc').value+"&accName="+document.getElementById('accName').value+"&accBizUnit="+document.getElementById('accBizUnit').value+"&userId="+window.sessionStorage.getItem("userId");

			  var dataSource = new kendo.data.DataSource({
	    		transport: {
	    			read: function (options) {
				     	$.ajax(
				    		    { 
				    		      type: "GET",
				    		      url: getDetailURL,
				    		      dataType: 'json',
				    		      crossDomain: true,
				    		      xhrFields: {
				    		        withCredentials: true
				    		      },
				    		     
				    		      success: function(response){

				    		           	for (var i = 0; i < response.length; i++) {
				    		           		$('#list tr:last').before('<tr style=\"font-size:13px;\" id="tabRow'+i+'"> <td style="border-bottom: solid 1px black;">'+checkUndefinedElement(response[i].groupTypeDesc)+'&nbsp;&nbsp;</td> <td style="border-bottom: solid 1px black;">'+checkUndefinedElement(response[i].rmdGroupDesc)+'&nbsp;&nbsp;</td> <td style="border-bottom: solid 1px black;">'+checkUndefinedElement(response[i].externalKey1)+'&nbsp;&nbsp;</td> <td style="border-bottom: solid 1px black;">'+checkUndefinedElement(response[i].externalKey2)+'&nbsp;&nbsp;</td> <td style="border-bottom: solid 1px black;">'+checkUndefinedElement(response[i].externalKey3)+'&nbsp;&nbsp;</td> <td style="border-bottom: solid 1px black;">'+checkUndefinedElement(response[i].externalKey4)+'&nbsp;&nbsp;</td> <td style="border-bottom: solid 1px black;">'+checkUndefinedElement(response[i].externalKey5)+'&nbsp;&nbsp;</td> <td style="border-bottom: solid 1px black;">'+checkUndefinedElement(response[i].externalKey6)+'&nbsp;&nbsp;</td> <td style="border-bottom: solid 1px black;">'+checkUndefinedElement(response[i].externalKey7)+'&nbsp;&nbsp;</td> <td style="border-bottom: solid 1px black;">'+checkUndefinedElement(response[i].externalKey8)+'&nbsp;&nbsp;</td> <td style="border-bottom: solid 1px black;">'+checkUndefinedElement(response[i].externalKey9)+'&nbsp;&nbsp;</td> <td style="border-bottom: solid 1px black;">'+checkUndefinedElement(response[i].externalKey10)+'&nbsp;&nbsp;</td> <td style="border-bottom: solid 1px black;">'+checkUndefinedElement(response[i].lastUpdateDt)+'&nbsp;&nbsp;</td> <td style="border-bottom: solid 1px black;">'+checkUndefinedElement(response[i].lastUpdateBy)+'&nbsp;&nbsp;</td> <td colspan=\"2\" style="border-bottom: solid 1px black;">'+replacedByIconOfDetails(checkUndefinedElement(response[i].rmdGroupId), checkUndefinedElement(response[i].action), checkUndefinedElement(response[i].groupTypeDesc), checkUndefinedElement(response[i].rmdGroupDesc), checkUndefinedElement(response[i].externalKey1), checkUndefinedElement(response[i].externalKey2), checkUndefinedElement(response[i].externalKey3), checkUndefinedElement(response[i].externalKey4), checkUndefinedElement(response[i].externalKey5), checkUndefinedElement(window.sessionStorage.getItem("userId")))+'&nbsp;&nbsp;</td> </tr>');
				    		            };        
				    		            $("#countRow").text("No. of Record : " +response.length);	 
				    		      },
				    		      error: function (xhr) {
				    		             alert(xhr.responseText);
				    		      }	
				    		    }
				    		);
						}
					},
					schema: {                               // describe the result format
		                total: function(data) {              // the data which the data source will be bound to is in the values field
		                    return 10;
		                }
	            	},
	            	serverPaging: true,
	            	pageable: true,
	            	pageSize: 5,
	            	page: 1
				});
				
				$("#pager1").kendoPager({
				  	dataSource: dataSource,
				  	info: false,
				  	buttonCount: 5
				});

				dataSource.fetch();*/
			/*    }
			}
			xhttp.open("GET", getLogin, true);
			xhttp.send();*/

			     		/* Process Get Details */
			     		/*var xhttp2 = new XMLHttpRequest();
			     		var getDetailURL = "http://lxdapp25:8080/ERMSCore/groupDetail/getDetails?groupType="+document.getElementById('groupType').value+"&groupName="+document.getElementById('groupName').value+"&ccdId="+document.getElementById('ccdId').value+"&cmdClientId="+document.getElementById('cmdClientId').value+"&clientCptyName="+document.getElementById('clientCptyName').value+"&accountNo="+document.getElementById('accountNo').value+"&subAcc="+document.getElementById('subAcc').value+"&accName="+document.getElementById('accName').value+"&accBizUnit="+document.getElementById('accBizUnit').value+"&userId="+window.sessionStorage.getItem("userId")+"&username=riskadmin&password=risk1234&domain=HKDM";
				    			
			     		xhttp2.onreadystatechange = function() {
				    		if (xhttp2.readyState == 4 && xhttp2.status == 200) {
				    			var response = xhttp2.response;
				    			console.log(response);
				    		}
			    		}
			    		xhttp2.open("GET", getDetailURL, true);
						xhttp2.send();*/
			    		/* END PROCESS */


			//*  -------------------------------------- Get Details ----------------------------------------- */

	     	var getDetailURL = "http://lxdapp25:8080/ERMSCore/groupDetail/getDetails?groupType="+document.getElementById('groupType').value+"&groupName="+document.getElementById('groupName').value+"&ccdId="+document.getElementById('ccdId').value+"&cmdClientId="+document.getElementById('cmdClientId').value+"&clientCptyName="+document.getElementById('clientCptyName').value+"&accountNo="+document.getElementById('accountNo').value+"&subAcc="+document.getElementById('subAcc').value+"&accName="+document.getElementById('accName').value+"&accBizUnit="+document.getElementById('accBizUnit').value+"&userId="+window.sessionStorage.getItem("userId");

	     	var totalPages = 0, totalPages2 = 0;

	    	var dataSource = new kendo.data.DataSource({
	    		transport: {
	    			read: {
	    	   		  	type: "GET",
	    			    url: getDetailURL,
	    			    dataType: "json",
	    			    xhrFields: {
				    		withCredentials: true
				    	},
				    	beforeSend: function(req) {
	    	                openModal();
	    	            }
	    			}
	    		},	
				schema: {                               
	                total: function(argument) {              
	                    return totalPages;
	                }
            	},
            	/*change: function(e){
            		openModal();
            		for(var i = 0 ; i <  5 ; i++){
            			$("#tabRow"+i).remove();
            		}
            		var view = this.view();
            			for (var i = 0; i < view.length; i++) {
	    	       		$('#list tr:last').before('<tr style=\"font-size:13px;\" id="tabRow'+i+'"> <td style="border-bottom: solid 1px black;">'+checkUndefinedElement(view[i].groupTypeDesc)+'&nbsp;&nbsp;</td> <td style="border-bottom: solid 1px black;">'+checkUndefinedElement(view[i].rmdGroupDesc)+'&nbsp;&nbsp;</td> <td style="border-bottom: solid 1px black;">'+checkUndefinedElement(view[i].externalKey1)+'&nbsp;&nbsp;</td> <td style="border-bottom: solid 1px black;">'+checkUndefinedElement(view[i].externalKey2)+'&nbsp;&nbsp;</td> <td style="border-bottom: solid 1px black;">'+checkUndefinedElement(view[i].externalKey3)+'&nbsp;&nbsp;</td> <td style="border-bottom: solid 1px black;">'+checkUndefinedElement(view[i].externalKey4)+'&nbsp;&nbsp;</td> <td style="border-bottom: solid 1px black;">'+checkUndefinedElement(view[i].externalKey5)+'&nbsp;&nbsp;</td> <td style="border-bottom: solid 1px black;">'+checkUndefinedElement(view[i].externalKey6)+'&nbsp;&nbsp;</td> <td style="border-bottom: solid 1px black;">'+checkUndefinedElement(view[i].externalKey7)+'&nbsp;&nbsp;</td> <td style="border-bottom: solid 1px black;">'+checkUndefinedElement(view[i].externalKey8)+'&nbsp;&nbsp;</td> <td style="border-bottom: solid 1px black;">'+checkUndefinedElement(view[i].externalKey9)+'&nbsp;&nbsp;</td> <td style="border-bottom: solid 1px black;">'+checkUndefinedElement(view[i].externalKey10)+'&nbsp;&nbsp;</td> <td style="border-bottom: solid 1px black;">'+checkUndefinedElement(view[i].lastUpdateDt)+'&nbsp;&nbsp;</td> <td style="border-bottom: solid 1px black;">'+checkUndefinedElement(view[i].lastUpdateBy)+'&nbsp;&nbsp;</td> <td colspan=\"2\" style="border-bottom: solid 1px black;">'+replacedByIconOfDetails(checkUndefinedElement(view[i].rmdGroupId), checkUndefinedElement(view[i].action), checkUndefinedElement(view[i].groupTypeDesc), checkUndefinedElement(view[i].rmdGroupDesc), checkUndefinedElement(view[i].externalKey1), checkUndefinedElement(view[i].externalKey2), checkUndefinedElement(view[i].externalKey3), checkUndefinedElement(view[i].externalKey4), checkUndefinedElement(view[i].externalKey5), checkUndefinedElement(window.sessionStorage.getItem("userId")))+'&nbsp;&nbsp;</td> </tr>');

	    	       		totalPages = checkUndefinedElement(view[i].total);
	    	        };        
	    	        $("#countRow").text("No. of Record : " +totalPages);	
	    	        closeModal();

            	},*/
	    		requestEnd: function(e) {

	    			try{	

		    	        var response = e.response; 
		    	        for(var i = 0 ; i <  5 ; i++){
	            			$("#tabRow"+i).remove();
	            		}
	            		for (var i = 0; i < 222222222; i++) {
	    	            };
		    	       	for (var i = 0; i < response.length; i++) {
		    	       		$('#list tr:last').before('<tr style=\"font-size:13px;\" id="tabRow'+i+'"> <td style="border-bottom: solid 1px black;">'+checkUndefinedElement(response[i].groupTypeDesc)+'&nbsp;&nbsp;</td> <td style="border-bottom: solid 1px black;">'+checkUndefinedElement(response[i].rmdGroupDesc)+'&nbsp;&nbsp;</td> <td style="border-bottom: solid 1px black;">'+checkUndefinedElement(response[i].externalKey1)+'&nbsp;&nbsp;</td> <td style="border-bottom: solid 1px black;">'+checkUndefinedElement(response[i].externalKey2)+'&nbsp;&nbsp;</td> <td style="border-bottom: solid 1px black;">'+checkUndefinedElement(response[i].externalKey3)+'&nbsp;&nbsp;</td> <td style="border-bottom: solid 1px black;">'+checkUndefinedElement(response[i].externalKey4)+'&nbsp;&nbsp;</td> <td style="border-bottom: solid 1px black;">'+checkUndefinedElement(response[i].externalKey5)+'&nbsp;&nbsp;</td> <td style="border-bottom: solid 1px black;">'+checkUndefinedElement(response[i].externalKey6)+'&nbsp;&nbsp;</td> <td style="border-bottom: solid 1px black;">'+checkUndefinedElement(response[i].externalKey7)+'&nbsp;&nbsp;</td> <td style="border-bottom: solid 1px black;">'+checkUndefinedElement(response[i].externalKey8)+'&nbsp;&nbsp;</td> <td style="border-bottom: solid 1px black;">'+checkUndefinedElement(response[i].externalKey9)+'&nbsp;&nbsp;</td> <td style="border-bottom: solid 1px black;">'+checkUndefinedElement(response[i].externalKey10)+'&nbsp;&nbsp;</td> <td style="border-bottom: solid 1px black;">'+checkUndefinedElement(response[i].lastUpdateDt)+'&nbsp;&nbsp;</td> <td style="border-bottom: solid 1px black;">'+checkUndefinedElement(response[i].lastUpdateBy)+'&nbsp;&nbsp;</td> <td colspan=\"2\" style="border-bottom: solid 1px black;">'+replacedByIconOfDetails(checkUndefinedElement(response[i].rmdGroupId), checkUndefinedElement(response[i].action), checkUndefinedElement(response[i].groupTypeDesc), checkUndefinedElement(response[i].rmdGroupDesc), checkUndefinedElement(response[i].externalKey1), checkUndefinedElement(response[i].externalKey2), checkUndefinedElement(response[i].externalKey3), checkUndefinedElement(response[i].externalKey4), checkUndefinedElement(response[i].externalKey5), checkUndefinedElement(window.sessionStorage.getItem("userId")))+'&nbsp;&nbsp;</td> </tr>');

		    	       		totalPages = checkUndefinedElement(response[i].total);
		    	        };        
		    	        $("#countRow").text("No. of Record : " +totalPages);	 

		    	        closeModal();

		    	    }catch(error){
		    	    	alert(error);
		    	    }		    	    
	    	    },
	    		serverPaging: true,
	    		pageable: true,
	    		pageSize: 5
	    	});   
	    	
	    	$("#pager1").kendoPager({
	    	  dataSource: dataSource,
	    	  info: false,
	    	  buttonCount: 2
	    	});
	
	    	dataSource.read();       	                 	
	

	    	//*  -------------------------------------- Get Change Request ----------------------------------------- */
	    	var getCR = "http://lxdapp25:8080/ERMSCore/groupDetail/getDetailsChangeRequest?groupType="+document.getElementById('groupType').value+"&groupName="+document.getElementById('groupName').value+"&ccdId="+document.getElementById('ccdId').value+"&cmdClientId="+document.getElementById('cmdClientId').value+"&clientCptyName="+document.getElementById('clientCptyName').value+"&accountNo="+document.getElementById('accountNo').value+"&subAcc="+document.getElementById('subAcc').value+"&accName="+document.getElementById('accName').value+"&accBizUnit="+document.getElementById('accBizUnit').value+"&userId="+window.sessionStorage.getItem("userId");

	    	var dataSource2 = new kendo.data.DataSource({
	    		transport: {
	    			read: {
	    	   		  	type: "GET",
	    			    url: getCR,
	    			    dataType: "json",
	    			    xhrFields: {
				    		withCredentials: true
				    	},
				    	beforeSend: function(req) {
	    	                openModal();
	    	                
	    	            }
	    			}
	    		},
	    		requestEnd: function(e) {

	    			try{
	    				for (var i = 0; i < 222222222; i++) {
	    	                };
		    	        var response = e.response; 
			    	    for(var i = 0 ; i <  5 ; i++){
		            			$("#tabRowZ"+i).remove();
		            	}
		    	       	for (var i = 0; i < response.length; i++) {
		    	       		$('#list2 tr:last').before('<tr style=\"font-size:13px;\" id="tabRowZ'+i+'"> <td style="border-bottom: solid 1px black;">'+checkUndefinedElement(response[i].groupTypeDesc)+'&nbsp;&nbsp;</td> <td style="border-bottom: solid 1px black;">'+checkUndefinedElement(response[i].rmdGroupDesc)+'&nbsp;&nbsp;</td> <td style="border-bottom: solid 1px black;">'+checkUndefinedElement(response[i].externalKey1)+'&nbsp;&nbsp;</td> <td style="border-bottom: solid 1px black;">'+checkUndefinedElement(response[i].externalKey2)+'&nbsp;&nbsp;</td> <td style="border-bottom: solid 1px black;">'+checkUndefinedElement(response[i].externalKey3)+'&nbsp;&nbsp;</td> <td style="border-bottom: solid 1px black;">'+checkUndefinedElement(response[i].externalKey4)+'&nbsp;&nbsp;</td> <td style="border-bottom: solid 1px black;">'+checkUndefinedElement(response[i].externalKey5)+'&nbsp;&nbsp;</td> <td style="border-bottom: solid 1px black;">'+checkUndefinedElement(response[i].externalKey6)+'&nbsp;&nbsp;</td> <td style="border-bottom: solid 1px black;">'+checkUndefinedElement(response[i].externalKey7)+'&nbsp;&nbsp;</td> <td style="border-bottom: solid 1px black;">'+checkUndefinedElement(response[i].externalKey8)+'&nbsp;&nbsp;</td> <td style="border-bottom: solid 1px black;">'+checkUndefinedElement(response[i].externalKey9)+'&nbsp;&nbsp;</td> <td style="border-bottom: solid 1px black;">'+checkUndefinedElement(response[i].externalKey10)+'&nbsp;&nbsp;</td> <td style="border-bottom: solid 1px black;">'+checkUndefinedElement(response[i].crDt)+'&nbsp;&nbsp;</td> <td style="border-bottom: solid 1px black;">'+checkUndefinedElement(response[i].crBy)+'&nbsp;&nbsp;</td> <td style="border-bottom: solid 1px black;">'+checkUndefinedElement(response[i].status)+'&nbsp;&nbsp;</td> <td colspan=\"2\" style="border-bottom: solid 1px black;">'+replacedByIconOfCR(checkUndefinedElement(response[i].crId), checkUndefinedElement(response[i].action), checkUndefinedElement(response[i].groupTypeDesc), checkUndefinedElement(response[i].groupTypeDesc), checkUndefinedElement(response[i].externalKey1), checkUndefinedElement(response[i].externalKey2), checkUndefinedElement(response[i].externalKey3), checkUndefinedElement(response[i].externalKey4), checkUndefinedElement(response[i].externalKey5), checkUndefinedElement(window.sessionStorage.getItem("userId")))+'&nbsp;&nbsp;</td> </tr>');

		    	       		totalPages2 = checkUndefinedElement(response[i].total);
		    	        };        
		    	        closeModal();
		    	        $("#countRow2").text("No. of Record : " +totalPages2);

		    	    }catch(error){
		    	    	alert(error);
		    	    }

	    	    },
	    	    schema: {                               
	                total: function(argument) {              
	                    return totalPages2;
	                }
            	},
	    		serverPaging: true,
	    		pageable: true,
	    		pageSize: 5
	    	});   
	    	
	    	$("#pager2").kendoPager({
	    	  dataSource: dataSource2,
	    	  info: false,
	    	  buttonCount: 2
	    	});
	
	    	dataSource2.read();   

			/*var dataSource2 = new kendo.data.DataSource({
	    		transport: {
	    			read: function (options) {
				     	$.ajax(
				    		    { 
				    		      type: "GET",
				    		      url: getCR,
				    		      dataType: 'json',
				    		      
				    		      data:{
	                                  skip: options.data.skip,
	                                  take: options.data.take,
	                                  pageSize: options.data.pageSize,
	                                  page: options.data.page,
	                                  sorting: JSON.stringify(options.data.sort),
	                                  filter: JSON.stringify(options.data.filter)
	                              },
				    		      xhrFields: {
				    		        withCredentials: true
				    		      },
				    		      success: function(response){
				    		      		
			    		           		for (var i = 0; i < response.length; i++) {
			    		           			$('#list2 tr:last').before('<tr style=\"font-size:13px;\" id="tabRow'+i+'"> <td style="border-bottom: solid 1px black;">'+checkUndefinedElement(response[i].groupTypeDesc)+'&nbsp;&nbsp;</td> <td style="border-bottom: solid 1px black;">'+checkUndefinedElement(response[i].rmdGroupDesc)+'&nbsp;&nbsp;</td> <td style="border-bottom: solid 1px black;">'+checkUndefinedElement(response[i].externalKey1)+'&nbsp;&nbsp;</td> <td style="border-bottom: solid 1px black;">'+checkUndefinedElement(response[i].externalKey2)+'&nbsp;&nbsp;</td> <td style="border-bottom: solid 1px black;">'+checkUndefinedElement(response[i].externalKey3)+'&nbsp;&nbsp;</td> <td style="border-bottom: solid 1px black;">'+checkUndefinedElement(response[i].externalKey4)+'&nbsp;&nbsp;</td> <td style="border-bottom: solid 1px black;">'+checkUndefinedElement(response[i].externalKey5)+'&nbsp;&nbsp;</td> <td style="border-bottom: solid 1px black;">'+checkUndefinedElement(response[i].externalKey6)+'&nbsp;&nbsp;</td> <td style="border-bottom: solid 1px black;">'+checkUndefinedElement(response[i].externalKey7)+'&nbsp;&nbsp;</td> <td style="border-bottom: solid 1px black;">'+checkUndefinedElement(response[i].externalKey8)+'&nbsp;&nbsp;</td> <td style="border-bottom: solid 1px black;">'+checkUndefinedElement(response[i].externalKey9)+'&nbsp;&nbsp;</td> <td style="border-bottom: solid 1px black;">'+checkUndefinedElement(response[i].externalKey10)+'&nbsp;&nbsp;</td> <td style="border-bottom: solid 1px black;">'+checkUndefinedElement(response[i].crDt)+'&nbsp;&nbsp;</td> <td style="border-bottom: solid 1px black;">'+checkUndefinedElement(response[i].crBy)+'&nbsp;&nbsp;</td> <td style="border-bottom: solid 1px black;">'+checkUndefinedElement(response[i].status)+'&nbsp;&nbsp;</td> <td colspan=\"2\" style="border-bottom: solid 1px black;">'+replacedByIconOfCR(checkUndefinedElement(response[i].crId), checkUndefinedElement(response[i].action), checkUndefinedElement(response[i].groupTypeDesc), checkUndefinedElement(response[i].groupTypeDesc), checkUndefinedElement(response[i].externalKey1), checkUndefinedElement(response[i].externalKey2), checkUndefinedElement(response[i].externalKey3), checkUndefinedElement(response[i].externalKey4), checkUndefinedElement(response[i].externalKey5), checkUndefinedElement(window.sessionStorage.getItem("userId")))+'&nbsp;&nbsp;</td> </tr>');
			    		           				totalPages = checkUndefinedElement(response[i].total);
				    		           	 };     

				    		           	 $("#countRow2").text("No. of Record : " +totalPages);	 
				    		           	 options.success(response);
				    		           	 
				    		      },
				    		      error: function (xhr) {
				    		             alert(xhr.responseText);
				    		      }	
				    		    }
				    		);
						}
					},
					schema: {                               
		                total: function(argument) {              
		                    return totalPages;
		                }
	            	},
	            	serverPaging: true,
	            	pageable: true,
	            	pageSize: 2
				});
				dataSource2.totalPages(20);
				$("#pager2").kendoPager({
				  	dataSource: dataSource2,
				  	info: false
				});
	    	 
	    	 	dataSource2.read();*/

	    	 window.sessionStorage.setItem('groupName',document.getElementById("groupName").value)
	    	 window.sessionStorage.setItem('groupType',document.getElementById("groupType").value)
	    	 window.sessionStorage.setItem('ccdId',document.getElementById("ccdId").value)
	    	 window.sessionStorage.setItem('cmdClientId',document.getElementById("cmdClientId").value)
	    	 window.sessionStorage.setItem('clientCptyName',document.getElementById("clientCptyName").value)
	    	 window.sessionStorage.setItem('accountNo',document.getElementById("accountNo").value)
	    	 window.sessionStorage.setItem('subAcc',document.getElementById("subAcc").value)
	    	 window.sessionStorage.setItem('accName',document.getElementById("accName").value)
	    	 window.sessionStorage.setItem('accBizUnit',document.getElementById("accBizUnit").value)
		}
	
	    </script>
	
		<body>
			<!-- <script type="text/javascript" src="/ermsweb/resources/js/header.js"></script> -->
			<%-- <%@include file="header.jsp"%> --%>
			<div id="returnMessage"></div>
			<div style="background-color:pink; width:1060">Group Detail Maintenance</div>
			<br>
			<table id="listTable" width="1060" style="background-color:#DBE5F1; overflow-x:scroll; border-bottom" cellpadding="0" cellspacing="0">
				<tr>
					<td colspan="6" style="background-color:#8DB4E3; width:1060">
					<b><div id="filterTable" onclick="expandCriteria()">(+) Filter Criteria</div></b></td>
				</tr>
				<tr>
					<td><br></td>
				</tr>
				<tbody id="filterBody" style="display: block">
					<tr>
						<td>Group Name.</td>
						<td><input id="groupName" name="groupName" type="text"/></td>
						<td>Group Type.</td>
						<td><input id="groupType" name="groupType" type="text"/></td>
						<td>CCD ID.</td>
						<td><input id="ccdId" name="ccdId" type="text"/></td>
						<td></td>
					</tr>
					<tr><td><br></td></tr>
					<tr>
						<td>CMD Client ID.</td>
						<td><input id="cmdClientId" name="cmdClientId" type="text"/></td>
						<td>Client/Counterparty Name.</td>
						<td><input id="clientCptyName" name="clientCptyName" type="text"/></td>
						<td>Account No.</td>
						<td><input id="accountNo" name="accountNo" type="text"/></td>
						<td></td>
					</tr>
					<tr><td><br></td></tr>
					<tr>
						<td>Sub - Acc.</td>
						<td><input id="subAcc" name="subAcc" type="text"/></td>
						<td>Account Name.</td>
						<td><input id="accName" name="accName" type="text"/></td>
						<td>Acc - Biz Unit.</td>
						<td><input id="accBizUnit" name="accBizUnit" type="text"/></td>
						<td></td>
					</tr>
					<tr><td><br></td></tr>
					<tr><td><br></td></tr>
					<tr>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td>
							<button id="submitBtn"  style="background:blue; color:white" type="button">Submit</button>
							<button id="resetBtn" type="button">Reset</button>
							<button id="exportBtn" type="button">Export</button>
						</td>
					</tr>
				</tbody>
			</table>
			<br>
			<div style="overflow-x: scroll; width:1060px; display: none" id="tableScope1">
					<table id="list" width="1060" cellpadding="0" cellspacing="0">
						<tr style="background-color:#5A2727; color:white">
							<td colspan="16">
								Result
							</td>
						</tr>
						<tr style="background-color:#B54D4D; font-size:13px; color:white;">
							<td width="40">&nbsp;Group_Type&nbsp;</td>
							<td width="40">&nbsp;Group_Name&nbsp;</td>
							<td width="40">&nbsp;External_Key_ID_1&nbsp;</td>	
							<td width="40">&nbsp;External_Key_ID_2&nbsp;</td>	
							<td width="40">&nbsp;External_Key_ID_3&nbsp;</td>
							<td width="40">&nbsp;External_Key_ID_4&nbsp;</td>
							<td width="40">&nbsp;External_Key_ID_5&nbsp;</td>
							<td width="40">&nbsp;External_Key_ID_6&nbsp;</td>
							<td width="40">&nbsp;External_Key_ID_7&nbsp;</td>
							<td width="40">&nbsp;External_Key_ID_8&nbsp;</td>
							<td width="40">&nbsp;External_Key_ID_9&nbsp;</td>
							<td width="40">&nbsp;External_Key_ID_10&nbsp;</td>
							<td width="40">&nbsp;last_update&nbsp;</td>
							<td width="40">&nbsp;Updated_by&nbsp;</td>
							<td width="40">&nbsp;action&nbsp;</td>
							<td width="40">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
						</tr>
						<tr>
							<td colspan="8">
								<div id="modal" align="center" style="display:none;">
						            <img id="loader" src="/ermsweb/resources/images/ajax-loader.gif" />
						        </div>
							</td>
						</tr>				
					</table>
					<br>
				</div>
				
				<div style="font-size: 13px" id="countRow"></div>
				<div id="pager1"></div>
				<br>
				<div style="overflow-x: scroll; width:1060px; display: none" id="tableScope2">
						<table id="list2" width="1060" cellpadding="0" cellspacing="0">
							<tr style="background-color:#5A2727; color:white">
								<td colspan="17">
									Result
								</td>
							</tr>
							<tr style="background-color:#B54D4D; font-size:13px; color:white;">
								<td width="40">&nbsp;Group_Type&nbsp;</td>
								<td width="40">&nbsp;Group_Name&nbsp;</td>
								<td width="40">&nbsp;External_Key_ID_1&nbsp;</td>	
								<td width="40">&nbsp;External_Key_ID_2&nbsp;</td>	
								<td width="40">&nbsp;External_Key_ID_3&nbsp;</td>
								<td width="40">&nbsp;External_Key_ID_4&nbsp;</td>
								<td width="40">&nbsp;External_Key_ID_5&nbsp;</td>
								<td width="40">&nbsp;External_Key_ID_6&nbsp;</td>
								<td width="40">&nbsp;External_Key_ID_7&nbsp;</td>
								<td width="40">&nbsp;External_Key_ID_8&nbsp;</td>
								<td width="40">&nbsp;External_Key_ID_9&nbsp;</td>
								<td width="40">&nbsp;External_Key_ID_10&nbsp;</td>
								<td width="40">&nbsp;last_update&nbsp;</td>
								<td width="40">&nbsp;Updated_by&nbsp;</td>
								<td width="40">&nbsp;status&nbsp;</td>
								<td width="40">&nbsp;action&nbsp;</td>
								<td width="40">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
							</tr>
							<tr>
								<td colspan="8">
									<div id="modal2" align="center" style="display:none;">
							            <img id="loader" src="/ermsweb/resources/images/ajax-loader.gif" />
							        </div>
								</td>
							</tr>				
						</table>
					<br>
				</div>
				
				<div style="font-size: 13px" id="countRow2"></div>
				<div id="pager2"></div>
				<br/></br>
		</body>
	</html>	