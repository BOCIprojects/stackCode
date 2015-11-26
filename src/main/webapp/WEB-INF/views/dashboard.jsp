<html lang="en">	
	<meta http-equiv="Content-Style-Type" content="text/css">
    <meta http-equiv="Content-Script-Type" content="text/javascript">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <script type="text/javascript" src="/ermsweb/resources/js/validation.js"></script>
    
    <!-- General layout Style -->
    <link href="/ermsweb/resources/css/layout.css" rel="stylesheet" type="text/css">

    <!-- Kendo UI lib -->
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

 	<script type="text/javascript">
 		    $(document).ready(function () {

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
	        });
	</script>
			<!-- <div width="1000"> -->
				<!-- <script type="text/javascript" src="/ermsweb/resources/js/header.js"></script> -->
				<%-- <%@include file="header.jsp"%> --%> 
				
				<div style="background-color:pink; width:1060">Home (HOME-SCN-001)</div>
				<br>
				<div style="color: red; display: inline-block">System Message: xxxxxxxxxxxxxx</div>
				<br>
				<br>
				<table border="0" height="300" cellpadding="0" cellspacing="0">
					<tr>
						<td width="490" rowspan="3" valign="top">
							<table border="0" cellpadding="0" cellspacing="0" style="border: solid 1px; border-collapse: collapse;" width="470">
								<tr>
									<td valign="top" height="30">
										<table border="0" cellpadding="0" cellspacing="0" style="height:10px; border: solid 1px; border-collapse: collapse; table-layout:fixed;" width="100%">
											<tr height="30">
												<td colspan="4" align="center" style="background-color:pink">
												<b>Limit/Exposure Monitoring Alert</b>
												</td>
											</tr>
										</table>
									</td>
								</tr>
								<tr>
									<td valign="top">
										<div id="Contain" style="height:845; overflow-y:scroll; overflow-x:scroll; word-wrap: break-word; margin-top:-1px;">
											<table id="ContentTable" border="0" cellpadding="0" cellspacing="0" style="border: solid 1px;border-collapse: collapse; table-layout:fixed;  text-overflow: clip; " width="500">
											
											<tr><td>1. Large Exposure Violations (36 cases)</td></tr>
											<tr><td>2. Clustering Group Exposure Vlolation (15 cases)</td></tr>
										
											<tr><td>3. Connected Lending Limit Viiolations (20 cases) </td></tr>

											<tr><td>4. LEE Limit Violations (5 cases)</td></tr>
													
											</table>
										</div>
									</td>
								</tr>
							</table>
						</td>
						</td>
						<td width="4" rowspan="3">
							<p style="word-spacing: 10px">&nbsp;</p>
						</td>
						<td width="500" valign="top">
							<!-- ++++++++++++++++++++++++ -->
							<table border="0" cellpadding="0" cellspacing="0" style="border: solid 1px; border-collapse: collapse;" width="470">
								<tr>
									<td valign="top" height="30">
										<table border="0" cellpadding="0" cellspacing="0" style="height:10px; border: solid 1px; border-collapse: collapse; table-layout:fixed;" width="100%">
											<tr height="30">
												<td colspan="4" align="center" style="background-color:pink">
												<b>Upsteam System Data</b>
												</td>
											</tr>
											<tr class="Header">
												<td nowrap="nowrap" align="center" width="80">Upsteam System</td>
												<td nowrap="nowrap" align="center" width="80">Status</td>
												<td nowrap="nowrap" align="center" width="80">Latest Day End Date</td>
												<td nowrap="nowrap" align="center" width="80">last Loading Time</td> 
											</tr>
											<tr>
												<td colspan="4">&nbsp;</td>
											</tr>
										</table>
									</td>
								</tr>
								<tr>
									<td valign="top">
										<div id="Contain" style="height:240px; overflow-y:scroll; overflow-x:scroll; word-wrap: break-word; margin-top:-1px;">
											<table id="ContentTable" border="0" cellpadding="0" cellspacing="0" style="border: solid 1px;border-collapse: collapse; table-layout:fixed;  text-overflow: clip; " width="500">
											<tr>
												<td width="129" align="left" max-width="70">XXXX </td>
												<td width="123" align="left" max-width="70">XXXX </td>
												<td width="125" align="left" max-width="70">XXXX </td>
												<td width="113" align="left" max-width="70">XXXX </td>
											</tr>
											</table>
										</div>
									</td>
								</tr>
							</table>
							<!-- ++++++++++++++++++++++++ -->

						</td>
					</tr>
					<tr>
						<td valign="top" height="30">
							<table border="0" cellpadding="0" cellspacing="0" style="border: solid 1px; border-collapse: collapse;" width="470">
								<tr>
									<td valign="top" height="30">
										<table border="0" cellpadding="0" cellspacing="0" style="height:10px; border: solid 1px; border-collapse: collapse; table-layout:fixed;" width="100%">
											<tr height="30">
												<td colspan="4" align="center" style="background-color:pink">
												<b>Pending Action</b>
												</td>
											</tr>
											
										</table>
									</td>
								</tr>
								<tr>
									<td valign="top">
										<div id="Contain" style="height:240px; overflow-y:scroll; overflow-x:scroll; word-wrap: break-word; margin-top:-1px;">
											<table id="ContentTable" border="0" cellpadding="0" cellspacing="0" style="border: solid 1px;border-collapse: collapse; table-layout:fixed;  text-overflow: clip; " width="500">
											<tr>
												<td>1. New Limit Approval - Chan Tai Man HKD$200M</td>
											</tr>
											<tr>
												<td>2. Fund Out Approval - David Chan HKD$50M</td>
											</tr>

											</table>
										</div>
									</td>
								</tr>
							</table>
						</td>
					</tr>
					<tr>
						<td valign="top" height="30">
							<table border="0" cellpadding="0" cellspacing="0" style="border: solid 1px; border-collapse: collapse;" width="470">
								<tr>
									<td valign="top" height="30">
										<table border="0" cellpadding="0" cellspacing="0" style="height:10px; border: solid 1px; border-collapse: collapse; table-layout:fixed;" width="100%">
											<tr height="30">
												<td colspan="4" align="center" style="background-color:pink">
												<b>Your Request in Progress</b>
												</td>
											</tr>
										</table>
									</td>
								</tr>
								<tr>
									<td valign="top">
										<div id="Contain" style="height:240px; overflow-y:scroll; overflow-x:scroll; word-wrap: break-word; margin-top:-1px;">
											<table id="ContentTable" border="0" cellpadding="0" cellspacing="0" style="border: solid 1px;border-collapse: collapse; table-layout:fixed;  text-overflow: clip; " width="500">
											<tr>
												<td>1. Limit Applications - Jan May HKD$35M (Pending RCC Approval)</td>
											</tr>
											<tr>
												<td>2. Margin Call Extend Application - Charles Chan HKD $55M (Pending RM Action)</td>
											</tr>

											</table>
										</div>
									</td>
								</tr>
							</table>
						</td>
					</tr>
				</table>
<!-- 			</div>
 -->		</body>
</html>
