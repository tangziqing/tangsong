<%@ page contentType="text/html" pageEncoding="utf-8"%>
<%@ page import="java.sql.*"%>
<!doctype html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
		<title>用户信息</title>
		<link rel="stylesheet" type="text/css" href="css/showword.css" />
	</head>
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
<div id="login">
			<p class="ti">用户信息</p>
			<div class="logincon">
					<table>
<%
	if(rs.next()){
		String name = rs.getString(1) ;
		String password = rs.getString(2) ;
		String email = rs.getString(3) ;
		String number = rs.getString(4) ;
%>
						<tr>
							<th></th>
							<td><span>用户名:</span></td>
							<td>
								<input type="text" value="<%=name%>" />
							</td>
						</tr>
						<tr>
							<th></th>
							<td><span>密&nbsp;码:</span></td>
							<td>
								<input type="text" value="<%=password%>" />
							</td>
						</tr>
						<tr>
							<th></th>
							<td><span>邮&nbsp;箱:</span></td>
							<td>
								<input type="text" value="<%=email%>" disabled="disabled" />
							</td>
						</tr>
						<tr>
							<th></th>
							<td><span>电&nbsp;话:</span></td>
							<td>
								<input type="text" value="<%=number%>" disabled="disabled" />
							</td>
						</tr>
					</table>
<%
	}
%>
<%
}catch(Exception e)	{
	System.out.println(e) ;
}finally{
	rs.close() ;
	pstmt.close() ;
	conn.close() ;	// 如果直接关闭连接也可以
}
%>
						
					<div class="buttons">
						<a href="login.html">
							<input value="返回登录" type="button">
						</a>
					</div>
			</div>
</div>
</body>
</html>