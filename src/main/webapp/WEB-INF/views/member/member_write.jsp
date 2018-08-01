<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>회원등록 페이지</title>
	<%@ include file="../include/member_header.jsp" %>
	<script>
		function passwordCheckFunction(){
			var userPw = $('#userPw').val();
			var userPw1 = $('#userPw1').val();
			if(userPw != userPw1){
				$('#passwordCheckMessage').html('비밀번호가 서로 일치하지 않습니다.');
			}else{
				$('#passwordCheckMessage').html('');
			}
		}
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
						aria-expanded="false">접속하기<span class="caret"></span></a>
					<ul class="dropdown-menu">
						<li><a href="${path}/">메인</a></li>
						<li><a href="../board/list.do">게시판</a></li>
						<li><a href="../login/login.do">로그인</a></li>
						<li class="active"><a href="#">회원가입</a></li>
					</ul>
				</li>
			</ul>
		</div>
	</nav>
	<div class="container">
		<form name="form1" method="post" action="${path}/member/insert.do">
			<table class="table table-bordered table-hover" style="text-align:center; border: 1px solid #dddddd">
				<thead>
					<tr>
						<th colspan="3"><h4>회원 등록 양식</h4></th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td style="width: 110px"><h5>아이디</h5></td>
						<td><input type="text" class="form-control" id="userId" name="userId" maxLength="20" placeholder="아이디를 입력하세요."></td>
					</tr>
					<tr>
						<td style="width: 110px"><h5>비밀번호</h5></td>
						<td><input onkeyup="passwordCheckFunction()" type="password" class="form-control" id="userPw" name="userPw" maxLength="20" placeholder="비밀번호를 입력하세요."></td>
					</tr>
					<tr>
						<td style="width: 110px"><h5>비밀번호 확인</h5></td>
						<td><input onkeyup="passwordCheckFunction()" type="password" class="form-control" id="userPw1" name="userPw1" maxLength="20" placeholder="비밀번호 확인을 입력하세요."></td>
					</tr>
					<tr>
						<td style="width: 110px"><h5>이름</h5></td>
						<td><input type="text" class="form-control" id="userName" name="userName" maxLength="20" placeholder="이름을 입력하세요."></td>
					</tr>
					<tr>
						<td style="width: 110px"><h5>이메일</h5></td>
						<td><input type="email" class="form-control" id="userEmail" name="userEmail" maxLength="50" placeholder="이메일을 입력하세요"></td>
					</tr>
					<tr>
						<td style="text-align: left;" colspan="3">
							<h5 style="color:red;" id="passwordCheckMessage"></h5>
							<input class="btn btn-primary pull-right" type="submit"  value="회원가입">
						</td>
					</tr>
				</tbody>
			</table>
		</form>
	</div>
</body>
</html>
