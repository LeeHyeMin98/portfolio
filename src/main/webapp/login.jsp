<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<link rel="stylesheet" href="../../resources/css/login_form.css?ver=0.4"/>
<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
<script>
	$(document).ready(function(){
		$("#btnlogin").click(function(){
			var uname =$("#uname").val();
			var upw =$("#upw").val();
			if(uname==""){
				alert("���̵� �Է��ϼ���.");
				$("#uname").focus();//�Է� ��Ŀ�� �̵�
				return;
			}
			if(upw==""){
				alert("��й�ȣ�� �Է��ϼ���");
				$("#upw").focus();
				return;
			}
			//���� ������ ���� �ּ�
			document.form1.action="${path}/loginCheck.do";
			//����
			document.form1.submit();
			//document.form1.action="${path}/list.do";
		})
	})
</script>


</head>
<body>
<div class="login-page">
  <div class="form">
   <form  name = form2 class="register-form">
      <input type="text" placeholder="username" />
      <input type="password" placeholder="password" />
      <input type="email" placeholder="email"/>
      <input type="number" placeholder="age"/>
    <p>��������
       <input type="checkbox" id="checkb_btn1" name="job">
      <label for="checkb_btn1"></label> </p>
 
 <br>
      <button>create</button>
      <p class="login_m">�̹� �����ϼ̳���? <a href="login.jsp">�α���</a></p>
    </form> 

    <form name = form1 action="login.do" method="post">
      <input type="text" name="uname"  id="uname" placeholder="�̸�" value="${member.uname }"/>
      <input type="password" name="upw" id="upw" placeholder="��й�ȣ" value="${member.upw }"/>

      <button type="submit" id="btnlogin" onClick="btnlogin()" >login</button>

      
      <p class="create_m">ȸ������ �ϱ� <a href="register.jsp">Create an account</a></p>
      <p class="find_m">������ �����̳���? <a href="find_form.jsp">Find an account</a></p>
    </form> 
</div>
</div>
</body>
</html>