<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<link rel="stylesheet" href="../../resources/css/find_form.css"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<div class="find-page">
  <div class="form">
      <form class="find-form" action="${pageContext.request.contextPath}"/>
      <input type="text" placeholder="�̸�"/>
      <input type="email" placeholder="email"/>
      <button type="submit">��й�ȣ ���� �̸��� �߼�</button>
      <p class="login_m">�α����ϱ� <a href="login_form.do">Sign In</a></p>
    </form>
  </div> 
</div>
</body>
</html>