<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@  taglib prefix="fmt"  uri="http://java.sun.com/jsp/jstl/fmt"   %>
	<%@  taglib prefix="form" uri="http://www.springframework.org/tags/form" %>   
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>就不告诉你</title>
<!-- 引入 css -->
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resource/css/bootstrap.css">
<link rel="stylesheet" type="text/css" href="/resource/css/index.css">
<!-- 引入js -->
<script type="text/javascript" src="${pageContext.request.contextPath}/resource/js/jquery-3.2.1.js"></script>
<script type="text/javascript" src="/resource/js/bootstrap.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>
<body  style="background-image:url(/resource/images/logo8.jpg);">

		<div class="container-fluid">

		<div class="row">
			<div class="col-md-12"
				style="background-color: #222222; height: 34px; padding-top: 5px; font-size: 14px">
				<a href="#"><font color="white" style="font-family: '楷体';font-weight: bold">下载APP</font></a>
				
				
				<div style="float: right">
					<!-- 如果没有登录则显示登录注册按钮 -->
					<c:if test="${null==sessionScope.user}">

						<button type="button" onclick="reg()" class="btn btn-link btn-sm"
							data-toggle="modal" data-target="#exampleModal">
							<font color="white">注册</font>
						</button>
						<button type="button" onclick="login()"
							class="btn btn-link btn-sm" data-toggle="modal"
							data-target="#exampleModal">
							<font color="white">登录</font>
						</button>
					</c:if>
					<c:if test="${null!=sessionScope.user}">
						<%-- 	<font color="white">${sessionScope.user.username }</font>
						<button type="button" onclick="logout()"
							class="btn btn-link btn-sm" data-toggle="modal"
							data-target="#exampleModal">
							<font color="white">注销</font>
						</button> --%>
						<div class="btn-group dropleft">
							<button type="button"
								class="btn btn-sm btn-secondary dropdown-toggle" style="background: #222222;border: 0px;padding-bottom: 0px"
								data-toggle="dropdown" aria-haspopup="true"
								aria-expanded="false">${sessionScope.user.username }</button>
							<div class="dropdown-menu">
									<a class="dropdown-item" href="/my">个人中心</a></a>
									 <a	class="dropdown-item" href="/passport/logout">注销</a> 
							</div>
						</div>


					</c:if>
				
				
			</div>

		</div>


	

		<div class="row" style="margin-top: 5px">
			<!-- 左侧栏目菜单 -->
			<div class="col-md-2">
				<ul>
					<li><a class="channel-item" href="#"><img
							src="/resource/images/wb.png" height="27" width="108" style="display:block" >
					</a></li>

					<li><a class="channel-item ${article.channelId==null?"
						active":"" }" href="/?hot=1" >热点文章</a></li>
					<c:forEach items="${channels}" var="channel">
						<li><a class="channel-item  ${article.channelId==channel.id?"
							active":"" }" href="/?channelId=${channel.id }" style="font-family: '楷体';font-weight: bold;color: white;font-size: 20px">${channel.name }</a></li>
					</c:forEach>

				</ul>


			</div>
			<!-- 中间区域 -->
			<div class="col-md-7" >
				<!--如果热点不空则显示热点 -->
				<c:if test="${article.channelId==null}">

					<!-- 广告 -->

					<div id="carouselExampleCaptions" class="carousel slide"
						data-ride="carousel">
						<ol class="carousel-indicators">
						  <c:forEach items="${slides}" var="slide" varStatus="i">
							<li data-target="#carouselExampleCaptions" data-slide-to="${i.index }"
								class="${i.index==0?"active":"" }"></li>
							</c:forEach>
							
						</ol>
						<div class="carousel-inner" >
						  <c:forEach items="${slides}" var="slide" varStatus="i">
							<div class="carousel-item ${i.index==0?"active":"" }">
								<img src="/pic/${slide.url }" 
								class="d-block w-100 rounded" alt="..." width="1110px" height="400"">
								<div class="carousel-caption d-none d-md-block">
									<h5>${slide.title }</h5>
								</div>
							</div>
							</c:forEach>
						</div>
						<a class="carousel-control-prev" href="#carouselExampleCaptions"
							role="button" data-slide="prev"> <span
							class="carousel-control-prev-icon" aria-hidden="true"></span> <span
							class="sr-only">Previous</span>
						</a> <a class="carousel-control-next" href="#carouselExampleCaptions"
							role="button" data-slide="next"> <span
							class="carousel-control-next-icon" aria-hidden="true"></span> <span
							class="sr-only">Next</span>
						</a>
					</div>




				<div style="padding-top: 15px">
				<c:forEach items="${pg.list}" var="article">
						<div class="media">
							<img src="/pic/${article.picture}"
								class="align-self-center mr-3 rounded" alt="..." width="156px"
								height="101.8">
							<div class="media-body">
								<h5 class="mt-0">
									<a href="/articleDetail?id=${article.id }" target="_blank" style="font-family: '楷体';font-weight: bold;color: white">${article.title }</a>
								</h5>
								<p style="color: white">${article.summary }</p>
								<p style="font-family: '楷体';font-weight: bold;color: white">
									<fmt:formatDate value="${article.created }"
										pattern="yyyy-MM-dd HH:mm:ss"/>
									0 评论
								</p>
							</div>
						</div>
						<hr>
					</c:forEach>
				
				</div>


					
					<jsp:include page="/WEB-INF/view/common/page.jsp"></jsp:include>

				</c:if>
				<!-- 如果热点为空则显示分类文章 -->
				<c:if test="${article.channelId!=null}">

					<!-- 栏目下分类菜单 -->
					<div class="subchannel">
						<ul class="sub-list" style="width: 660px;">
							<li class="sub-item ${article.categoryId==null?"sub-selected":"" }"><a
								href="/?channelId=${article.channelId}">全部</a></li>
							<c:forEach items="${categorys}" var="category">

								<li class="sub-item ${article.categoryId==category.id?"sub-selected":"" }"><a
									href="/?channelId=${article.channelId}&categoryId=${category.id}" >${category.name }</a></li>
							</c:forEach>

						</ul>
						<hr>

					</div>
					<!-- 分类文章 -->
					<div>
						<c:forEach items="${pg.list}" var="article">
							<div class="media">
								<img src="/pic/${article.picture}"
									class="align-self-center mr-3 rounded" alt="..." width="156px"
									height="101.8">
								<div class="media-body">
									<h5 class="mt-0">
										<a href="/articleDetail?id=${article.id }" target="_blank" style="">${article.title }</a>
									</h5>
									<p> ${article.summary }</p>
									<p>
										<fmt:formatDate value="${article.created }"
											pattern="yyyy-MM-dd HH:mm:ss" />
										0 评论
									</p>
								</div>
							</div>
							<hr>
						</c:forEach>
						<jsp:include page="/WEB-INF/view/common/page.jsp"></jsp:include>
					</div>

				</c:if>

			</div>
			 <!-- 右侧区域 -->
			<div class="col-md-3">


				<div  style="width: 18rem;background-image:url(/resource/images/i.jpg)">
					 <div class="card-header" style="text-align: center;color: red;font-family: '楷体';font-weight: bold ">最新文章</div>
					<div class="card-body">
						<c:forEach items="${lastInfo.list}" var="lastArticle">
							<ul class="list-unstyled">
								<li class="media"><img src="/pic/${lastArticle.picture }"
									class="mr-3" alt="..." width="60" height="60">
									<div class="media-body">
										<p style="font-size: 14px" >
											<a href="/articleDetail?id=${lastArticle.id}" target="_blank" style="color: red;font-family: '楷体';font-weight: bold">${lastArticle.title }</a>
										</p>
									</div></li>

							</ul>
							<hr>
						</c:forEach>
						
					</div>
		

				</div>

			<div  style="width: 18rem;background-image:url(/resource/images/i.jpg)">
					 <div class="card-header" style="text-align: center;color: red;font-family: '楷体';font-weight: bold ">24小时热文</div>
					<div class="card-body">
						<c:forEach items="${hot24ArticleInfo.list}" var="hot24Article">
							<ul class="list-unstyled">
								<li class="media"><img src="/pic/${hot24Article.picture }"
									class="mr-3" alt="..." width="60" height="60">
									<div class="media-body">
										<p style="font-size: 14px" >
											<a href="/articleDetail?id=${hot24Article.id}" target="_blank" style="color: red;font-family: '楷体';font-weight: bold">${hot24Article.title }</a>
										</p>
									</div></li>

							</ul>
							<hr>
						</c:forEach>
						
					</div>
		

				</div>

	

			</div>
			

			</div>
		

		</div>

	
	</div> 
	
	
	
	
	<script type="text/javascript">
		function goPage(page) {
			var channelId = '${article.channelId}';
			var categoryId = '${article.categoryId}';
			location.href = "/?page=" + page + "&channelId=" + channelId
					+ "&categoryId=" + categoryId
		}
		
		
		
		//注册

		function reg() {
			/* $("#myTitle").text("用户注册");
			$("#myModal").load("/passport/reg"); */
			location.href = "/passport/reg";
		}

		//登录
		function login() {
			location.href = "/passport/login";
		}

		//注销
		function logout() {
			location.href = "/passport/logout";
		}
		
		
		
		
		
		
		
		
	</script>







































</body>
</html>