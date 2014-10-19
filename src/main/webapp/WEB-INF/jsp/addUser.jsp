<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<style>
.page{
padding-left: 200px;
padding-top: 10px;
}
.main
{

background-color: gray;
padding-top: 20px;
width: 600px;
height: 300px;
}
</style>
<div id="dialog" title="User Form" class="page" style="width: 220px ;height: 485px">
<div class="main">
<div >
	<form:form id="userForm" modelAttribute="user"
			action='${pageContext.request.contextPath}/admin/user/add'>

		
			<div class="page">
				<label> Name: &nbsp &nbsp</label> <input id="userName"
					name="username"  />
			</div>
				
				<div class="page">
				<label>Address:&nbsp</label> <input id="address" name="address"
					 />
			</div>
				
				<div class="page">
				<label> Email:&nbsp &nbsp&nbsp &nbsp</label> <input id="email"
					name="email"  />
			</div>
				
				<div class="page" >
				<label> Pincode:&nbsp</label> <input id="pincode" name="pincode"
					/>
			</div>
				
				<div class="page">
				<input id="submit" type="submit"  value="AddUser"/>
		
			</div>
		</form:form>
</div>
</div>
<div style="padding-top: 100px">
	<c:if test="${!empty userList}">
		<table width="70%" style="padding-left: 200px;background-color: yellow;" class="cell-border" border="1" >
			<tr>
							<thead>
							<tr>
								<th>Userid</th>
								<th>Username</th>
								<th>Address</th>
								<th>Email</th>
								<th>Pincode</th>
							</tr>
						</thead>
					
				
			</tr>
			<tbody>
				<c:forEach items="${userList}" var="user">

					<tr>
						<td>${user.id}</td>
						<td>${user.username}</td>
						<td>${user.address}</td>
						<td>${user.email}</td>
						<td>${user.pincode}</td>

					</tr>
				</c:forEach>
			</tbody>
		</table>
	</c:if>
</div>
</div>
<div id="msg" align="center">${requestScope.msg}</div>
