<%@ page import="java.io.*,java.util.*" %>
<%@page contentType="text/html" pageEncoding="utf-8"%>
<%@ page import="java.io.*"%>
<%@ page import="java.math.*"%>
<!doctype html>
<html>

<head>
<title>登录成功</title>
<meta http-equiv="Content-Language" content="zh-CN">
<meta HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=utf-8">
<meta http-equiv="refresh" content="6;url=../youli.html">
<link href="css/tiaozhuan.css" type="text/css" rel="stylesheet" />

<script src="http://libs.baidu.com/jquery/1.10.2/jquery.min.js">
</script>
<script>
$(document).ready(function(){
    $("#div1").fadeIn(5000);
    $("#div2").fadeIn(6000);
    $("#div3").fadeIn(7000);
	 $("#div4").fadeIn(8000);
});
</script>

<script src="js/prefixfree.min.js"></script>

</head>

<body>

<%!
	BigInteger count = null ;
%>
<%!	// 为了开发简便，将所有的操作定义在方法之中，所有的异常直接加入完整的try...catch处理
	public BigInteger load(File file){
		BigInteger count = null ;	// 接收数据
		try{
			if(file.exists()){
				Scanner scan = new Scanner(new FileInputStream(file)) ;
				if(scan.hasNext()){
					count = new BigInteger(scan.next()) ;
				}
				scan.close() ;
			} else {	// 应该保存一个新的，从0开始
				count = new BigInteger("0") ;
				save(file,count) ;	// 保存一个新的文件
			}
		}catch(Exception e){
			e.printStackTrace() ;
		}
		return count ;
	}
	public void save(File file,BigInteger count){
		try{
			PrintStream ps = null ;
			ps = new PrintStream(new FileOutputStream(file)) ;
			ps.println(count) ;
			ps.close() ;
		}catch(Exception e){
			e.printStackTrace() ;
		}
	}
%>
<%
	String fileName = this.getServletContext().getRealPath("/") + "count.txt";	// 这里面保存所有的计数的结果
	File file = new File(fileName) ;
	if(session.isNew()){
		synchronized(this){
			count = load(file) ;	// 读取
			count = count.add(new BigInteger("1")) ;	// 再原本的基础上增加1。
			save(file,count) ;
		}
	}
%>
	<div class='kai animate' id='running'>
		<div class='eyes'></div>
	</div>
	
	<div class='slide'>
		<div class='stage'>
			<div class='foreground-trees'></div>
			<div class='landscape'></div>
			<div class='behind-trees'></div>
			<div class='behind-mountains'></div>
		</div>
	</div>
	
	<center class="message">
<div id="div1" style="display:none"><h1>登录成功，正在进入...</h1></div>
<div id="div2" style="display:none"><h2>我的朋友<font color="#66CCFF"><%=request.getParameter("uname")%></font>欢迎你</h2></div>
<div id="div3" style="display:none"><h2>你是第<%=count==null?0:count%>位访客！</h2></div>
<div id="div4" style="display:none"><h2>如果跳转失败请<a href="./youli.html"><font color="#66CCFF">点击这里</a></h2></div>
</center>

<script type="text/javascript" src='js/jquery.js'></script>
<script type="text/javascript" src='js/jquery.transform.js'></script>
<script type="text/javascript" src="js/tiaozhuan.js"></script>

</body>
</html>