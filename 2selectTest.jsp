<%@ page contentType="text/html; charset=utf-8" %>
<%@ page import="java.sql.*" %>

<!DOCTYPE html>
<html>
<head>
	<title>구매자가 구입하고자하는 책의 번호가 ? 인 책을 판매하는 판매자의 휴대폰 번호과 학번 </title>
</head>
<body>
	<table width="500" border="1">
		<tr>
			<td width="100">책 번호</td>
			<td width="100">판매자 휴대폰 번호</td>
			<td width="100">판매자 학번</td>
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

		String sql = "SELECT book_num, sell_phone, Seller.sell_id FROM Book, Seller WHERE book_num = ? and seller.sell_id = book.sell_id";

		pstmt = conn.prepareStatement(sql);
    pstmt.setInt(1,bnum);
    pstmt.executeUpdate();
		rs = pstmt.executeQuery();
		while( rs.next() ) {
			int book_num = rs.getInt("book_num");
			String sell_phone = rs.getString("sell_phone");
			String sell_id = rs.getString("sell_id");

%>
			<tr>
				<td width="100"><%= book_num %></td>
				<td width="100"><%= sell_phone %></td>
				<td width="100"><%= sell_id %></td>
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
