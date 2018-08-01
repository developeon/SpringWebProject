<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>로그인페이지</title>
	<%@ include file="../include/member_header.jsp" %>
	<script>
	    $(document).ready(function(){
	        $("#btnLogin").click(function(){
	            var userId = $("#userId").val();
	            var userPw = $("#userPw").val();
	            if(userId == ""){
	            	$("#checkContent").html("아이디를 입력하세요.");
	            	$('#checkModal').modal("show");
	                return; // 함수 종료
	            }
	            if(userPw == ""){
	            	$("#checkContent").html("비밀번호를 입력하세요.");
	            	$('#checkModal').modal("show");
	                return;
	            }
	            // 폼 내부의 데이터를 전송할 주소
	            document.form1.action="${path}/login/loginCheck.do"
	            // 제출
	            document.form1.submit();
	        });
	    });
	</script>
</head>
<body>
	<c:if test="${sessionScope.userId != null}">
	<%
		response.sendRedirect("${path}/");
	%>
	</c:if>

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
						aria-expanded="false">접속하기<span class="caret"></span></a>
					<ul class="dropdown-menu">
						<li><a href="${path}/">메인</a></li>
						<li class="active"><a href="#">로그인</a></li>
						<li><a href="../member/write.do">회원가입</a></li>
					</ul>
				</li>
			</ul>
		</div>
	</nav>
	
	<div class="container">
		<form  name="form1" method="post">
			<table class="table table-bordered table-hover" style="text-align:center; border: 1px solid #dddddd">
				<thead>
					<tr>
						<th colspan="2"><h4>로그인 양식</h4></th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td style="width: 110px"><h5>아이디</h5></td>
						<td><input type="text" class="form-control" id="userId" name="userId" maxLength="20" placeholder="아이디를 입력하세요."></td>
					</tr>
					<tr>
						<td style="width: 110px"><h5>비밀번호</h5></td>
						<td colspan="2"><input type="password" class="form-control" id="userPw" name="userPw" maxLength="20" placeholder="비밀번호를 입력하세요."></td>
					</tr>
					<tr>
						<td style="text-align: left;" colspan="2">
							<input class="btn btn-primary pull-right" type="button" id="btnLogin" value="로그인">
						</td>
						
					</tr>
				</tbody>
			</table>
		</form>
	</div>
	
	<div class="modal fade" id="checkModal" tabindex="1" role="dialog" aria-hidden="ture">
		<div class="vertical-alignment-helper">
			<div class="modal-dialog vertical-align-center">
				<div id="checkType" class="modal-content panel-warning">
					<div class="modal-header panel-heading">
						<button type="button" class="close" data-dismiss="modal">
							<span aria-hidden="true">&times;</span>
							<span class="sr-only">Close</span>
						</button>
						<h4 class="modal-title">오류메세지</h4>
					</div>
					<div id="checkMessage" class="modal-body">
						<span id = "checkContent"></span>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-primary" data-dismiss="modal">확인</button>
					</div>
				</div>
			</div>
		</div>
	</div>
	 <c:if test="${sessionScope.msg != null}">
		 <div class="modal fade" id="infoModal" tabindex="1" role="dialog" aria-hidden="ture">
			<div class="vertical-alignment-helper">
				<div class="modal-dialog vertical-align-center">
					<c:if test="${sessionScope.msg == 'failure'}">
						<div id="checkType" class="modal-content panel-danger">
					</c:if>
					<c:if test="${sessionScope.msg == 'success'}">
						<div id="checkType" class="modal-content panel-success">
					</c:if>
						<div class="modal-header panel-heading">
							<button type="button" class="close" data-dismiss="modal">
								<span aria-hidden="true">&times;</span>
								<span class="sr-only">Close</span>
							</button>
							<h4 class="modal-title"><span id = "messageType"></span></h4>
						</div>
						<div id="checkMessage" class="modal-body">
							<span id = "messageContent"></span>
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-primary" data-dismiss="modal">확인</button>
						</div>
					</div>
				</div>
			</div>
		</div>
	</c:if>
	
	<c:choose>
		<c:when test="${sessionScope.msg == 'failure'}">
			<script>
			$('#messageType').html("오류 메세지");
			$('#messageContent').html("아이디 또는 비밀번호를 다시 확인하세요.");
			$('#infoModal').modal("show");
			</script>
			<%
				session.removeAttribute("msg");
			%>
		</c:when>
		<c:when test="${sessionScope.msg== 'success'}">
			<script>
			$('#messageType').html("성공 메세지");
			$('#messageContent').html("회원가입이 완료되었습니다.");
			$('#infoModal').modal("show");
			</script>
			<%
				session.removeAttribute("msg");
			%>
		</c:when>
	</c:choose>

	
</body>
</html>
