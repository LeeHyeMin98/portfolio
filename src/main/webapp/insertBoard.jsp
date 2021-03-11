<%@page contentType="text/html; charset=EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>���۵��</title>
<link rel="stylesheet" href="../../resources/css/insertBoard.css?ver=134"/>
<link href="https://fonts.googleapis.com/css?family=Nanum+Gothic&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Nanum+Brush+Script&display=swap" rel="stylesheet">
</head>
<body>		
<div id="header"> 
  <nav>
      <ul id="hd"> 
        <li> 
        <a href="main.jsp" class="headera">Home</a>
      </li>
      <li class="dropdown" style="z-index:1000" id="dd">
        <a href="YouthCenterPolicy.jsp" class="headera">���� Ȯ��</a>
      </li>
      <li>
        <a href="duePolicyList.jsp" class="headera">���� ���� ����</a>       
      </li>
      <li>
        <a href="recommendPolicy.jsp" class="headera">��õ ����</a>
      </li>
       <li>
        <a href="list.do" class="headera">�Խ���</a>
      </li>  
      <li>
        <a href="userpage.do" class="headera">������</a>
      </li>
       <li>
        <a href="logout.do" class="headera">�α׾ƿ�</a>
      </li>
    </ul>
  </nav>
</div>
<div class="boardnav">
  <p class="title"><a href="main.jsp" class="page">3P Helper</a></p>
	<div class= "boardsearch" style="float:center">
<!-- �˻� ���� -->
		<form action="getBoardList.jsp" method="post">
			<table cellpadding="0" cellspacing="0" width="700">
				<tr>
					<td align="right" class="searchline"><select name="searchCondition">
							<option value="TITLE" <c:out value="${map.searchOption=='title'?'selected' :'' }"/>>����</option>
							<option value="CONTENT" <c:out value="${map.searchOption=='content'?'selected' :'' }"/>>����</option>
					</select> <input name="searchKeyword" type="search" size=60 class="searchbar"  value="${map.keyword}"/>
					<input type="submit" value="�˻�" class="button1"/></td>
				</tr>
			</table>
		</form>
		<!-- �˻� ���� -->
    </div>
</div>

<div class="bar">
  <div class="barcontent">
  <a href="main.jsp" class="home">home </a> > <a href="list.do" class="board"> �Խ��� </a> > �Խñ� �ۼ�
  </div>
</div>
 <br>
<div class="list">
 �Խñ� �ۼ�
   <a href="list.do" class="boardl">�۸��</a>
  <hr class="listhr"></hr>
		<form action="insertBoard.do" method="post" enctype="multipart/form-data">
			<table cellpadding="0" cellspacing="0" class="writetable" width="700">
				<tr>
					<td width="70" algin="center" class="column">����  :</td>
					<td align="left"><input type="text" name="title" class="writetitle"/></td>
				</tr>

				<tr>
					<td class="column">�ۼ���  :</td>
					<td align="left"><input type="text" name="writer" class="writewr"  size="10" value=${sessionScope.uname}></td>
<!--  				 <tr>
					<td bgcolor="orange">�ۼ���</td>
					<td align="left"><input type="text" name="uname" size="10" /></td>
				</tr>   -->
				<tr>
					<td class="column">����  :</td>
					<td align="left"><textarea name="content" cols="82" rows="20" class="textarea"></textarea></td>
				</tr>
				<tr>
					<td width="70" class="column">���ε�  :</td>
          <td align="left">
					<input type="file" name="uploadFile" class="upload"/></td>
				</tr>
				<tr>
					<td colspan="2" align="center"><input type="submit" value=" ���� ��� " class="insertbutton"/></td>
				</tr>
			</table>
		</form>
</div>
</body>
</html>