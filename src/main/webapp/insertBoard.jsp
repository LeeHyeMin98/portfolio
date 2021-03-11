<%@page contentType="text/html; charset=EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>새글등록</title>
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
  <a href="main.jsp" class="home">home </a> > <a href="list.do" class="board"> 게시판 </a> > 게시글 작성
  </div>
</div>
 <br>
<div class="list">
 게시글 작성
   <a href="list.do" class="boardl">글목록</a>
  <hr class="listhr"></hr>
		<form action="insertBoard.do" method="post" enctype="multipart/form-data">
			<table cellpadding="0" cellspacing="0" class="writetable" width="700">
				<tr>
					<td width="70" algin="center" class="column">제목  :</td>
					<td align="left"><input type="text" name="title" class="writetitle"/></td>
				</tr>

				<tr>
					<td class="column">작성자  :</td>
					<td align="left"><input type="text" name="writer" class="writewr"  size="10" value=${sessionScope.uname}></td>
<!--  				 <tr>
					<td bgcolor="orange">작성자</td>
					<td align="left"><input type="text" name="uname" size="10" /></td>
				</tr>   -->
				<tr>
					<td class="column">내용  :</td>
					<td align="left"><textarea name="content" cols="82" rows="20" class="textarea"></textarea></td>
				</tr>
				<tr>
					<td width="70" class="column">업로드  :</td>
          <td align="left">
					<input type="file" name="uploadFile" class="upload"/></td>
				</tr>
				<tr>
					<td colspan="2" align="center"><input type="submit" value=" 새글 등록 " class="insertbutton"/></td>
				</tr>
			</table>
		</form>
</div>
</body>
</html>