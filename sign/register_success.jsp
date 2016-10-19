<%@ page import="java.io.*,java.util.*" %>
<%@page contentType="text/html" pageEncoding="utf-8"%>
<%@ page import="java.io.*"%>
<%@ page import="java.math.*"%>
<!DOCTYPE html>
<html>
<head>
<title>注册成功</title>
<meta http-equiv="Content-Language" content="zh-CN">
<meta HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=utf-8">
<meta http-equiv="refresh" content="3;url=login.html">
<style type="text/css">
body
{ 
	background: url(images/9.jpg);
	background-repeat: no-repeat;
	background-attachment: fixed;
	background-position: center;
	background-size: cover;
	overflow: hidden;
}
</style>
</head>
<body>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<center>
<h1>注册成功，正在返回登录界面...</h1>
<h2>我的朋友<font color="#66CCFF"><%=request.getParameter("uname")%></font>欢迎你</h2>
<h2>如果跳转失败请<a href="login.html">点击这里</a></h2>
</center>
</body>
</html>