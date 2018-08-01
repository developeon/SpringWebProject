<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>게시글 작성</title>
<%@ include file="../include/member_header.jsp" %>
<script type="text/javascript">
    $(document).ready(function(){
    	listReply();
    	//listReply2();
    	
    	$('#btnReply').click(function(){
    		var replytext = $('#replytext').val();
    		var bno = "${dto.bno}";
    		var param = "replytext=" + replytext + "&bno=" + bno;
    		$.ajax({
    			type : 'POST',
    			url : "${path}/reply/insert.do",
    			data : param,
    			success : function(){
    				alert("댓글이 등록되었습니다.");
    				$('#replytext').val("");
    				//listReply2();
    				listReply();
    			}
    		});
    	});
    	
    	function listReply(){
    		$.ajax({
    			type : 'GET',
    			url : "${path}/reply/list.do?bno=${dto.bno}",
    			success : function(result){
    				$("#listReply").html(result);
    			}
    		});
    	}
        
    	function listReply2(){
    		$.ajax({
    			type : 'GET',
    			url : "${path}/reply/listJson.do?bno=${dto.bno}",
    			success : function(result){
    				var output = "<table>";
    				for(var i in result){
    					output += "<tr>";
    					output += "<td>" + result[i].replyer;
    					output += "(" + changeDate(result[i].regdate) + ")<br>";
    					output += result[i].replytext + "</td>";
    					output += "</tr>";
    				}
    				output += "</table>";
    				$("#listReply").html(output);
    			}
    		});
    	}	
    	
    	function changeDate(date){
    		date = new Date(parseInt(date));
    		year = date.getFullYear();
    		month = date.getMonth();
    		day = date.getDate();
    		hour = date.getHours();
    		minute = date.getMinutes();
    		second = date.getSeconds();
    		strDate = year + "-" + month + "-" + day + " " + hour + ":" + minute + ":" + second;
    		return strDate;
    	}
    
        // 게시글 삭제 버튼 클릭이벤트
        $("#btnDelete").click(function(){
            if(confirm("삭제하시겠습니까?")){
                document.form1.action = "${path}/board/delete.do";
                document.form1.submit();
            }
            
        });
        
        // 게시글 수정 버튼 클릭이벤트
        $("#btnUpdete").click(function(){
            
        });
        
        // 목록 버튼 클릭 이벤트
        $("#btnList").click(function(){
    		location.href="${path}/board/list.do?curPage=${curPage}&searchOption=${searchOption}&keyword=${keyword}";
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
					<c:choose>
      			   		<c:when test="${sessionScope.userId != null}">
      			   			<a href="#" class="dropdown-toggle"
							data-toggle="dropdown" role="button" aria-haspopup="ture"
							aria-expanded="false">${sessionScope.userName}<span class="caret"></span></a>
							<ul class="dropdown-menu">
								<li><a href="${path}/">메인</a></li>
								<li class="active"><a href="#">게시판</a></li>
								<li><a href="login/logout.do">로그아웃</a></li>
							</ul>
     					</c:when>
       		 			<c:otherwise>
	       		 			<a href="#" class="dropdown-toggle"
							data-toggle="dropdown" role="button" aria-haspopup="ture"
							aria-expanded="false">접속하기<span class="caret"></span></a>
							<ul class="dropdown-menu">
								<li><a href="${path}/">메인</a></li>
								<li class="active"><a href="#">게시판</a></li>
								<li><a href="../login/login.do">로그인</a></li>
								<li><a href="../member/write.do">회원가입</a></li>
							</ul>
			       	 	</c:otherwise>
   					</c:choose>
				</li>
			</ul>
		</div>
	</nav>
	
    <div class="container">
    	<form name="form1" method="post">
    		<input type="hidden" name="bno" value="${dto.bno}">
			<table class="table table-bordered table-hover" style="text-align:center;border:1px solid #dddddd">
				<thead>
			    	<tr>
			    		<td colspan="4"><h4>게시물 보기</h4></td>
			    		</tr>
			    </thead>
			    <tbody>
			    		<tr>
			    			<td style="width: 110px;"><h5>제목</h5></td>
			    			<td colspan="3"><h5>${dto.title}</h5></td>
			    		</tr>
			    		<tr>
			    			<td style="width: 110px;"><h5>작성자</h5></td>
			    			<td colspan="3"><h5>${dto.writer}</h5></td>
			    		</tr>
			    		<tr>
	   						<td><h5>작성일</h5></td>
			    			<td><h5><fmt:formatDate value="${dto.regdate}" pattern="yyyy-MM-dd a HH:mm:ss"/></h5></td>
			    			<td><h5>조회수</h5></td>
			    			<td><h5>${dto.viewcnt}</h5></td>
			    		</tr>
			    		<tr>
			    			<td style="width: 110px;"><h5>내용</h5></td>
			    			<td colspan="3"><h5>${dto.content}</h5></td>
			    		</tr>
			    		<c:if test="${sessionScope.userId==dto.writer }">
			    		<tr>
			    			<td colspan="4" style="text-align: right;">
			    				<button type="button" class="btn btn-primary" id="btnUpdete">수정</button>
			    				<button type="button" class="btn btn-primary" id="btnDelete">삭제</button>
			        		</td>
			    		</tr>
			    		</c:if>
			    </tbody>
			</table>
		</form>
		<div style="text-align: center;"><button type="button" class="btn btn-default" id="btnList">목록</button></div>
	</div>

	<div style="width:600px;text-align:center">
		<c:if test="${sessionScope.userId != null }">
			<textarea rows="5" cols="80" id="replytext" placeholder="댓글을 작성하세요."></textarea>
			<br>
			<button type="button" id="btnReply">댓글쓰기</button>
		</c:if>
	</div>
	<div id="listReply"></div>
















</body>
</html>
