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
<script type="text/javascript" src="${pageContext.request.contextPath}/resource/js/jquery-3.2.1.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>
<body class="container">

	<div>
		<form id="form1">
			用户名:<input type="text" name="username" value="${user.username }">
			状态：<select name="locked">
				<option value="" ${user.locked==""?"selected":"" }>全部</option>
				<option value="0" ${user.locked=="0"?"selected":"" }>正常</option>
				<option value="1" ${user.locked=="1"?"selected":"" }>禁用</option>

			</select>
			<button type="button" onclick="query()" class="btn btn-warning">查询</button>

		</form>

	</div>

	<table class="table table-hover table-striped table-bordered" style="text-align: center;width: 1400px">
		<tr>
			<td>编号</td>
			<td>用户名</td>
			<td>性别</td>
			<td>生日</td>
			<td>注册日期</td>
			<td>用户状态</td>
		</tr>
		<c:forEach items="${pg.list }" var="li" varStatus="i">
			<tr>
				<td>${i.count }</td>
				<td>${li.username }</td>
				<td>${li.gender=="1"?"男":"女" }</td>
				<td><fmt:formatDate value="${li.birthday }" pattern="yyyy-MM-dd"/> </td>
				<td><fmt:formatDate value="${li.created }" pattern="yyyy-MM-dd HH:mm:ss"/> </td>
				<td>
				  <c:if test="${li.locked==0}">
				  <button type="button" class="btn btn-success" onclick="update(this,${li.id})">正常</button>
				  </c:if>
				  
				  <c:if test="${li.locked==1}">
				  <button type="button" class="btn btn-danger" onclick="update(this,${li.id})">禁用</button>
				  </c:if>
				</td>
			</tr>
		</c:forEach>
		<tr>
			<td>
				<jsp:include page="/WEB-INF/view/common/page.jsp"></jsp:include>
			</td>
		</tr>
	</table>



	<script type="text/javascript">
	function query() {
		$("#center").load("/admin/user/users?" + $("#form1").serialize())
	}
	//翻页
	function goPage(page) {
		$("#center").load("/admin/user/users?page=" + page + "&" + $("#form1").serialize());

	}
	
	
	function update(obj,id){
		//0：正常  1： 禁用
		var locked=$(obj).text()=="禁用"?"0":"1";
	$.post("/admin/user/update",{id:id,locked:locked},function(flag){
		if(flag){
			$(obj).text($(obj).text()=="禁用"?"正常":"禁用");//改变按钮的内容
			//alert($(obj).text())
			$(obj).attr("class",$(obj).text()=="禁用"?"btn btn-danger":"btn btn-success");//改变按钮的颜色
		}
	})
	
}
	</script>

































</body>
</html>