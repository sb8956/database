<%@ page contentType="text/html; charset=utf-8" %>
<%@ page import="java.sql.*" %>

<!DOCTYPE html>
<html>
<head>
	<title>책 상태 입력</title>
</head>
<body>
	<p>책 상태를 입력하세요.</p>
	<form name="form1" method="post" action="3selectTest.jsp">
		<p>책 상태 : <input type="text" name="bnum"></p>
		<p><input type="submit" name="Submit" value="보내기"></p>
	</form>
</body>
</html>
