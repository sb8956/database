<%@ page contentType="text/html; charset=utf-8" %>
<%@ page import="java.sql.*" %>

<!DOCTYPE html>
<html>
<head>
	<title>책 번호 입력</title>
</head>
<body>
	<p>책 번호를 입력하세요.</p>
	<form name="form1" method="post" action="2selectTest.jsp">
		<p>책 번호 : <input type="text" name="bnum"></p>
		<p><input type="submit" name="Submit" value="보내기"></p>
	</form>
</body>
</html>
