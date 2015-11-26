<html>
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
		
		$(document).ready(
							
			function(){
			
			/* Control and initialize the menu bar of header
			 (8 options of menu)
			*/
			/* checkFirstVisit(); */
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
	
		function getRole(){ // Simulating to be different roles 
			return "checker";
		}
		
	</script>
    <head></head>
    
    <body>
        <%@include file="header.jsp"%>
        
        <iframe cellpadding="0" cellspacing="0" style="overflow: auto; display:block;"  frameborder="0" border="0" frameborder="0" scrolling="no" width="100%" height="100%" src="http://lxdapp26:8080/ermsweb/dashboard" name="main_frame"></iframe>
    </body>
</html>