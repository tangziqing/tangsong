<%@ page language="java" import="java.util.*,java.sql.*" pageEncoding="utf-8"%> 
<%@ page contentType="text/html;charset=utf-8"%> 
<%  
   request.setCharacterEncoding("UTF-8");  
   response.setCharacterEncoding("UTF-8");  
   response.setContentType("text/html; charset=utf8");  
%>  
<html> 
<head> 
<title>添加进数据库<title>
</head> 
<body> 
<% 
request.setCharacterEncoding("utf-8");
String name=request.getParameter("name"); //从表单获得 
String pwd=request.getParameter("password"); //从表单获得  
String email=request.getParameter("email"); //从表单获得 
String num=request.getParameter("number"); //从表单获得 

java.util.Date date=new java.util.Date(); 
String datetime=new Timestamp(date.getTime()).toString(); 
try 
{ 
/** 连接数据库参数 **/ 
String driverName = "org.gjt.mm.mysql.Driver"; //驱动名称 
String DBUser = "root"; //mysql用户名 
String DBPasswd = "root"; //mysql密码 
String DBName = "test"; //数据库名 

String connUrl = "jdbc:mysql://localhost:3306/" + DBName + "?user=" + DBUser + "&password=" + DBPasswd; 
Class.forName(driverName).newInstance(); 
Connection conn = DriverManager.getConnection(connUrl); 
Statement stmt = conn.createStatement(); 
stmt.executeQuery("SET NAMES UTF8"); 
String insert_sql = "insert into submit(name,password,email,number) values('" + name + "','" + pwd + "','" + email + "','" + num + "')"; 
String query_sql = "select * from submit"; 

try { 
stmt.execute(insert_sql); 
}catch(Exception e) { 
e.printStackTrace(); 
} 
try { 
ResultSet rs = stmt.executeQuery(query_sql); 
while(rs.next()) { 
%> 
<jsp:forward page="register_success.jsp">
			<jsp:param name="uname" value="<%=name%>"/>
		</jsp:forward>
<% 
} 
}catch(Exception e) { 
e.printStackTrace(); 
} 
//rs.close(); 
stmt.close(); 
conn.close(); 
}catch (Exception e) { 
e.printStackTrace(); 
} 
%> 
</body> 
</html> 