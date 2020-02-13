<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

<title>天天头条管理员后台系统</title>
<!-- 引入 css -->
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resource/css/bootstrap.css">
<!-- 引入js -->
<script type="text/javascript"
	src="${pageContext.request.contextPath}/resource/js/jquery-3.2.1.js"></script>
</head>
<body style="background-image:url(/resource/images/d.jpg)">
	<div class="container" style="padding-top: 30px;padding-left: 260px">
		<!-- 头 -->
		<div class="row rounded" style="background-color: yellow;background-image: url(/resource/images/ff.jpg);border-radius:20% ">
		
			<div class="col-md-12" float: right" >			
			<ul>
				<li style=" list-style-type: none;float:left;color: #f6318d;font-family: '楷体';font-weight: bold;margin-left: 45px;margin-top: 15px">管理员后台系统</li>				
			</ul>
			<ul>
				<li style=" list-style-type: none;float:left;margin-left: 120px">
					<a href=""><font style="color: black;float: right;margin-left: 360px;color: #f6318d;font-family: '楷体';font-weight: bold" >返回首页</font></a>
				</li>
			</ul>
			<ul>
				<li style="list-style-type: none">
					<img alt="" src="/resource/images/admin.jpg" style="width: 40px;height: 40px;float: right;margin-right: 800px;margin-top: -30px">
				</li>
			</ul>
			</div>
			
		 
				<!-- <div style="height:55px;background-color:skyblue;border-radius:5%;width: 777px;float: right">
				
			</div> -->
			
			<!-- 
			 <div style="float: right;margin-top: -50px">
			<img alt="" src="/resource/images/logo5.png" style="width: 888px;height: 88px;padding-right: 55px">
			</div>  -->
			
			
			</div>
		  
		</div>
		
		
		
		<div class="row" style="padding-top: 35px;padding-left: 150px">
			<div class="col-md-2 rounded" style="text-align: center;padding-top: 5px">
				
				<nav class="nav flex-column">
				 <a class="list-group-item active" href="#" data="/admin/article/articles" style="font-weight:bold;font-family: '楷体'">文章管理</a>
					 <a class="list-group-item " href="#" data="/admin/user/users" style="font-weight:bold;font-family: '楷体'">用户管理</a>
					 <a class="list-group-item" href="#" style="font-weight:bold;font-family: '楷体'">友情链接</a>
				    <a class="list-group-item" href="#" style="font-weight:bold;font-family: '楷体'">系统设置</a>
				</nav>
			</div>
             <!-- 中间区域 -->
			<div class="col-md-10" id="center" style="padding-right: 0px;" >
			
			</div>

		</div>

	</div>




<script type="text/javascript">
 $(function(){
	 //默认加载文章列表
	 $("#center").load("/admin/article/articles");
	 
	//为a标签添加点击事件 
	 $("a").click(function(){
		 //获取当前点击的a标签的 data 属性的值
		var url= $(this).attr("data");
		// alert(url);
		 //先移除已有选中北京颜色
		  $("a").removeClass("active");
		 //为当前点击的菜单添加选中的背景颜色
		 $(this).addClass("list-group-item active");
		$("#center").load(url);//在中间区域加载url
	 })
	 
 })

</script>
</body>
</html>