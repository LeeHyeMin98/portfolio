<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<link href="https://fonts.googleapis.com/css?family=Nanum+Gothic&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Nanum+Brush+Script&display=swap" rel="stylesheet">
<link rel="stylesheet" href="../../resources/css/userpage.css?ver=0.1"/>
<script src="https://code.jquery.com/jquery-3.5.1.js"> </script>
<meta charset="EUC-KR">
<title>Insert title here</title>
<script>
//location.reload();
$(document).ready(function() {
	$("#btnupdatepage").click(function() {
		var upw=$("#upw").val();
		var uemail=$("#uemail").val();
		var uage=$("#uage").val();
		var ujob=$("#ujob").val();
		document.form1.action = "${path}/userpage.do";
		document.form1.submit();
		if(confirm("수정 되셨습니다.")==true){
			console.log("1");
			//location.reload();
		}
		else{
			window.location.reload();
			console.log("2");

		}
		});
	
	$("#btnpage").click(function() {
		location.href="${path}/userpage.do";
	});
});
	
</script>
</head>
<body>
<div id="header"> 
  <nav>
      <ul id="hd"> 
      <li>
        <a href="">Home</a>
      </li>
      <li>
        <a href="">제도 확인</a>     
      </li>
      <li>
        <a href="">마감 예정 제도</a>       
      </li>
      <li>
        <a href="">게시판</a>
      </li>
      <li>
        <a href="">문의</a>
      </li>
      <li>
        <a href="">내정보</a>
      </li> 
    </ul>
  </nav>
</div>
<div class="boardnav">
  <p class="title"><a href="#" class="page">홈페이지</a></p>
</div>

<div class="bar">
  <div class="barcontent">
  <a href="#" class="home">home </a> > 내 정보
  </div>
</div>
 <br>
<div class="list">
 내 정보
  <hr class="listhr"></hr>
  		 <form name="form1" method="get" class="form">
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
          			<td class="con"><input type="email" name="uemail" size="15" class="infoset" value="${user.uemail}"/></td>
        		</tr>
         		<tr class="infotab" height=30px>
          			<td class="column1">나이</td>
          			<td class="con"><input type="number" name="uage" size="10" class="infoset2" value="${user.uage}"/></td>
        		</tr>
         		<tr class="infotab" height=30px>
          			<td class="column1">재직 유무</td>
          			<td class="con"><input type="checkbox" id="checkb_btn1" name="ujob" value="${user.ujob}"></td>
        		</tr>
        	</table>
		</form>
<!--     <div class="buttonpa">
      <input type="button" value="수정" id="btnUpdate">
      <input tytpe="button" value="페이지 이동" id="btnpage">
    </div> -->
    <div>
      <button type="button" id="btnupdatepage" onClick="btnupdatepage()" class="updatebutton">수정</button>
      <div style="color : red;">${message}</div>
    </div>
</div>
<br>
<br>
</body>
</html>