<%@page contentType="text/html; charset=EUC-KR" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> <!--  안될 때-->
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="EUC-KR">
<link rel="stylesheet" href="../../resources/css/replyList.css?ver=0.4"/>
</head>
<body>
	  <center>
	<table style="width:700px; text-align:left;" class="replytab">
		<c:forEach var="reply" items="${list}">
			<tr>
				<td class="replytd">
					<p class="replyp">${reply.uname}(<fmt:formatDate value="${reply.regdate}" pattern="yyyy-MM-dd a HH:mm:ss"/>)</p>
     		     	<br>
     		     	<br>
					<hr class="replyhr">
					<br>
        		    <text>${reply.replytext}</text>
				</td>
			</tr>
			</c:forEach>
			<!-- 페이징 처리 -->
			<tr>
				<td>
				<center>
					<!-- 처음 페이지로 이동: 현재 페이지가 1보다 크면 [처음]하이퍼 링크를 화면에 출력 -->
					<c:if test="${replyPager.curBlock >1 }">
						<a href="javascript:list('1')" class="replya">[처음]</a>
					</c:if>
					
					<!-- 이전페이지 블록으로 이동 -->
					<c:if test="${replyPager.curBlock >1}">
						<a href="javascript:list('${replyPager.prevPage}')" class="replya">[이전]</a>
					</c:if>
					
					<!-- 하나의 블럭에서 반복문 수행 시작 페이지 부터 끝 페이지까지 -->
					<c:forEach var="ROWNUMBER" begin="${replyPager.blockBegin}" end="${replyPager.blockEnd}">
						<!-- 현재 페이지이면 하이퍼링크 제거 -->
						<c:choose>
							<c:when test="${ROWNUMBER ==replyPager.curPage}">
								<span class="replyspan">${ROWNUMBER}</span>&nbsp;
							</c:when>
							<c:otherwise>
								<a href="javascript:listReply('${ROWNUMBER}')" class="replya`">${ROWNUMBER}</a>&nbsp;
							</c:otherwise>
						</c:choose>
					</c:forEach>
					
					<!-- 다음 페이지 블록으로 이동 -->
					<c:if test="${replyPager.curBlock <= replyPager.totBlock}">
						<a href="javascript:listReply('${replyPager.nextPage}')" class="replya`">[다음]</a>
					</c:if>
					
					<!-- 끝페이지로 이동 -->
					<c:if test="${replyPager.curPage <= replyPager.totPage}">
						<a href="javascript:listReply('${replyPager.totPage}')" class="replya`">[끝]</a>
					</c:if>
				</td> 
			</tr>
			
		</table>
  </center>
<br>
<br>
</body>
</html>