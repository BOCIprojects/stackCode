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
	<style>
		.main-menu{
			height:50px;
			background-color:#953735;
			color:white;
		}
		.main-menu td{		
			min-width:143px;
			border-right:2px solid #f9ebeb;
			cursor:pointer;
		}
	
		.menu-item{
			position:relative;
		}
		.main-menu-link{
			color:#fff;
			text-align:center;
		}
		.main-menu-link a{color:#fff;text-decoration:none;}
		ul.sub-menu{
			display:none;
			position:absolute;
			padding:0;margin:0;
			width:190px;
			top:50px;
			left:0;
			list-style:none;
			background-color:#953735;		
		}
		.sub-menu li{
			text-align:left;
			border-bottom:2px solid #f9ebeb;
		}
		.sub-menu li:hover{
			background-color:#f9ebeb;
		}
		.sub-menu li a{
			display:block;
			padding:10px;
			color:#fff;
			text-decoration:none;
		}
		.sub-menu li a:hover{
			color:#920023;
		}
		
		.main-menu td:hover, .main-menu td.active{
			background-color:#f9ebeb;
		}
		.main-menu td:hover ul.sub-menu{border-top:2px solid #920023;}
		.main-menu td:hover .main-menu-link, .main-menu td:hover .main-menu-link a, .main-menu td.active .main-menu-link a, .main-menu td.active .main-menu-link{color:#920023;}
	</style>

<script>
	$(document).ready(function () {
		$(".main-menu").find("td").click(function(){
			$(".main-menu").find(".active").removeClass("active");
			$(this).addClass("active");
		});
		
		$(".menu-item").hover(function(){
			$(this).children('ul').show();
		},function(){
			$(this).children('ul').hide();
		});
	});
	function getHeader(role) {
		
			document
					.write("<table width=\"1000\" cellpadding=\"0\" cellspacing=\"0\">");
		
			document
					.write("<tr> <td colspan='3' width=\"200 \"><img src=\"/ermsweb/resources/images/logo.png\"/></img></td><td><img src=\"/ermsweb/resources/images/title.png\"/></td> <td colspan='3' style=\"font-size:13px\" > User:"+ window.sessionStorage.getItem('username')+"<br> Last Login:"+ window.sessionStorage.getItem('lastLogin')+" </td> </tr>");
		
			document.write("<tr><td colspan='6'>");
	
			document
					.write("<table id=\"header_menu\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\"><tr class=\"main-menu\"> <td><div class=\"main-menu-link\"><a href=\"dashboard\" target=\"main_frame\">Home</a></div></td><td><div class=\"main-menu-link\"><a href=\"http://localhost:8080/ermsweb/ccprmddetailmaintenance\" target=\"main_frame\">Client/Counterparty</a></div></td> <td><div class=\"main-menu-link\">Limit</div></td><td><div class=\"main-menu-link\">Daily Monitoring</div></td> <td><div class=\"main-menu-link\">Report</div></td> <td class=\"menu-item\"><div class=\"main-menu-link\">Maintenance</div><ul class=\"sub-menu\"><li><a href=\"http://localhost:8080/ermsweb/groupMaintenanceList\" target=\"main_frame\">Group Maintenance</a></li><li><a href=\"http://localhost:8080/ermsweb/accountDetailMaintenance\" target=\"main_frame\">Account Maintenance</a></li></ul></td><td><div class=\"main-menu-link\">Logout</div></td></tr></table>");
			document.write("</td></tr>")
			document.write("</table>");
		
	}

</script>
	<body>
		<p style="padding-left: 0.4%"><script>getHeader(window.parent.getRole());</script></p>
	</body>
	
</html>

