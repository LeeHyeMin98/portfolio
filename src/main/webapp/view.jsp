<%@page contentType="text/html; charset=EUC-KR"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" href="../../resources/css/getBoard.css?ver=2.2"/>
<link href="https://fonts.googleapis.com/css?family=Nanum+Gothic&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Nanum+Brush+Script&display=swap" rel="stylesheet">
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>글 상세</title>
<script src="https://code.jquery.com/jquery-3.5.1.js"> </script>
</head>
<body>
<script>
console.log("2");
$(document).ready(function(){
	listReply("1");
	//listReply2();//Json 리턴 방식
	//댓글 쓰기 버튼 클릭 이벤트 (ajax 처리)
	$("#btnReply").click(function(){ 
		var replytext=$("#replytext").val();
		var seq="${board.seq}"
		var param="replytext="+replytext+"&seq="+seq;
		$.ajax({
			type: "post",
			url:"${path}/reply/insert.do",
			data: param,
			success: function(){
				alert("댓글이 등록되었습니다");
				listReply("1");
			} 
		});
		
	});
	
	//목록 버튼 클릭
	$("#btnList").click(function(){
		location.href="${path}/list.do?curPage=${curPage}&searchOption=${searchOption}&keyword=${keyword}";
	})
	$("#btnDelete").click(function(){
		if(confirm("삭제하시겠습니까?")){
			document.form1.action="${path}/deleteBoard.do";
			document.form1.submit();
		}
	});
	$("#btnUpdate").click(function(){
		var title=$("#title").val();
		var content=$("#content").val();
		document.form1.action="${path}/updateBoard.do";
		document.form1.submit();
		});
});

//Controller방식 _listReply2();-->listReply(); 선언 필요
function listReply(num){
	$.ajax({ 
		type:"get",
		url:"${path}/reply/list.do?seq=${board.seq}&curPage="+num,
		contentType: "application/json",
		success:function(result){
			//responseText가 result에 저장
			$("#listReply").html(result);
		}
	});
}  

/* 	//Json방식 now
function listReply2(){
	$.ajax({
		type:"get",
		url:"${path}/reply/listJson.do?seq=${board.seq}",
		contentType: "application/json",
		success:function(result){
			console.log(result);
			var output="<table>";
			for(var i in result){
				output += "<tr>";
				output += "<td>"+result[i].uname;
				output += "(" + changeDate(result[i].regdate)+")<br>";
				output += result[i].replytext+"</td>";
				output += "<tr>";
			}
			output += "</table>";
			//responseText가 result에 저장
			$("#listReply").html(result);
		}
	});
} */

function listReply2(){
    $.ajax({
        type: "get",
        contentType: "application/json",
        url:"${path}/reply/listJson.do?seq=${board.seq}",
        success: function(result){
            console.log(result);
            var output="<table>";
            for(var i in result){
                var repl=result[i].replytext;
                repl = repl.replace(/  /gi,"&nbsp;&nbsp;");//공백처리
                repl = repl.replace(/</gi,"&lt;"); //태그문자 처리
                repl = repl.replace(/>/gi,"&gt;");
                repl = repl.replace(/\n/gi,"<br>"); //줄바꿈 처리
                
                output += "<tr><td>"+result[i].uname;
                date = changeDate(result[i].regdate);
                output += "("+date+")";
                output += "<br>"+repl+"</td></tr>";
            }
                output+="</table>";
                $("#listReply").html(output);
        }
    });
}
//날짜 변환 함수
function changeDate(date){
	date = new Date(parseInt(date));
	year = date.getFullYear();
	month= date.getMonth();
	day=date.getDate();
	hour=date.getHours();
	minute=date.getMinutes();
	second=date.getSeconds();
	strDate =year+"-"+month+"-"+day+" "+hour+":"+minute+":"+second;
	return strDate;
}

</script>
<div id="header"> 
  <nav>
      <ul id="hd"> 
       <li> 
        <a href="main.jsp" class="headera">Home</a>
      </li>
      <li class="dropdown" style="z-index:1000" id="dd">
        <a href="YouthCenterPolicy.jsp" class="headera">제도 확인</a>
      </li>
      <li>
        <a href="duePolicyList.jsp" class="headera">마감 예정 제도</a>       
      </li>
      <li>
        <a href="recommendPolicy.jsp" class="headera">추천 제도</a>
      </li>
       <li>
        <a href="list.do" class="headera">게시판</a>
      </li>  
      <li>
        <a href="userpage.do" class="headera">내정보</a>
      </li>
       <li>
        <a href="logout.do" class="headera">로그아웃</a>
      </li>
    </ul>
  </nav>
</div>
<div class="boardnav">
  <p class="title"><a href="main.jsp" class="page">3P Helper</a></p>
	<div class= "boardsearch" style="float:center">
<!-- 검색 시작 -->
		<form action="getBoardList.jsp" method="post">
			<table cellpadding="0" cellspacing="0" width="700">
				<tr>
					<td align="right" class="searchline"><select name="searchCondition">
							<option value="TITLE" <c:out value="${map.searchOption=='title'?'selected' :'' }"/>>제목</option>
							<option value="CONTENT" <c:out value="${map.searchOption=='content'?'selected' :'' }"/>>내용</option>
					</select> <input name="searchKeyword" type="search" size=60 class="searchbar"  value="${map.keyword}"/>
					<input type="submit" value="검색" class="button1"/></td>
				</tr>
			</table>
		</form>
		<!-- 검색 종료 -->
	</div>
</div>

<div class="bar">
  <div class="barcontent">
  <a href="main.jsp" class="home">home </a> > <a href="list.do" class="board"> 게시판 </a> > 게시글 상세 보기
  </div>
</div>
 <br>
<div class="list">
 게시글 상세 보기
   <a href="insertBoard.jsp" class="write">글쓰기</a>
   <a href="list.do" class="boardl">글목록</a>
  <hr class="listhr"></hr>
  		 <form name=form1 action="view.do" method="post" class="form">
			<input name="seq" type="hidden" value="${board.seq}" />
			<table cellpadding="0" cellspacing="0" width= "700px;">
				<tr>
					<td align="left"><input name="title" type="text" value="${board.title}" class="titleinput" /></td>
        		</tr>
        		<tr class="wrcnt" height="30px">
          			<td align="left" class="wr">작성자 : ${board.writer}</td>
         			<td class="da">
          			<fmt:formatDate value="${board.regdate}" pattern="yyyy-MM-dd a HH:mm:ss"/></td>
       				<td class="cnt">조회수 : ${board.cnt}</td>
				</tr>
				<tr>
					<td align="left" colspan="3" class="cn">
						<textarea name="content" cols="103" rows="20" class="textarea">${board.content}</textarea>
					</td>
				</tr>
			</table>
		</form>
      <div class="buttonpa">
      <button type="button" id="btnUpdate" onClick="btnUpdate()" class="button3" >글 수정</button>
	  <button type="button" id="btnDelete" onClick="btnDelete()" class="button4">글 삭제</button>
    </div>
    </div>
<br>
<br>
	<hr class="replyhr1"></hr>
<br>
<br>

<div class="replydiv1">
<br>

<!-- 로그인한 회원에게만 댓글 작성-->
   <c:if test="${sessionScope.uname != null}">
     <textarea rows="5" cols="100" id="replytext" placeholder="댓글을 작성해주세요"></textarea>
            
            <br>
            <br>
            <button type="button" id="btnReply" class="button5" onClick="btnReply">댓글 작성</button>
   </c:if>
   <br>
	<div id="listReply" class="replydiv2">
	</div>
</div>


</body>
</html>
