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
		if(confirm("���� �Ǽ̽��ϴ�.")==true){
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
        <a href="">���� Ȯ��</a>     
      </li>
      <li>
        <a href="">���� ���� ����</a>       
      </li>
      <li>
        <a href="">�Խ���</a>
      </li>
      <li>
        <a href="">����</a>
      </li>
      <li>
        <a href="">������</a>
      </li> 
    </ul>
  </nav>
</div>
<div class="boardnav">
  <p class="title"><a href="#" class="page">Ȩ������</a></p>
</div>

<div class="bar">
  <div class="barcontent">
  <a href="#" class="home">home </a> > �� ����
  </div>
</div>
 <br>
<div class="list">
 �� ����
  <hr class="listhr"></hr>
  		 <form name="form1" method="get" class="form">
			<table class="usertable" cellpadding="0" cellspacing="0" width= 700px;>
				<tr class="infotabname" height=30px>
					<td class="column1">�̸�</td>
					<td class="con"><input type="text" name="uname" size="10" class="infoset" value="${user.uname}" readonly = "readonly"/></td>
        		</tr>
        		<tr class="infotab" height=30px>
          			<td class="column1">��й�ȣ</td>
          			<td class="con"><input type="password" name="upw" size="10" class="infoset" value="${user.upw}"/></td>
        		</tr>
         		<tr class="infotab" height=30px>
          			<td class="column1">�̸���</td>
          			<td class="con"><input type="email" name="uemail" size="15" class="infoset" value="${user.uemail}"/></td>
        		</tr>
         		<tr class="infotab" height=30px>
          			<td class="column1">����</td>
          			<td class="con"><input type="number" name="uage" size="10" class="infoset2" value="${user.uage}"/></td>
        		</tr>
         		<tr class="infotab" height=30px>
          			<td class="column1">���� ����</td>
          			<td class="con"><input type="checkbox" id="checkb_btn1" name="ujob" value="${user.ujob}"></td>
        		</tr>
        	</table>
		</form>
<!--     <div class="buttonpa">
      <input type="button" value="����" id="btnUpdate">
      <input tytpe="button" value="������ �̵�" id="btnpage">
    </div> -->
    <div>
      <button type="button" id="btnupdatepage" onClick="btnupdatepage()" class="updatebutton">����</button>
      <div style="color : red;">${message}</div>
    </div>
</div>
<br>
<br>
</body>
</html>