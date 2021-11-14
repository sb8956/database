<%@ page contentType="text/html; charset=utf-8" %>
<%@ page import="java.sql.*" %>

<!DOCTYPE html>
<html>
<head>
	<title>책 상태가 ? 이상의 책을 구매하는 구매자의 이름과 학번 </title>
</head>
<body>
	<table width="500" border="1">
		<tr>
			<td width="100">책 상태</td>
			<td width="100">구매자 이름</td>
			<td width="100">구매자 학번</td>
		</tr>
<%

  int bnum = Integer.parseInt(request.getParameter("bnum"));
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;

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

		String sql = "SELECT book_state, pur_name, pur_id FROM　Purchaser, Book WHERE Book.book_state >= ? and Purchaser.book_num = Book.book_num";

		pstmt = conn.prepareStatement(sql);
    pstmt.setInt(1,bnum);
    pstmt.executeUpdate();
		rs = pstmt.executeQuery();
		while( rs.next() ) {
			int book_state = rs.getInt("book_state");
			String pur_name = rs.getString("pur_name");
			String pur_id = rs.getString("pur_id");

%>
			<tr>
				<td width="100"><%= book_state %></td>
				<td width="100"><%= pur_name %></td>
				<td width="100"><%= pur_id %></td>
			</tr>

<%
		}
	}catch(SQLException e){
		e.printStackTrace();

		if(rs != null) {
			try {
				rs.close();
			}catch(SQLException sqle) {}
		}
		if(pstmt != null) {
			try {
				pstmt.close();
			}catch(SQLException sqle) {}
		}
		if(conn != null) {
			try {
				conn.close();
			}catch(SQLException sqle) {}
		}
	}
%>

	</table>

</body>
</html>
