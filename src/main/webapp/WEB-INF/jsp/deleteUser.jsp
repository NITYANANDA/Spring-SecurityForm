<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<script type="text/javascript"
	src="http://code.jquery.com/jquery-1.10.2.min.js"></script>
<script>

	$(document).ready(function() {
		$("#edit").hide();
		

	});

	function search() {

		//		var userid = $("#userId").val();
		var userid = document.getElementById('userId').value;
		$.ajax({
			url : '/SpringSecurityForms/admin/search/' + userid,
			type : "GET",
			dataType : 'json',
			contentType : 'application/json',
			mimeType : 'application/json',
			success : function(data, textStatus, jqXHR) {
				$("#userid").val(data.id);
				$("#userName").val(data.username);
				$("#email").val(data.email);
				$("#address").val(data.address);
				$("#pincode").val(data.pincode);
				$("#edit").show();
				$("#search").hide();
				$("#msg").hide();
			},
			error : function(jqXHR, textStatus, errorThrown) {

				alert("error in request");
			}
		});
	}
</script>
<style>

.page{
padding-left: 40px;
padding-top: 10px;
}
</style>
</head>
<body>
<div style="padding-left: 400px;padding-top: 10px" id="search">
	<input type="text" name="id" id="userId">
	<input type="submit" value="search" onclick="search()" />
</div>
	<div  title="User Form" style="height: 462px; width:100px; padding-left: 300px;padding-top: 20px;">
	
	<div id="edit" style="background-color: cyan;width: 400px;height: 300px" >
		<form:form id="userForm" modelAttribute="user"
			action='${pageContext.request.contextPath}/admin/user/delete'>

			<div class="page">
				<label>UserId: &nbsp &nbsp</label> <input id="userid" name="id"
					value="user.id" />
			</div>

			<div class="page">
				<label> Name: &nbsp &nbsp</label> <input id="userName"
					name="username" value="user.username" />
			</div>
				
				<div class="page">
				<label>Address:&nbsp</label> <input id="address" name="address"
					value="user.address" />
			</div>
				
				<div class="page">
				<label> Email:&nbsp &nbsp&nbsp &nbsp</label> <input id="email"
					name="email" value="user.email" />
			</div>
				
				<div class="page" >
				<label> Pincode:&nbsp</label> <input id="pincode" name="pincode"
					value="user.pincode" />
			</div>
				
				<div class="page">
				<input id="submit" type="submit"  value="Delete"/>
		
			</div>
		</form:form>
		
	</div>
	<div id="msg" style="white-space: nowrap;">${sessionScope.msg}</div>
</div>
</body>