<%@ page contentType="text/html" pageEncoding="utf-8"%>
<%@ page import="java.sql.*"%>
<html>
<head><title>用户信息</title></head>
<body>
<%   
           request.setCharacterEncoding("utf-8");
           String num=request.getParameter("number");
%>
<%!
    public static final String DBDRIVER = "org.gjt.mm.mysql.Driver" ;
	public static final String DBURL = "jdbc:mysql://localhost:3306/test" ;
	public static final String DBUSER = "root" ;
	public static final String DBPASS = "root" ;
%>
<%
	Connection conn = null ;
	PreparedStatement pstmt = null ;
	ResultSet rs = null ;
%>
<%
try{
	Class.forName(DBDRIVER) ;
	conn = DriverManager.getConnection(DBURL,DBUSER,DBPASS) ;
	String sql = "SELECT name,password,email,number FROM submit where number=?" ;
	pstmt = conn.prepareStatement(sql) ;
	pstmt.setString(1,num) ;
	rs = pstmt.executeQuery() ;
%>
<center>
<table border="1" width="80%">
	<tr>
		<td>用户名</td>
		<td>密码</td>
		<td>邮箱</td>
		<td>电话</td>
	</tr>
<%
	while(rs.next()){
		String name = rs.getString(1) ;
		String password = rs.getString(2) ;
		String email = rs.getString(3) ;
		String number = rs.getString(4) ;
%>
	<tr>
		<td><%=name%></td>
		<td><%=password%></td>
		<td><%=email%></td>
		<td><%=number%></td>
	</tr>	
<%
	}
%>
</table>
</center>
<%
}catch(Exception e)	{
	System.out.println(e) ;
}finally{
	rs.close() ;
	pstmt.close() ;
	conn.close() ;	// 如果直接关闭连接也可以
}
%>
</body>
</html>