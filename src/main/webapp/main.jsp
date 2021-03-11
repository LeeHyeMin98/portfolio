<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="./main.css?ver=1.4"/>
<link href="https://fonts.googleapis.com/css?family=Nanum+Gothic&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Nanum+Brush+Script&display=swap" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<head>
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
    </ul>
    <a href="userpage.do" id="user">
      <img src="../../resources/img/people.png" width="50px" height="40px">
    </a>
<!--      <li>
        <a href="logout.do" class="headera">로그아웃</a>
      </li> -->
  </nav>
<br>
  <div class="logo">
    <a href="#">3P Helper</a>
  <br>
  </div>
  <div class="sc">
     <input class="q" name="q" placeholder="  Search..." type="search" size=80>
     <input type="submit" value="검색" class="button1"/>
  </div>
</div>
<div>

  
  <!-- //cont_nav -->
            
            <div id="cont_tit">
             <div class="container">
                <div class="tit">
                    
                </div>
             </div>
            </div>
<!-- 슬라이드 --> 
<!-- 최신 -->
<div class="section">
	<input type="radio" name="slide" id="slide01" checked>
	<input type="radio" name="slide" id="slide02">
	<input type="radio" name="slide" id="slide03">
	<div class="slidewrap">
		<ul class="slidelist">
			<li>
				<a>
					<img src="../../resources/img/slide01.png">
				</a>
			</li>
			<li>
				<a>
					<img src="../../resources/img/slide02.png">
				</a>
			</li>
			<li>
				<a>
					<img src="../../resources/img/slide03.png">
				</a>
			</li>
		</ul>

		<div class="slide-control">
			<div class="control01">
				<label for="slide03" class="left"></label>
				<label for="slide02" class="right"></label>
			</div>
			<div class="control02">
				<label for="slide01" class="left"></label>
				<label for="slide03" class="right"></label>
			</div>
			<div class="control03">
				<label for="slide02" class="left"></label>
				<label for="slide01" class="right"></label>
			</div>
		</div>
	</div>
</div>

<!-- 동영상 -->
<!-- <video width="800px" id="video" height="600px" src="sample.mp4" controls autoplay muted>
  </video>-->
<p align="middle">  
<iframe width="560" height="500"
style="width:80%" id="video"src="https://www.youtube.com/embed/oWlytuJ0e7w" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen ></iframe>
</p>


</body>
</html>