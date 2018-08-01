<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!-- context 경로 -->
<c:set var="path" value="${pageContext.request.contextPath}"/>
<head>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<link rel="stylesheet" href="resources/css/bootstrap.css">
	<link rel="stylesheet" href="resources/css/custom.css">
	<title>와글와글</title>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script src="resources/js/bootstrap.js"></script>
</head>
<body>
	<nav class="navbar navbar-default">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle collapsed"
				data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"
				aria-expanded="false">
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
			</button>
			<a class="navbar-brand" href="${path}/">와글와글</a>
		</div>
		<div class="collpase navbar-collapse" id ="bs-example-navbar-collapse-1">
			<ul class="nav navbar-nav navbar-right">
				<li class="dropdown">
					<c:choose>
      			   		<c:when test="${sessionScope.userId != null}">
      			   			<a href="#" class="dropdown-toggle"
							data-toggle="dropdown" role="button" aria-haspopup="ture"
							aria-expanded="false">${sessionScope.userName}<span class="caret"></span></a>
							<ul class="dropdown-menu">
								<li class="active"><a href="${path}/">메인</a></li>
								<li><a href="board/list.do">게시판</a></li>
								<li><a href="login/logout.do">로그아웃</a></li>
							</ul>
     					</c:when>
       		 			<c:otherwise>
	       		 			<a href="#" class="dropdown-toggle"
							data-toggle="dropdown" role="button" aria-haspopup="ture"
							aria-expanded="false">접속하기<span class="caret"></span></a>
							<ul class="dropdown-menu">
								<li class="active"><a href="${path}/">메인</a></li>
								<li><a href="board/list.do">게시판</a></li>
								<li><a href="login/login.do">로그인</a></li>
								<li><a href="member/write.do">회원가입</a></li>
							</ul>
			       	 	</c:otherwise>
   					</c:choose>
				</li>
			</ul>
		</div>
	</nav>
	
<!-- <a href="board/write.do">게시판</a>
<a href="member/list.do">목록</a> -->
</body>
</html>