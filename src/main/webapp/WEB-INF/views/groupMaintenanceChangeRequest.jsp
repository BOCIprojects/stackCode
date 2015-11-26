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
				
				var xhttp = new XMLHttpRequest();
				var url = "http://lxdapp25:8080/ERMSCore/groupDetail/getRecord?crId="+getURLParameters("crId")+"&userId="+getURLParameters("userId");
				
				/* For Testing -> Get parameters from list page (could be implemented by Kendo)  */
				/*xhttp.onreadystatechange=function(e) {    
					if (xhttp.readyState == 4 && xhttp.status == 200) {
				     	
				    	var obj = JSON.parse(xhttp.response);
				     	
				    	if(new RegExp("action\=view").test($(location).attr('href'))){
				     		
				     		document.getElementById("groupType").innerHTML = checkUndefinedElement(obj.groupTypeDesc);		     	
				     		document.getElementById("groupName").innerHTML = checkUndefinedElement(obj.rmdGroupDesc);
				     		document.getElementById("extKey1").innerHTML = checkUndefinedElement(obj.externalKey1);
				     		document.getElementById("extKey2").innerHTML = checkUndefinedElement(obj.externalKey2);
				     		document.getElementById("extKey3").innerHTML = checkUndefinedElement(obj.externalKey3);
				     		document.getElementById("extKey4").innerHTML = checkUndefinedElement(obj.externalKey4);
				     		document.getElementById("extKey5").innerHTML = checkUndefinedElement(obj.externalKey5);
				     		document.getElementById("remarkArea").value = checkUndefinedElement(obj.crRemark);

				     	}else{

				     		if(new RegExp("action\=update").test($(location).attr('href'))){
					     		document.getElementById("groupType").innerHTML = checkUndefinedElement(obj.groupTypeDesc);		     	
					     		document.getElementById("groupName").innerHTML = checkUndefinedElement(obj.rmdGroupDesc);
					     		document.getElementById("extKey1").value = checkUndefinedElement(obj.externalKey1);
					     		document.getElementById("extKey2").value = checkUndefinedElement(obj.externalKey2);
					     		document.getElementById("extKey3").value = checkUndefinedElement(obj.externalKey3);
					     		document.getElementById("extKey4").value = checkUndefinedElement(obj.externalKey4);
					     		document.getElementById("extKey5").value = checkUndefinedElement(obj.externalKey5);
					     		document.getElementById("remarkArea").innerHTML = checkUndefinedElement(obj.crRemark);
					     	}
				     	}
				    	
				    	if(new RegExp("action\=verify").test($(location).attr('href'))){
				    		
				    		document.getElementById("groupType").innerHTML = checkUndefinedElement(obj.groupTypeDesc);
				     		document.getElementById("groupName").innerHTML = checkUndefinedElement(obj.rmdGroupDesc);

			     			comparingWithBefore(document.getElementById("extKey1"), document.getElementById("bfExtKey1"), checkUndefinedElement(obj.bfExternalKey1), checkUndefinedElement(obj.externalKey1));
			     			comparingWithBefore(document.getElementById("extKey2"), document.getElementById("bfExtKey2"), checkUndefinedElement(obj.bfExternalKey2), checkUndefinedElement(obj.externalKey2));
			     			comparingWithBefore(document.getElementById("extKey3"), document.getElementById("bfExtKey3"), checkUndefinedElement(obj.bfExternalKey3), checkUndefinedElement(obj.externalKey3));
			     			comparingWithBefore(document.getElementById("extKey4"), document.getElementById("bfExtKey4"), checkUndefinedElement(obj.bfExternalKey4), checkUndefinedElement(obj.externalKey4));
			     			comparingWithBefore(document.getElementById("extKey5"), document.getElementById("bfExtKey5"), checkUndefinedElement(obj.bfExternalKey5), checkUndefinedElement(obj.externalKey5));
				     	
				     		document.getElementById("remarkArea").value = checkUndefinedElement(obj.crRemark);
				     	}
				     	if(new RegExp("action\=discard").test($(location).attr('href'))){
				    		
				    		document.getElementById("groupType").innerHTML = checkUndefinedElement(obj.groupTypeDesc);
				     		document.getElementById("groupName").innerHTML = checkUndefinedElement(obj.rmdGroupDesc);

			     			document.getElementById("groupType").innerHTML = checkUndefinedElement(obj.groupTypeDesc);		     	
				     		document.getElementById("groupName").innerHTML = checkUndefinedElement(obj.rmdGroupDesc);
				     		document.getElementById("extKey1").innerHTML = checkUndefinedElement(obj.externalKey1);
				     		document.getElementById("extKey2").innerHTML = checkUndefinedElement(obj.externalKey2);
				     		document.getElementById("extKey3").innerHTML = checkUndefinedElement(obj.externalKey3);
				     		document.getElementById("extKey4").innerHTML = checkUndefinedElement(obj.externalKey4);
				     		document.getElementById("extKey5").innerHTML = checkUndefinedElement(obj.externalKey5);
				     	
				     		document.getElementById("remarkArea").value = checkUndefinedElement(obj.crRemark);
				     	}
				    	
				     	document.getElementById("createdBy").innerHTML = checkUndefinedElement(obj.createBy);
				     	document.getElementById("createdAt").innerHTML = checkUndefinedElement(obj.createDt);
				     	document.getElementById("updateBy").innerHTML = checkUndefinedElement(obj.lastUpdateBy);
				     	document.getElementById("updateAt").innerHTML = checkUndefinedElement(obj.lastUpdateDt);
				     	document.getElementById("verifiedBy").innerHTML = checkUndefinedElement(obj.verifyBy);
				     	document.getElementById("verifiedAt").innerHTML = checkUndefinedElement(obj.verifyDt);
				     	document.getElementById("status").innerHTML = checkUndefinedElement(obj.crStatus);
				    }
				}*/
				/* End Testing */
				
				/*xhttp.open("GET", url, true);
				xhttp.send();
*/
				/* ============================================================================================================= */
				var dataSource = new kendo.data.DataSource({
			    		transport: {
			    			read: {
			    	   		  	type: "GET",
			    			    url: url,
			    			    dataType: "json",
			    			    xhrFields: {
						    		withCredentials: true
						    	}
			    			}
			    		},
			    		requestEnd: function(e) {
			    	        var response = e.response; 
			    	       	if(new RegExp("action\=view").test($(location).attr('href'))){
				     		
					     		document.getElementById("groupType").innerHTML = checkUndefinedElement(response[0].groupTypeDesc);		     	
					     		document.getElementById("groupName").innerHTML = checkUndefinedElement(response[0].rmdGroupDesc);
					     		document.getElementById("extKey1").innerHTML = checkUndefinedElement(response[0].externalKey1);
					     		document.getElementById("extKey2").innerHTML = checkUndefinedElement(response[0].externalKey2);
					     		document.getElementById("extKey3").innerHTML = checkUndefinedElement(response[0].externalKey3);
					     		document.getElementById("extKey4").innerHTML = checkUndefinedElement(response[0].externalKey4);
					     		document.getElementById("extKey5").innerHTML = checkUndefinedElement(response[0].externalKey5);
					     		document.getElementById("remarkArea").value = checkUndefinedElement(response[0].crRemark);

					     	}else{

					     		if(new RegExp("action\=update").test($(location).attr('href'))){
						     		document.getElementById("groupType").innerHTML = checkUndefinedElement(response[0].groupTypeDesc);		     	
						     		document.getElementById("groupName").innerHTML = checkUndefinedElement(response[0].rmdGroupDesc);
						     		document.getElementById("extKey1").value = checkUndefinedElement(response[0].externalKey1);
						     		document.getElementById("extKey2").value = checkUndefinedElement(response[0].externalKey2);
						     		document.getElementById("extKey3").value = checkUndefinedElement(response[0].externalKey3);
						     		document.getElementById("extKey4").value = checkUndefinedElement(response[0].externalKey4);
						     		document.getElementById("extKey5").value = checkUndefinedElement(response[0].externalKey5);
						     		document.getElementById("remarkArea").innerHTML = checkUndefinedElement(response[0].crRemark);
						     	}
					     	}
					    	
					    	if(new RegExp("action\=verify").test($(location).attr('href'))){
					    		
					    		document.getElementById("groupType").innerHTML = checkUndefinedElement(response[0].groupTypeDesc);
					     		document.getElementById("groupName").innerHTML = checkUndefinedElement(response[0].rmdGroupDesc);

				     			comparingWithBefore(document.getElementById("extKey1"), document.getElementById("bfExtKey1"), checkUndefinedElement(response[0].bfExternalKey1), checkUndefinedElement(response[0].externalKey1));
				     			comparingWithBefore(document.getElementById("extKey2"), document.getElementById("bfExtKey2"), checkUndefinedElement(response[0].bfExternalKey2), checkUndefinedElement(response[0].externalKey2));
				     			comparingWithBefore(document.getElementById("extKey3"), document.getElementById("bfExtKey3"), checkUndefinedElement(response[0].bfExternalKey3), checkUndefinedElement(response[0].externalKey3));
				     			comparingWithBefore(document.getElementById("extKey4"), document.getElementById("bfExtKey4"), checkUndefinedElement(response[0].bfExternalKey4), checkUndefinedElement(response[0].externalKey4));
				     			comparingWithBefore(document.getElementById("extKey5"), document.getElementById("bfExtKey5"), checkUndefinedElement(response[0].bfExternalKey5), checkUndefinedElement(response[0].externalKey5));
					     	
					     		document.getElementById("remarkArea").value = checkUndefinedElement(response[0].crRemark);
					     		
					     	}
					     	if(new RegExp("action\=discard").test($(location).attr('href'))){
					    		
					    		document.getElementById("groupType").innerHTML = checkUndefinedElement(response[0].groupTypeDesc);
					     		document.getElementById("groupName").innerHTML = checkUndefinedElement(response[0].rmdGroupDesc);

				     			document.getElementById("groupType").innerHTML = checkUndefinedElement(response[0].groupTypeDesc);		     	
					     		document.getElementById("groupName").innerHTML = checkUndefinedElement(response[0].rmdGroupDesc);
					     		document.getElementById("extKey1").innerHTML = checkUndefinedElement(response[0].externalKey1);
					     		document.getElementById("extKey2").innerHTML = checkUndefinedElement(response[0].externalKey2);
					     		document.getElementById("extKey3").innerHTML = checkUndefinedElement(response[0].externalKey3);
					     		document.getElementById("extKey4").innerHTML = checkUndefinedElement(response[0].externalKey4);
					     		document.getElementById("extKey5").innerHTML = checkUndefinedElement(response[0].externalKey5);
					     	
					     		document.getElementById("remarkArea").value = checkUndefinedElement(response[0].crRemark);
					     	}
					    	
					     	document.getElementById("createdBy").innerHTML = checkUndefinedElement(response[0].createBy);
					     	document.getElementById("createdAt").innerHTML = checkUndefinedElement(response[0].createDt);
					     	document.getElementById("updateBy").innerHTML = checkUndefinedElement(response[0].crBy);
					     	document.getElementById("updateAt").innerHTML = checkUndefinedElement(response[0].crDt);
					     	document.getElementById("verifiedBy").innerHTML = checkUndefinedElement(response[0].verifyBy);
					     	document.getElementById("verifiedAt").innerHTML = checkUndefinedElement(response[0].verifyDt);
					     	document.getElementById("status").innerHTML = checkUndefinedElement(response[0].status);
					    }   
			    	
		    	});   
		
			    dataSource.read(); 
				/* ============================================================================================================= */

				/* Get the action type - view for directing to the view mode on this page */
				/* Replacing the button, label from update to view */
				/* Checker action -> */
	 					
	 					if(new RegExp("action\=view").test($(location).attr('href'))){
	 						$("#pageTitle").html("Maintenance - Group Detail Maintenance - View Group Detail");
	 						$("#group_type_label").html("<label id=\"groupType\"></label>");
	 						$("#group_name_label").html("<label id=\"groupName\"></label>");
	 						$("#checkEXTKey1").html("<label id=\"extKey1\"></label>");
	 						$("#checkEXTKey2").html("<label id=\"extKey2\"></label>");
	 						$("#checkEXTKey3").html("<label id=\"extKey3\"></label>");
	 						$("#checkEXTKey4").html("<label id=\"extKey4\"></label>");
	 						$("#checkEXTKey5").html("<label id=\"extKey5\"></label>");
	 						$("#remarks").html("<textarea id=\"remarkArea\" style=\"background-color: #FFD7B5; color: black\" disabled rows=\"4\" cols=\"28\"></textarea>");
	 						
	 						if(new RegExp("update").test($(location).attr('href'))){
	 							$("#buttonType").html("<button id=\"updateBtn\" style=\"background:blue; color:white\" type=\"button\" data-role=\"button\" class=\"k-button\" role=\"button\" aria-disabled=\"false\" tabindex=\"0\" onclick=\"toUpdate()\">Update</button><label>    </label><button id=\"discardBtn\" style=\"background:blue; color:white\" type=\"button\" data-role=\"button\" class=\"k-button\" role=\"button\" aria-disabled=\"false\" tabindex=\"0\" onclick=\"toDiscard()\">Discard</button><label>    </label><button id=\"backBtn\" onclick=\"toBack()\" type=\"button\" data-role=\"button\" class=\"k-button\" role=\"button\" aria-disabled=\"false\" tabindex=\"0\">Back</button>");
	 						}else{
	 							$("#buttonType").html("<button id=\"backBtn\" onclick=\"toBack()\" type=\"button\" data-role=\"button\" class=\"k-button\" role=\"button\" aria-disabled=\"false\" tabindex=\"0\">Back</button>");
	 						}
	 					}else{

	 						/* Get the action type - update for directing to the update mode on this page. */
	 						/* Replacing the button, label from view to update */
	 						
	 						if(new RegExp("action\=update").test($(location).attr('href'))){
	 							$("#pageTitle").html("Maintenance - Group Detail Maintenance - Update Group Detail");
	 							$("#group_type_label").html("<label id=\"groupType\"></label>");
	 							$("#group_name_label").html("<label id=\"groupName\"></label>");
	 							$("#checkEXTKey2").html("<input id=\"extKey1\" type=\"text\" value=\"\"/>");
	 							$("#checkEXTKey1").html("<input id=\"extKey2\" type=\"text\" value=\"\"/>");
	 							$("#checkEXTKey3").html("<input id=\"extKey3\" type=\"text\" value=\"\"/>");
	 							$("#checkEXTKey4").html("<input id=\"extKey4\" type=\"text\" value=\"\"/>");
	 							$("#checkEXTKey5").html("<input id=\"extKey5\" type=\"text\" value=\"\"/>");
	 							$("#remarks").html("<textarea id=\"remarkArea\" style=\"background-color: #FFD7B5; color: black\" disabled rows=\"4\" cols=\"28\"></textarea>");
	 							$("#buttonType").html("<button id=\"submitBtn\" style=\"background:blue; color:white\" type=\"button\" data-role=\"button\" class=\"k-button\" role=\"button\" aria-disabled=\"false\" tabindex=\"0\" onclick=\"toSubmit()\">Update</button><label>     </label><button id=\"saveBtn\" style=\"background:blue; color:white\" type=\"button\" data-role=\"button\" class=\"k-button\" role=\"button\" aria-disabled=\"false\" tabindex=\"0\" onclick=\"toSave()\">Save</button><label>     </label><button id=\"discardBtn\" style=\"background:blue; color:white\" type=\"button\" data-role=\"button\" class=\"k-button\" role=\"button\" aria-disabled=\"false\" tabindex=\"0\" onclick=\"toDiscard()\">Discard</button><label>     </label><button id=\"saveBtn\" style=\"background:blue; color:white\" type=\"button\" data-role=\"button\" class=\"k-button\" role=\"button\" aria-disabled=\"false\" tabindex=\"0\" onclick=\"#\">Clear</button><label>     </label><button id=\"backBtn\" onclick=\"toBack()\" type=\"button\" data-role=\"button\" class=\"k-button\" role=\"button\" aria-disabled=\"false\" tabindex=\"0\">Back</button>");
	 							
	 						}else{
	 							
	 							if(new RegExp("action\=verify").test($(location).attr('href'))){
	 								$("#pageTitle").html("Maintenance - Group Detail Maintenance - Verify Group Detail");
	 								$("#group_type_label").html("<label id=\"groupType\"></label>");
	 		 						$("#group_name_label").html("<label id=\"groupName\"></label>");
	 		 						$("#checkEXTKey1").html("<label id=\"extKey1\"></label>");
	 		 						$("#checkEXTKey2").html("<label id=\"extKey2\"></label>");
	 		 						$("#checkEXTKey3").html("<label id=\"extKey3\"></label>");
	 		 						$("#checkEXTKey4").html("<label id=\"extKey4\"></label>");
	 		 						$("#checkEXTKey5").html("<label id=\"extKey5\"></label>");


	 		 						$("#bfCheckEXTKey1").html("<label id=\"bfExtKey1\"></label>");
	 		 						$("#bfCheckEXTKey2").html("<label id=\"bfExtKey2\"></label>");
	 		 						$("#bfCheckEXTKey3").html("<label id=\"bfExtKey3\"></label>");
	 		 						$("#bfCheckEXTKey4").html("<label id=\"bfExtKey4\"></label>");
	 		 						$("#bfCheckEXTKey5").html("<label id=\"bfExtKey5\"></label>");

			 						$("#remarks").html("<textarea id=\"remarkArea\" rows=\"4\" cols=\"28\"></textarea>");

			 						$("#buttonType").html("<button id=\"verifyBtn\" style=\"background:blue; color:white\" type=\"button\" data-role=\"button\" class=\"k-button\" role=\"button\" aria-disabled=\"false\" tabindex=\"0\" onclick=\"toVerify()\">Verify</button><label>    </label><button id=\"backBtn\" onclick=\"toBack()\" type=\"button\" data-role=\"button\" class=\"k-button\" role=\"button\" aria-disabled=\"false\" tabindex=\"0\">Back</button><label>    </label><button id=\"returnBtn\" onclick=\"toReturned()\" type=\"button\" data-role=\"button\" class=\"k-button\" role=\"button\" aria-disabled=\"false\" tabindex=\"0\" style=\"background:blue; color: white\">Return</button>");
								
	 							}else{
	 								
	 								if(new RegExp("action\=discard").test($(location).attr('href'))){
	 									$("#pageTitle").html("Maintenance - Group Detail Maintenance - View Group Detail");
				 						$("#group_type_label").html("<label id=\"groupType\"></label>");
				 						$("#group_name_label").html("<label id=\"groupName\"></label>");
				 						$("#checkEXTKey1").html("<label id=\"extKey1\"></label>");
				 						$("#checkEXTKey2").html("<label id=\"extKey2\"></label>");
				 						$("#checkEXTKey3").html("<label id=\"extKey3\"></label>");
				 						$("#checkEXTKey4").html("<label id=\"extKey4\"></label>");
				 						$("#checkEXTKey5").html("<label id=\"extKey5\"></label>");
				 						$("#remarks").html("<textarea id=\"remarkArea\" style=\"background-color: #FFD7B5; color: black\" disabled rows=\"4\" cols=\"28\"></textarea>");
				 						
				 						$("#buttonType").html("<div style=\"display: inline; color: red\">Discard the change ? </div><button id=\"yesBtn\" style=\"background:blue; color:white\" type=\"button\" data-role=\"button\" class=\"k-button\" role=\"button\" aria-disabled=\"false\" tabindex=\"0\" onclick=\"toUpdate()\">Yes</button><label>    </label><button id=\"noBtn\" style=\"background:blue; color:white\" type=\"button\" data-role=\"button\" class=\"k-button\" role=\"button\" aria-disabled=\"false\" tabindex=\"0\" onclick=\"#\">No</button>");

	 								}
	 							}
	 						}
	 					}

	        	     	var oRows = document.getElementById('listTable').getElementsByTagName('tr');
	        	     	var iRowCount = oRows.length;

	        	     	for (var i = 0; i < iRowCount; i++) {
        	                 		$('#tabRow'+i).remove();
	                 	};
	                 	
						var getMemberURL = "http://lxdapp25:8080/ERMSCore/groupDetail/getMember?crId="+getURLParameters("crId")+"&userId="+getURLParameters("userId");
						
						var dataSource = new kendo.data.DataSource({
							transport: {
								read: {
						   		  	type: "get",
								    url: getMemberURL,
								    dataType: "json",
			        			    xhrFields: {
			    			    		withCredentials: true
			    			    	}
								}
							},
		                 	requestEnd: function(e) {
						        var response = e.response; // responses content
						       	for (var i = 0; i < response.length; i++) {
						       		$('#list tr:last').before('<tr style=\"font-size:13px;\" id="tabRow'+i+'"> <td>'+checkUndefinedElement(response[i].ccdId)+'&nbsp;&nbsp;</td> <td>'+checkUndefinedElement(response[i].legalPartyEngName)+'&nbsp;&nbsp;</td> <td>'+checkUndefinedElement(response[i].acctId)+'&nbsp;&nbsp;</td> <td>'+checkUndefinedElement(response[i].subAcctId)+'&nbsp;&nbsp;</td> <td>'+checkUndefinedElement(response[i].accName)+'&nbsp;&nbsp;</td> <td>'+checkUndefinedElement(response[i].accBizUnit)+'&nbsp;&nbsp;</td> </tr>');
						        };        
						        $("#countRow").text("No. of Record : " +response.length);	 
							}

						});
							
						openModal();								
						dataSource.fetch();
						closeModal();
		        	     
			        	 $("#resetBtn").kendoButton(); // Reset button event
			        	 $("#exportBtn").kendoButton(); // Export button event
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

	/* Action - Update button */
	function toUpdate(){ /* Direct me to update page */
		window.location = "groupMaintenanceChangeRequest?action=update&rmdGroupId="+getURLParameters("rmdGroupId");
	}

	/* Action - View button */
	function toView(){ /* Direct me to view page */
		var updateBtn = document.getElementById("submitBtn");
	}

	function toSave(){
		var xmlhttp = new XMLHttpRequest();
		var url = "http://lxdapp25:8080/ERMSCore/groupDetail/save?crId="+getURLParameters("crId")+"&userId="+getURLParameters("userId")+"&externalKey1="+checkUndefinedElement(extKey1.value)+"&externalKey2="+checkUndefinedElement(extKey2.value)+"&externalKey3="+checkUndefinedElement(extKey3.value)+"&externalKey4="+checkUndefinedElement(extKey4.value)+"&externalKey5="+checkUndefinedElement(extKey5.value);
		
		var dataSource = new kendo.data.DataSource({
			transport: {
				read: {
		   		  	type: "POST",
				    url: url,
				    dataType: "json",
				    xhrFields: {
			    		withCredentials: true
			    	}
				}
			},
	     	requestEnd: function(e) {
		        var response = e.response; // responses content
		        console.log(response[0].message.toUpperCase());
		        window.sessionStorage.setItem('message', "Saved action of getChangeRequest : " + response[0].message.toUpperCase());
			}
		});
						
		dataSource.fetch();

		window.location.href = "groupMaintenanceList";
	}
	
	/* Action - View button */
	function toReturned(){ /* Direct me to view page */
		var xmlhttp = new XMLHttpRequest();
		var url = "http://lxdapp25:8080/ERMSCore/groupDetail/return?crId="+getURLParameters("crId")+"&userId="+getURLParameters("userId")+"&crRemark="+getURLParameters("remarkArea");
		
		var dataSource = new kendo.data.DataSource({
			transport: {
				read: {
		   		  	type: "POST",
				    url: url,
				    dataType: "json",
				    xhrFields: {
			    		withCredentials: true
			    	}
				}
			},
	     	requestEnd: function(e) {
		        var response = e.response;
		        console.log(response[0].message.toUpperCase());
		        window.sessionStorage.setItem('message', "Returned action of getChangeRequest : " + response[0].message.toUpperCase());
		        window.location.href = "groupMaintenanceList";
			}
		});
						
		dataSource.fetch(function(){
			dataSource.sync();
		});
	}

	function toDiscard(){ /* Direct me to view page */
		var xmlhttp = new XMLHttpRequest();
		var url = "http://lxdapp25:8080/ERMSCore/groupDetail/discard?crId="+getURLParameters("crId")+"&userId="+getURLParameters("userId")+"&crRemark="+getURLParameters("remarkArea");
		
		var dataSource = new kendo.data.DataSource({
			transport: {
				read: {
		   		  	type: "POST",
				    url: url,
				    dataType: "json",
				    xhrFields: {
			    		withCredentials: true
			    	}
				}
			},
	     	requestEnd: function(e) {
		        var response = e.response;
		        console.log(response[0].message.toUpperCase());
		        window.sessionStorage.setItem('message', "Discarded action of getChangeRequest : " + response[0].message.toUpperCase());
		        window.location.href = "groupMaintenanceList";
			}
		});
						
		dataSource.fetch(function(){
			dataSource.sync();
		});
	}

	/* Action - Back button */
	function toBack(){
		window.history.back();
	}
	
	/* Send to submit */
	function toSubmit(){

		var url = "http://lxdapp25:8080/ERMSCore/groupDetail/submit?crId="+getURLParameters("crId")+"&userId="+getURLParameters("userId")+"&externalKey1="+checkUndefinedElement(extKey1.value)+"&externalKey2="+checkUndefinedElement(extKey2.value)+"&externalKey3="+checkUndefinedElement(extKey3.value)+"&externalKey4="+checkUndefinedElement(extKey4.value)+"&externalKey5="+checkUndefinedElement(extKey5.value);
		
		var dataSource = new kendo.data.DataSource({
			transport: {
				read: {
		   		  	type: "POST",
				    url: url,
				    dataType: "json",
				    xhrFields: {
			    		withCredentials: true
			    	}
				}
			},
	     	requestEnd: function(e) {
		        var response = e.response;
		        console.log(response[0].message.toUpperCase());
		        window.sessionStorage.setItem('message', "Updated action of getChangeRequest : " + response[0].message.toUpperCase());
		        window.location.href = "groupMaintenanceList";
			}
		});
						
		dataSource.fetch(function(){
			dataSource.sync();
		});
     	 
		/*window.location.href = "groupMaintenanceList";*/
	}

	/* Action -> To verify */
	function toVerify(){
		var xmlhttp = new XMLHttpRequest();
		var url = "http://lxdapp25:8080/ERMSCore/groupDetail/verify?crId="+checkUndefinedElement(getURLParameters("crId"))+"&crRemark="+document.getElementById("remarkArea").value+"&userId=ABC";

		var dataSource = new kendo.data.DataSource({
			transport: {
				read: {
		   		  	type: "POST",
				    url: url,
				    dataType: "json",
				    xhrFields: {
			    		withCredentials: true
			    	}
				}
			},
	     	requestEnd: function(e) {
		        var response = e.response;
		        window.sessionStorage.setItem('message', "Verified action of getChangeRequest : " + response[0].message.toUpperCase());
		        window.location.href = "groupMaintenanceList";
			}
		});
		dataSource.fetch(function(){
			dataSource.sync();
		});
		/*window.location.href = "groupMaintenanceList";*/
	}

	/* The method which is used for capturing the parameters from URL */
	/* Return  : a Parameter  */
	/* Receive : Parameter Name */

	function getURLParameters(paramName){
		var sURL = window.document.URL.toString();
		if(sURL.indexOf("?") > 0){
			var arrParams = sURL.split("?");
			var arrURLParams = arrParams[1].split("&");
			var arrParamNames = new Array(arrURLParams.length);
			var arrParamValues = new Array(arrURLParams.length)
		}
		var i = 0;
		for(i = 0; i < arrURLParams.length; i++){
			var sParam = arrURLParams[i].split("=");
			arrParamNames[i] = sParam[0];
			if(sParam[1] != ""){
				arrParamValues[i] = unescape(sParam[1]);
			}else{
				arrParamValues[i] = "No Value";
			}
		}

		for(i = 0; i < arrURLParams.length; i++){
			if(arrParamNames[i] == paramName){
				return arrParamValues[i];
			}
		}
		return "";
	}
	/* Handle underfined / null element */
	function checkUndefinedElement(element){
		if(element === null || element === "undefined"){
			return "";
		}else{
			return element;
		}
	}
	/* Data Comparing with previous data and current data */
	function comparingWithBefore(field, bfField, before, current){
		if(before != current){
			field.innerHTML = before;
			bfField.innerHTML = current
			field.style.color = "red";
			bfField.style.color = "red";
		}else{
			field.innerHTML = current;
		}
	}

    </script>

	<body>

		<!-- <script type="text/javascript" src="/ermsweb/resources/js/header.js"></script> -->
		<%-- <%@include file="header.jsp"%> --%>
		<div id="pageTitle" style="background-color:pink; width:1000">
		</div>
		<br>

		<table id="listTable" width:"500" style=" overflow-y :scroll" >
			<tr>
				<td colspan="4" style="background-color:#393052;color:white; width:500; font-size:13px">Group Details</td>
			</tr>
			<tr>
				<td width="166" style="font-size:13px; background-color:#B5A2C6">Group Type.</td>
				<td width="166" colspan="2" style="font-size:13px; background-color:#E7E3EF"><div id="group_type_label"><label></label></div></td>
				
			</tr>
			<tr>
				<td width="166" style="font-size:13px; background-color:#B5A2C6">Group Name.</td>
				<td width="166" colspan="2" style="font-size:13px; background-color:#E7E3EF"><div id="group_name_label"><label></label></div></td>
				
			</tr>
			<tr>
				<td width="166" style="font-size:13px; background-color:#B5A2C6">External Key ID #1</td>
				<td width="166" style="font-size:13px; background-color:#E7E3EF">
					<div id="checkEXTKey1"/>
				</td>
				<td width="166" style="font-size:13px; background-color:#E7E3EF">
					<div id="bfCheckEXTKey1"/>
				</td>
				
			</tr>
			<tr>
				<td width="166" style="font-size:13px; background-color:#B5A2C6">External Key ID #2</td>
				<td width="166" style="font-size:13px; background-color:#E7E3EF">
					<div id="checkEXTKey2"/>
				</td>
				<td width="166" style="font-size:13px; background-color:#E7E3EF">
					<div id="bfCheckEXTKey2"/>
				</td>
				
			</tr>
			<tr>
				<td width="166" style="font-size:13px; background-color:#B5A2C6">External Key ID #3</td>
				<td width="166" style="font-size:13px; background-color:#E7E3EF">
					<div id="checkEXTKey3"/>
				</td>
				<td width="166" style="font-size:13px; background-color:#E7E3EF">
					<div id="bfCheckEXTKey3"/>
				</td>
				
			</tr>
			<tr>
				<td width="166" style="font-size:13px; background-color:#B5A2C6">External Key ID #4</td>
				<td width="166" style="font-size:13px; background-color:#E7E3EF">
					<div id="checkEXTKey4"/>
				</td>
				<td width="166" style="font-size:13px; background-color:#E7E3EF">
					<div id="bfCheckEXTKey4"/>
				</td>
				
			</tr>
			<tr>
				<td width="166" style="font-size:13px; background-color:#B5A2C6">External Key ID #5</td>
				<td width="166" style="font-size:13px; background-color:#E7E3EF">
					<div id="checkEXTKey5"/>
				</td>
				<td width="166" style="font-size:13px; background-color:#E7E3EF">
					<div id="bfCheckEXTKey5"/>
				</td>
				
			</tr>
			<tr>
				<td><br></td>
			</tr>
			<tr>
			<td></td>
			<td></td>
				<td align="right">
					<div id="buttonType">
						<button id="submitBtn"  style="background:blue; color:white" type="button">Submit</button>
						<button id="exportBtn"  style="background:blue; color:white" type="button">Save</button>
						<button id="resetBtn" type="button">Back</button>
					</div>
					</td>
			</tr>
			<tr></tr>
			<tr></tr>
		</table>
		<br>
		
		<div style="overflow-y: scroll; overflow-y: hidden; width:1000px;"><table id="list" width="1000" >
					<tr style="background-color:#082439; color:white">
						<td colspan="15">
							<div style="font-size:13px">Group Member</div>
						</td>
					</tr>
					<tr style="background-color:#BDCFE7; font-size:13px;">
						<td width="166">CCD ID&nbsp;</td>
						<td width="166">Client/Counterparty&nbsp;</td>
						<td width="166">Account No.&nbsp;</td>
						<td width="166">Sub Acc&nbsp;</td>
						<td width="166">Account_Name&nbsp;</td>
						<td width="166">Acc - Biz Unit&nbsp;</td>
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
		<br>
		<div style="width:1000" id='MyGrid'>
			<div id="modal2" align="center" style="display:none;">
		<!-- <div style="background-color:grey; color:white">Result</div> -->
	            <img id="loader2" src="/ermsweb/resources/images/ajax-loader.gif" />
	        </div>
		</div>
		<br>
		<table cellpadding="0" border="0" cellspacing="0" style="font-size: 13px; font-weight: bold;" border="1" width="500" id="approval">
			<tr>
				<td colspan="2" style="font-size: 13px; background-color: #944900; color: white" width="250">Approval</td>
			</tr>
			<tr style="background-color: #FFC394">
				<td width="250">Action Performed By Maker</td>
				<td>Update</td>
			</tr>
			<tr style="background-color: #FFC394">
				<td width="250">Remarks</td>
				<td><div id="remarks"></div>
				</td>
			</tr>
		</table>
		<br>
		<br>
		<table border="0" style="background-color:#B5D5AB">
			<tr>
				<td width="195.5" style="font-size:13px"><b>Created By</b></td>
				<td width="195.5" style="font-size:13px"><label id="createdBy"></label></td>
				<td width="195.5" style="font-size:13px"></td>
				<td width="195.5" style="font-size:13px"><b>Created At</b></td>
				<td width="195.5" style="font-size:13px"><label id="createdAt"></label></td>
			</tr>
			<tr>
				<td width="195.5" style="font-size:13px"><b>Updated By</b></td>
				<td width="195.5" style="font-size:13px"><label id="updateBy"></label></td>
				<td width="195.5" style="font-size:13px"></td>
				<td width="195.5" style="font-size:13px"><b>Updated At</b></td>
				<td width="195.5" style="font-size:13px"><label id="updateAt"></label></td>
			</tr>
			<tr>
				<td width="195.5" style="font-size:13px"><b>Verified By</b></td>
				<td width="195.5" style="font-size:13px"><label id="verifiedBy"></label></td>
				<td width="195.5" style="font-size:13px"></td>
				<td width="195.5" style="font-size:13px"><b>Verified At</b></td>
				<td width="195.5" style="font-size:13px"><label id="verifiedAt"></label></td>
			</tr>
			<tr>
				<td width="195.5" style="font-size:13px"><b>Status</b></td>
				<td width="195.5" style="font-size:13px"><label id="status"></label></td>
				<td width="195.5" style="font-size:13px"></td>
				<td width="195.5" style="font-size:13px"></td>
				<td width="195.5" style="font-size:13px"></td>
			</tr>
		</table>
	</body>
</html>	