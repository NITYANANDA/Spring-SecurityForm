<html>
<head>
<link
	href="http://ajax.googleapis.com/ajax/libs/jqueryui/1.9.2/themes/ui-darkness/jquery-ui.css"
	rel="stylesheet">

<link rel="stylesheet" type="text/css"
	href="http://cdn.datatables.net/1.10.0/css/jquery.dataTables.css">
<script type="text/javascript"
	src="http://code.jquery.com/jquery-1.10.2.min.js"></script>
<script type="text/javascript"
	src="http://cdn.datatables.net/1.10.0/js/jquery.dataTables.js"></script>
<script
	src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.9.2/jquery-ui.min.js"></script>
<script>
	function show() {

		$(document)	.ready(
						function() {
							$("#example").dataTable(
											{
												"bProcessing" : false,
												"bServerSide" : false,
												"bLengthChange" : false,
												bFilter : false,
												bInfo : false,
												"sAjaxDataProp" : "",
												"bDestroy" : true,
												'bSortable' : false,
												"iDisplayLength" : 10,
												"sAjaxSource" : '${pageContext.request.contextPath}/admin/allusers',
												"aoColumns" : [ {
													"mData" : "id"
												}, {
													"mData" : "username"
												}, {
													"mData" : "address"
												}, {
													"mData" : "email"
												}, {
													"mData" : "pincode"
												},

												]
											});
						});
	}
</script>
</head>


<body onload="show()">
	<div style="padding-top: 20px; height: 497px;width: 350px">
		<c:if test="${!empty userList}">
			<table width="70%" style="padding-left: 200px" class="cell-border">
				<tr>
					<td>
						<table id="example" class="display" cellspacing="0" width="100%">
							<thead>
								<tr>
									<th>Userid</th>
									<th>Username</th>
									<th>Address</th>
									<th>Email</th>
									<th>Pincode</th>
								</tr>
							</thead>
						</table>
					</td>
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
</body>
</html>