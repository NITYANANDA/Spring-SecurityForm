<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title><tiles:insertAttribute name="title" ignore="true" />
</title>
</head>
<body>
	<table border="1" cellspacing="1"   width="100%">
		<tr>
			<td height="30" colspan="2"><tiles:insertAttribute name="header" />
			</td>
		</tr>
		<tr height="100%">
			<td height="270" width="70px"><tiles:insertAttribute name="menu" />
			</td>
			<td width="410"><tiles:insertAttribute name="body" />
			</td>
		</tr>
		<tr height="10px">
			<td height="20" colspan="2"><tiles:insertAttribute name="footer" />
			</td>
		</tr>
	</table>
</body>
</html>