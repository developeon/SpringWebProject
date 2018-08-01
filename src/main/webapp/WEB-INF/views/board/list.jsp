<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>게시글 목록</title>
	<%@ include file="../include/member_header.jsp" %>
	<script type="text/javascript">
	    $(document).ready(function(){
	        $("#btnWrite").click(function(){
	            location.href = "${path}/board/write.do";
	        });
	    });
	    
	    function list(page){
	    	location.href="${path}/board/list.do?curPage="+page+"&searchOption=${map.seachOption}"+"&keyword=${map.keyword}";
	    }
	</script>
</head>
<body>
    <div class="container">
		<div style="text-align: right;">총 : ${map.count}개</div>
		<table class="table table-bordered table-hover" style="text-align:center;border:1px solid #dddddd">
	    	<thead>
	    		<tr>
	    			<td colspan="5">자유 게시판</td>
	    		</tr>
	    		<tr>
	    			<th style="background-color: #fafafa; color:#000000; width:70px"><h5>번호</h5></th>
	    			<th style="background-color: #fafafa; color:#000000;"><h5>제목</h5></th>
	    			<th style="background-color: #fafafa; color:#000000;"><h5>이름</h5></th>
	    			<th style="background-color: #fafafa; color:#000000;"><h5>작성일</h5></th>
	    			<th style="background-color: #fafafa; color:#000000;"><h5>조회수</h5></th>
	    		</tr>
	    	</thead>
	    	<tbody>
	    	<c:forEach var="row" items="${map.list}">
		        <tr>
		        	<td>
		        		${row.bno}
		        	</td>
		            <td> 
		            	<a href="${path}/board/view.do?bno=${row.bno }&curPage=${map.boardPager.curPage }&searchOption=${map.searchOption }&keyword=${map.keyword }">
		               		${row.title} 
		               		<c:if test="${row.recnt > 0}">
		               			<span style="color:red;">(${row.recnt})</span>
		               		</c:if>
		               </a> 
		            </td>                    
		            <td>
		            	${row.userName}
		            </td>
		            <td>
		             <fmt:formatDate value="${row.regdate}" pattern="yyyy-MM-dd HH:mm:ss"/>
		            </td>
		            <td>
		            	${row.viewcnt}
		            </td>
		        </tr>    
		     </c:forEach>
		     	<tr>
		        	<td colspan="5">
		            	<c:if test="${map.boardPager.curBlock>1}"> 
		            		<a href="javascript:list('1')">[처음 ]</a>
		            	</c:if>
		           	    <c:if test="${map.boardPager.curBlock>1 }">
		            		<a href="javascript:list('${map.boardPager.prevPage }')">[이전]</a>
		                </c:if>
		           		<c:forEach var="num" begin="${map.boardPager.blockBegin}" end="${map.boardPager.blockEnd}">
		       		   		<c:choose>
		         		 		<c:when test="${num==map.boardPager.curPage}">
		           		    		<span style="color:red"> ${num}</span> <!-- 색상변경 -->
		         				</c:when>
		         				<c:otherwise>
		           					<a href="javascript:list('${num}')"> |  ${num} | </a> &nbsp;
		        				</c:otherwise>        
		       				</c:choose>
		      		  	</c:forEach>  
		          		<!--  다음 페이지  -->
		       		 	<c:if test="${map.boardPager.curBlock <= map.boardPager.totBlock}">
		        			<a href="javascript:list('${map.boardPager.nextPage}')"> [다음] </a>
		        		</c:if>
		   	            <!--  끝 페이지  -->
		        	    <c:if test="${map.boardPager.curPage<=map.boardPager.totPage}">
		        			<a href="javascript:list('${map.boardPager.totPage}')"> [끝] </a>
		      			</c:if>
		            </td>
		        </tr>
		        <c:if test="${sessionScope.userId !=null }">
		        <tr>
		        	<td>
		        		  <button type="button" class="btn btn-primary pull-right" id="btnWrite">글쓰기</button>
		        	</td>
		        </tr>
		        </c:if>
	    	</tbody>   
	    </table>
	    
	    <form name="form1" method="post" action="${path}/board/list.do">
			<div class="form-group">
				<select class="form-control" name="searchOption">
					<option value="all" <c:out value="${map.searchOption == 'all'?'selected':''}"/> >제목+이름+제목</option>
           		    <option value="writer" <c:out value="${map.searchOption == 'writer'?'selected':''}"/> >이름</option>
            		<option value="content" <c:out value="${map.searchOption == 'content'?'selected':''}"/> >내용</option>
            		<option value="title" <c:out value="${map.searchOption == 'title'?'selected':''}"/> >제목</option>
				</select>
			</div>
			<div class="input-group input-group-sm">
		    	<input type="text" class="form-control" name="keyword" placeholder="Search" value="${map.keyword}">
			    <div class="input-group-btn">
			        <button class="btn btn-default" type="submit"><i class="glyphicon glyphicon-search"></i></button>
			    </div>
		    </div>
  		</form>
    </div>
</body>
</html>
