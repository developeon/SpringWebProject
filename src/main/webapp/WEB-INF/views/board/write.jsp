<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>게시글 작성</title>
	<%@ include file="../include/member_header.jsp" %>
	<%@ include file="../include/sessionCheck.jsp" %>
	<script>
	    $(document).ready(function(){
	        $("#btnSave").click(function(){
	            
	            var title = $("#title").val();
	            var content = $("#content").val();
	          //  var writer = $("#writer").val();
	            if(title == ""){
	                alert("제목을 입력하세요");
	                document.form1.title.focus();
	                return;
	            }
	            if(content == ""){
	                alert("내용을 입력하세요");
	                document.form1.content.focus();
	                return;
	            }
	            document.form1.submit();
	        });
	    });
	</script>
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
      				<a href="#" class="dropdown-toggle"
      					data-toggle="dropdown" role="button" aria-haspopup="ture"
						aria-expanded="false">${sessionScope.userName}<span class="caret"></span></a>
					<ul class="dropdown-menu">
						<li><a href="${path}/">메인</a></li>
						<li class="active"><a href="../board/list.do">게시판</a></li>
						<li><a href="login/logout.do">로그아웃</a></li>
					</ul>
				</li>
			</ul>
		</div>
	</nav>
	
    <div class="container">
    	<form name="form1" method="post" action="${path}/board/insert.do">
			<table class="table table-bordered table-hover" style="text-align:center;border:1px solid #dddddd">
		    	<thead>
		    		<tr>
		    			<td colspan="3"><h4>게시물 작성</h4></td>
		    		</tr>
		    	</thead>
		    	<tbody>
		    		<tr>
		    			<td style="width: 110px;"><h5>제목</h5></td>
		    			<td><input class="form-control" name="title" id="title" maxlength="50" placeholder="제목을 입력해주세요."></td>
		    		</tr>
		    		<tr>
		    			<td style="width: 110px;"><h5>내용</h5></td>
		    			<td><textarea class="form-control" name="content" id="content" rows="10" maxlength="2048" placeholder="내용을 입력해주세요."></textarea></td>
		    		</tr>
		    		<tr>
		    			<td colspan="5">
		    				<button type="button" class="btn btn-primary pull-right" id="btnSave">확인</button>
		        		</td>
		    		</tr>
		    	</tbody>
			</table>
		</form>
	</div>
</body>
</html>
