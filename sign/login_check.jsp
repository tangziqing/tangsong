<%@page contentType="text/html" pageEncoding="utf-8"%>
<%@ page import="java.sql.*"%>

<html>
<head><title>验证</title></head>
<body>
<center>
<h1>登陆操作</h1>
<hr>
<%   
           request.setCharacterEncoding("utf-8");
           String usename=request.getParameter("user");
		   String pwd=request.getParameter("Password");
%>
<%!	// 定义若干个数据库的连接常量
	public static final String DBDRIVER = "org.gjt.mm.mysql.Driver" ;
	public static final String DBURL = "jdbc:mysql://localhost:3306/test" ;
	public static final String DBUSER = "root" ;
	public static final String DBPASS = "root" ;
%>
<%
	Connection conn = null ;		// 数据库连接
	PreparedStatement pstmt = null ;	// 数据库预处理操作
	ResultSet rs = null ;		// 查询要处理结果集
	boolean flag = false ;	// 保存标记
	String name = null ;	// 保存真实姓名
%>
<%
try{
%>
<%  
	Class.forName(DBDRIVER) ;
	conn = DriverManager.getConnection(DBURL,DBUSER,DBPASS) ;
	String sql = "SELECT name FROM submit WHERE name=? AND password=?" ;
	pstmt = conn.prepareStatement(sql) ;
	pstmt.setString(1,usename) ;
	pstmt.setString(2,pwd);
	rs = pstmt.executeQuery() ;	// 查询
	if(rs.next()){	// 如果有数据，则可以执行
		flag = true ;	//  表示登陆成功
		name = rs.getString(1) ;
	}	
%>
<%
}catch(Exception e)	{
	e.printStackTrace() ;
}
finally{
	try{
		rs.close() ;
		pstmt.close() ;
		conn.close() ;
	} catch(Exception e){}
}
%>
<%
	if(flag){	// 登陆成功
%>
		<jsp:forward page="login_success.jsp">
			<jsp:param name="uname" value="<%=name%>"/>
		</jsp:forward>
<%
	} else {		// 登陆失败
%>
		<jsp:forward page="login_failure.html"/>
<%
	}
%>
</center>
</body>
</html>