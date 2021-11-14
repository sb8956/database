<%@ page contentType="text/html; charset=utf-8" %>
<%@ page import="java.sql.*" %>

<%
	Connection conn = null;

	try{
		Class.forName("oracle.jdbc.driver.OracleDriver");
	}catch(ClassNotFoundException cnfe){
		cnfe.printStackTrace();
		System.out.println("드라이버 로딩 실패");
	}
	try{
		String jdbcUrl = "jdbc:oracle:thin:@localhost:1521:xe";
		String userId = "class_a";
		String userPass = "practice";
		conn = DriverManager.getConnection(jdbcUrl, userId, userPass);
		out.println("접속 성공");
	}catch(SQLException e){
		e.printStackTrace();
		out.println(e);
		out.println("커넥션 설정에 실패");
	}
%>