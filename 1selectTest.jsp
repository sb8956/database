<%@ page contentType="text/html; charset=utf-8" %>
<%@ page import="java.sql.*" %>

<!DOCTYPE html>
<html>
<head>
	<title> 판매자의 판매자 점수가 ?점 이상인 판매자의 이름과 판매하는 책 이름 </title>
</head>
<body>
	<table width="500" border="1">
		<tr>
			<td width="100">책 이름</td>
			<td width="100">판매자 이름</td>
			<td width="100">판매자 점수</td>
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

		String sql = "SELECT book_name, sell_name, sell_point FROM Book, Seller WHERE　Seller.sell_point>= ? AND book.sell_id = seller.sell_id";

		pstmt = conn.prepareStatement(sql);
    pstmt.setInt(1,bnum);
    pstmt.executeUpdate();
		rs = pstmt.executeQuery();
		while( rs.next() ) {
			int sell_point = rs.getInt("sell_point");
			String book_name = rs.getString("book_name");
			String sell_name = rs.getString("sell_name");

%>
			<tr>
				<td width="100"><%= book_name %></td>
				<td width="100"><%= sell_name %></td>
				<td width="100"><%= sell_point %></td>
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
