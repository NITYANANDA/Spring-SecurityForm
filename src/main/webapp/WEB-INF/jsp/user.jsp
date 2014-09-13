<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<title>jQuery Dialog Form Example</title>
<link href="css/dialog.css" rel="stylesheet">
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
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
<script	src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.9.2/jquery-ui.min.js"></script>
<script	 src="http://cdn.datatables.net/1.10.2/js/jquery.dataTables.min.js"> </script>
<script>



</script>

<script>


 	$(document).ready(function() {
		$(function() {
			$("#dialog").dialog({
				autoOpen : false,
				hide : "puff",
				show : "slide",
				width:400,
				resizable: false,
				draggable: false,
				position: ['center',100]

			});
			$("#button").on("click", function() {
				$("#dialog").dialog("open");
			});
		});
		
		$("#submit").click(function(e) {
			var uid = $("#userid").val();
			var email = $("#email").val();
			var name = $("#name").val();
			var emailReg = /^([\w-\.]+@([\w-]+\.)+[\w-]{2,4})?$/;
			if (email === '' || name === '') {
				alert("Please fill all fields...!!!!!!");
				e.preventDefault();
			} else if (!(email).match(emailReg)) {
				alert("Invalid Email...!!!!!!");
				e.preventDefault();
			} else {
				alert("Form Submitted Successfully......");
			}
		});
	});
	
	 
	
	
</script>

</head>
<body>
<div style="height: 496px">
	<div id="dialog" title="User Form">
		<form:form id="userForm" modelAttribute="user" action='${pageContext.request.contextPath}/admin/user/add'>

			<div style="display: inline;"><label>Name:</label>
			<form:input id="userName" path ="username"/></div>
			<div>
			<label>Address:</label>
			<form:input id="address" path="address" />
			</div>
			<div>
			<label>Email:</label>
			<form:input id="email" path="email"/>
			</div>
			<div>
			<label>Pincode:</label>
			<form:input id="pincode" path="pincode"/>
			</div>
			<div>
			<input id="submit" type="submit" value="Submit">
			</div>
		</form:form>
	</div>
	<input id="button" type="button" value="AddUser">
<div style="padding-top: 250px">	
<h3>List of users in Library</h3>
<c:if test="${!empty userList}">
	<table class="userTable" border="1" id="example">
		<tr>
			<th width="180">UserId</th>
			<th width="180">UserName</th>
			<th width="160">Address</th>
			<th width="60">Email</th>
			<th width="80">Pincode</th>
			<th width="60">Edit</th>
			<th width="60">Delete</th>
		</tr>
		<c:forEach items="${userList}" var="user">
			<tr>
				<td>${user.id}</td>
				<td>${user.username}</td>
				<td>${user.address}</td>
				<td>${user.email}</td>
				<td>${user.pincode}</td>
				
				<td><img src="<c:url value='/images/vcard_delete.png' />"
					title="Delete user" onclick="javascript:deleteuser(${user.id})" />
					<a href="<c:url value='/edit/${user.id}' />"> <img
						src="<c:url value='/images/vcard_add.png' />" title="Edit user" />
				</a></td>
			</tr>
		</c:forEach>
	</table>
</c:if>
</div>
</div>
</body>
</html>
