<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@include file="/sessionCheck.jsp" %>
<!DOCTYPE html>
<html>
<head>
<link href="https://fonts.googleapis.com/css?family=Nanum+Gothic&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Nanum+Brush+Script&display=swap" rel="stylesheet">
<link rel="stylesheet" href="../../resources/css/userpage.css?ver=0.1"/>
<script src="https://code.jquery.com/jquery-3.5.1.js"> </script>
<meta charset="EUC-KR">
<title>내 정보</title>
<script>
console.log("1");
	$(document).ready(function(){
		
/* 		$("#btnupdatepage").click(function(){
			//페이지 주소 이동
			location.href="${path}/userpage_update.do";
		}); */
		
		
		$("#btnupdatepage").click(function() {
			var upw=$("#upw").val();
			var uemail=$("#uemail").val();
			var uage=$("#uage").val();
			var ujob=$("#ujob").val();
			document.form1.action = "${path}/userpage.do";
			var result = confirm('수정하시겠습니까?'); 
			if(result) { //yes 
				document.form1.submit();
				$("#listUser").load(window.location.href + "#listUser");
			} else { //no 
				location.href="${path}/userpage.do";
			}
			

			
/*    			if(confirm("수정되셨습니다.")){
  				location.href="${path}/userpage_update2.do";
  				//window.location.reload(true);

			}   */
  
		});
		function refreshMemList(){
			location.reload();
		}
	});
	
</script>
</head>
<body>
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
</div>

<div class="bar">
  <div class="barcontent">
  <a href="main.jsp" class="home">home </a> > 내 정보
  </div>
</div>
 <br>
<div class="list" id="listUser">
 내 정보
  <hr class="listhr"></hr>
  		 <form name=form1 action="userpage.do" method="post" class="form">
			<table class="usertable" cellpadding="0" cellspacing="0" width= 700px;>
				<tr class="infotabname" height=30px>
					<td class="column1">이름</td>
					<td class="con"><input type="text" name="uname" size="10" class="infoset" value="${user.uname}" readonly = "readonly"/></td>
        		</tr>
        		<tr class="infotab" height=30px>
          			<td class="column1">비밀번호</td>
          			<td class="con"><input type="password" name="upw" size="10" class="infoset" value="${user.upw}"/></td>
        		</tr>
         		<tr class="infotab" height=30px>
          			<td class="column1">이메일</td>
          			<td class="con"><input type="email" name="uemail" size="15" class="infoset" value="${user.uemail}" /></td>
        		</tr>
         		<tr class="infotab" height=30px>
          			<td class="column1">나이</td>
          			<td class="con"><input type="number" name="uage" size="10" class="infoset2" value="${user.uage}" /></td>
        		</tr>
         		<tr class="infotab" height=30px>
          			<td class="column1">재직 유무</td>
          			<td class="con"><input type="checkbox" id="checkb_btn1" name="ujob" value="${user.ujob}"></td>
        		</tr>
        	</table>
		</form>
    <div>
      <button type="button" id="btnupdatepage" onClick="btnupdatepage()" class="updatebutton">수정</button>
      <div style="color : red;">${message}</div>
    </div>
</div>
<br>
<br>
</body>
</html>