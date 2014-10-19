<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<title>jQuery Dialog Form Example</title>

<!-- Including CSS File Here-->
<!-- Including CSS & jQuery Dialog UI Here-->
<style>
@import "http://fonts.googleapis.com/css?family=Droid+Serif";
/* Above line is used for online google font */
h2 {
	text-align: center;
	font-size: 24px
}

hr {
	margin-bottom: 30px
}

p {
	color: #000;
	font-size: 16px;
	font-weight: 700
}

#userid,#name,#email {
	padding-left: 10px
}

input[type=submit] {
	width: 30%;
	border: 1px solid #59b4d4;
	background: #0078a3;
	color: #eee;
	padding: 2px 0;
	border-radius: 3px;
	margin-left: 33%;
	cursor: pointer
}

input[type=submit]:hover {
	border: 1px solid #666;
	background: #555;
	color: #fff
}

.ui-dialog .ui-dialog-content {
	padding: 2em
}
</style>
<link
	href="http://ajax.googleapis.com/ajax/libs/jqueryui/1.9.2/themes/ui-darkness/jquery-ui.css"
	rel="stylesheet">
	
<link rel="stylesheet" type="text/css" href="//cdn.datatables.net/1.10.0/css/jquery.dataTables.css">
<script type="text/javascript" src="http://code.jquery.com/jquery-1.10.2.min.js"></script>
<script type="text/javascript" src="http://cdn.datatables.net/1.10.0/js/jquery.dataTables.js"></script>	
<script
	src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.9.2/jquery-ui.min.js"></script>

	
<script>

	

		$(function() {

			$("#dialog").dialog({
				autoOpen : false,
				hide : "puff",
				show : "slide",
				width : 400,
				resizable : false,
				draggable : false,
				position : [ 'center', 100 ],
				"sDom": '<"top"if>rt<"bottom"lp><"clear">',

			});
			$("#button").on("click", function() {
				$("#dialog").dialog("open");
			});
		});

		
	});
	function showData()
	{
		document.getElementById("page").value="";
		show();
		
	}
</script>

</head>
<body onload="show()" id="hello">

	<div style="height: 496px ;background-color: cyan;"  >
	<div align="right"><a href="${pageContext.request.contextPath}/home/logoutPage">logout</a></div>

	
		
	</div>
</body>
</html>
