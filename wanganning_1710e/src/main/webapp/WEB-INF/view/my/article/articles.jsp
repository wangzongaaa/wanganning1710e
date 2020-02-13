<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@  taglib prefix="fmt"  uri="http://java.sun.com/jsp/jstl/fmt"   %>
	<%@  taglib prefix="form" uri="http://www.springframework.org/tags/form" %>   
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<!-- 引入 css -->
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resource/css/bootstrap.css">
<!-- 引入js -->
<script type="text/javascript" src="/resource/js/bootstrap.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resource/js/jquery-3.2.1.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>
<body>
	<div class="container">
     <div class="form-inline" style="background-color: #a34bc5;width: 150px;border-radius:50%">
		<div class="form-check">
			<input type="radio" class="form-check-input" name="status" value="0" 
				id="ck0"><label class="form-check-label" for="ck0">待审</label>
		</div>
		<div class="form-check">
			<input type="radio" class="form-check-input" name="status" value="1"
				id="ck1"><label class="form-check-label" for="ck1">已审</label>
		</div>
		<div class="form-check">
			<input type="radio" class="form-check-input" name="status" value="9"
				id="ck9"><label class="form-check-label" for="ck9">驳回</label>
		</div>
		<!-- <div>
			<button class="btn btn-primary" type="button" onclick="query()">查询</button>
		</div> -->
		
		</div>
		<hr>
    
	<c:forEach items="${pg.list}" var="article">
		<div class="media">
			<img src="/pic/${article.picture}"
				class="align-self-center mr-3 rounded" alt="..." width="156px"
				height="101.8">
			<div class="media-body">
				<h5 class="mt-0" style="font-weight: bold;font-family: '楷体';color: white">${article.title }
					
				</h5>
				<button type="button" class="btn btn-link"  style="float: right"
						onclick="articleDetail(${article.id })" data-toggle="modal"
						data-target="#exampleModalLong">详情</button>
				
				<p style="color: white">${article.summary }</p>
				<p style="color: white">
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


	<!-- Modal -->
	<div class="modal fade" id="exampleModalLong" tabindex="-1"
		role="dialog" aria-labelledby="exampleModalLongTitle"
		aria-hidden="true">
		<div class="modal-dialog modal-lg " role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLongTitle">
						<span id="mytitle"></span>
					</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body" id="articleConent"></div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-dismiss="modal">Close</button>
				</div>
			</div>
		</div>
	</div>



	<script type="text/javascript">
	function goPage(page){
		$("#center").load("/my/article/articles?page="+page)
	}

	function articleDetail(id){
		$.get("/my/article/select" ,{id:id},function(article){
			$("#articleConent").empty();
			$("#mytitle").append(article.title);
			$("#articleConent").append(article.content);
		})
		
	}
	$(function(){
		$("[name='status']").change(function(){
			query();
		})
	})

	function query(){
		//获取选中单选框的值
		var status=$("[name='status']:checked").val() ;  //$("[type='radio']:checked").val();
		
		$("#center").load("/my/article/articles?status="+status)
	}

	//查询条件回显
	var checked='${article.status}';

	$("[name='status'][value='"+checked+"']").prop("checked",true);

	</script>		
	
	
	
	
	
	
	
	
	
	
	
	





































</body>
</html>