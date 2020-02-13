<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@  taglib prefix="fmt"  uri="http://java.sun.com/jsp/jstl/fmt"   %>
	<%@  taglib prefix="form" uri="http://www.springframework.org/tags/form" %>   
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>头条个人中心</title>
<!-- 引入 css -->
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resource/css/bootstrap.css">
<!-- 引入js -->
<script type="text/javascript" src="${pageContext.request.contextPath}/resource/js/jquery-3.2.1.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>
<body style="background-image:url(/resource/images/zlog.jpg)">

	<div class="container-fluid"  style="padding-top: 10px">

		<div class="row">

			<div class="col-md-12" style="height: 60px;background-color:skyblue;background-image:url(/resource/images/ddd.jpeg);border-radius:5%">
				<img alt="" src="/resource/images/logo1.PNG" width="55px" height="55px" class="rounded-circle" style="float: right;margin-right:1750px"> 
					<font style="color: white;font-weight: bold;font-family: '楷体';font-size: 19px;margin-right:1600px;margin-top:-38px;float: right;">个人中心后台</font>
			</div>
			
		</div>

		<div class="row" style="padding-top: 5px" >
			<div class="col-md-2" style="text-align: center;background-image:url(/resource/images/ddd.jpeg);border-radius:10%">
				<ul class="list-group" style=" list-style-type: none;font-size: 29px;font-weight: bold;font-family: '楷体'">
					<li style="padding-top: 50px"> <a href="#" data="/my/article/articles"><font color="white">我的文章</font></a></li>
					<li style="padding-top: 50px"> <a href="#" data="/my/article/publish"><font color="white">发布文章</font></a></li>
					<li style="padding-top: 50px"><a href="#" data="/my/stars"><font color="white">我的粉丝</font></a></li>
					<li style="padding-top: 50px"> <a href="#" data="/my/article/readed"> <font color="white">阅读历史</font></a></li>
					<li style="padding-top: 50px"><a href="#" data="/my/user/update"> <font color="white">编辑资料</font></a></li>
				</ul>

			</div>
			<div class="col-md-10" id="center">
			
			   <!-- 引入kindeditor的样式。不用显示 -->
			  <div style="display: none">
			    <jsp:include page="/resource/kindeditor/jsp/demo.jsp"/>
			  
			  </div>
			
			
			</div>

		</div>


	</div>


	<script type="text/javascript">
	  $(function(){
		  //默认显示我的文章
		  $("#center").load("/my/article/articles")
		  
		  
		 $("li").click(function(){
			 var url=$(this).children().attr("data");
			 $("li").removeClass("active");
			 $(this).addClass("list-group-item active")
			 $("#center").load(url)
		 })  
	  })
	</script>




</body>
</html>