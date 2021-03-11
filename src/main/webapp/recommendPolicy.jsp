<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ page import="java.sql.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> <!--  안될 때-->
<%@include file="/sessionCheck.jsp" %>

<%String s_age=""; String s_name=""; %>
<!DOCTYPE html>
<html>
<head>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="../../resources/css/policyList.css" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Nanum+Gothic&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Nanum+Brush+Script&display=swap" rel="stylesheet">
<meta charset="EUC-KR">
<title>Insert title here</title>

<%
  Connection conn=null;
  Statement stmt = null; // SQL구문을 실행
  ResultSet rs = null; // SQL구문의 실행결과를 저장
  
  

  try{
	 String jdbcUrl = "jdbc:mysql://localhost:3306/3phelper";
     String dbId = "root";
     String dbPass = "vlftmdtjdlfxkfcnf17!";
	
	 Class.forName("com.mysql.jdbc.Driver");
	 conn = DriverManager.getConnection(jdbcUrl,dbId ,dbPass );
	 //out.println("제대로 연결되었습니다.");
	 s_name=(String)session.getAttribute("uname");
	 if(s_name==null){
		//로그인 안했을 경우 sessionCheck 로 인해 로그인 창으로 넘어감
	 }
	 else{
		 s_name=s_name.toLowerCase();
		 //out.println(s_name);
	  	stmt= conn.createStatement();
	  	String sql ="select uage from USER WHERE uname='"+s_name+"'";
	   
	  	// 4. 쿼리 실행
	  	rs = stmt.executeQuery(sql);

	  	// 5. 쿼리 실행 결과 출력
	  	while(rs.next())
	 	 {   
	  		s_age=rs.getString("uage");
	 	 }
	 }
  }catch(SQLException ex){
      out.println(ex.getMessage());
      ex.printStackTrace();
	}finally{
      // 6. 사용한 Statement 종료
      if(rs != null) try { rs.close(); } catch(SQLException ex) {}
      if(stmt != null) try { stmt.close(); } catch(SQLException ex) {}

      // 7. 커넥션 종료
      if(conn != null) try { conn.close(); } catch(SQLException ex) {}
}
	 
	 
  %>



<script>
var s_age='<%=s_age%>';
var j = 0;
console.log("1");
  $.ajax({ 
	url: 'youthcenter.xml', // 청년 정책 읽어올 문서 
	type: 'GET', // 방식
	dataType: 'xml', // 문서 타입 
	timeout: 1000, // 시간 설정 
	error: function(){ // 로딩 에러시 
		alert('Error loading XML document'); 
	}, 
	success: function(xml){ 
		$(xml).find('emp').each(function(i,rownum){ // xml 문서 emp 기준으로 분리후 반복
			var polyBizSjnm = $(this).find("polyBizSjnm").text(); //정책명
			var polyItcnCn = $(this).find("polyItcnCn").text(); //정책소개
			var ageInfo = $(this).find("ageInfo").text(); //참여요건_연령
			var rqutPrdCn = $(this).find("rqutPrdCn").text();//신청 기간
			var rqutUrla = $(this).find("rqutUrla").text(); //사이트 링크
			var a =start_age(ageInfo); //참여할 수 있는 최저 나이
			var b=end_age(ageInfo); //참여할 수 있는 최대 나이
			if(s_age>=a && s_age<=b){
				j += 1;
				if (j > 0 && j <= 3) {
					var view_text ="<td>"+"<strong>"+"정책명: "+ polyBizSjnm+"</strong>"+"<br>"+"<br>"
					+"<h4>"+"<h5>"+"정책 소개:"+"</h5>"+polyItcnCn +"</h4>"+"<br>"+"<br>"
					+"<h4>"+"<h5>"+"참여 요건_ 연령: "+"</h5>"+ ageInfo+"</h4>"+"<br>"+"<br>"
					+"<h4>"+"<h5>"+"신청 기간: "+"</h5>"+ rqutPrdCn+"</h4>"+"<br>"+"<br>"
					+"<h4>"+"<h5>"+"사이트 링크: "+"</h5>"+rqutUrla+"</h4>"+"</td>"; 

					$("#listpolicy").append(view_text); // #id 에 view_text 삽입 
				}
				else if (j > 3 && j <= 6) {
					var view_text2 ="<td>"+"<strong>"+"정책명: "+ polyBizSjnm+"</strong>"+"<br>"+"<br>" 
					+"<h4>"+"<h5>"+"정책 소개:"+"</h5>"+polyItcnCn +"</h4>"+"<br>"+"<br>"
					+"<h4>"+"<h5>"+"참여 요건_ 연령: "+"</h5>"+ ageInfo+"</h4>"+"<br>"+"<br>"
					+"<h4>"+"<h5>"+"신청 기간: "+"</h5>"+ rqutPrdCn+"</h4>"+"<br>"+"<br>"
					+"<h4>"+"<h5>"+"사이트 링크: "+"</h5>"+rqutUrla+"</h4>"+"</td>"; 

					$("#listpolicy2").append(view_text2); // #id 에 view_text 삽입 
				}
				else if (j > 6 && j <= 9) {
					var view_text3 ="<td>"+"<strong>"+"정책명: "+ polyBizSjnm+"</strong>"+"<br>"+"<br>"
					+"<h4>"+"<h5>"+"정책 소개:"+"</h5>"+polyItcnCn +"</h4>"+"<br>"+"<br>"
					+"<h4>"+"<h5>"+"참여 요건_ 연령: "+"</h5>"+ ageInfo+"</h4>"+"<br>"+"<br>"
					+"<h4>"+"<h5>"+"신청 기간: "+"</h5>"+ rqutPrdCn+"</h4>"+"<br>"+"<br>"
					+"<h4>"+"<h5>"+"사이트 링크: "+"</h5>"+rqutUrla+"</h4>"+"</td>"; 

					$("#listpolicy3").append(view_text3); // #id 에 view_text 삽입 
				}
				else if (j > 9 && j <= 12) {
					var view_text4 ="<td>"+"<strong>"+"정책명: "+ polyBizSjnm+"</strong>"+"<br>"+"<br>" 
					+"<h4>"+"<h5>"+"정책 소개:"+"</h5>"+polyItcnCn +"</h4>"+"<br>"+"<br>"
					+"<h4>"+"<h5>"+"참여 요건_ 연령: "+"</h5>"+ ageInfo+"</h4>"+"<br>"+"<br>"
					+"<h4>"+"<h5>"+"신청 기간: "+"</h5>"+ rqutPrdCn+"</h4>"+"<br>"+"<br>"
					+"<h4>"+"<h5>"+"사이트 링크: "+"</h5>"+rqutUrla+"</h4>"+"</td>"; 

					$("#listpolicy4").append(view_text4); // #id 에 view_text 삽입 
				}
			}
		});
		if(j==0){
			var view_text ="<td>"+"<strong>"+ "죄송합니다. 현재 추천 제도가 없습니다."+"</strong>"+"</td>";
			console.log(view_text);
			$("#listpolicy").append(view_text);
		}
	} 
});  
  //참여가능한 시작 연령
  function start_age(ageInfo)
  {
      var age = String(ageInfo);
      var s_age = age.substring(0,5);
      var start_age=fn(s_age);
     /*  console.log(start_age); */
      return  start_age;

  }
  //참여가능한 마지막 연령
  function end_age(ageInfo)
  {
      var age = String(ageInfo);
      var e_age = age.substring(6,11);
	  var end_age=fn(e_age);
      /* console.log(end_age); */
      return end_age;

  }
  //숫자만 추출
  function fn(ageInfo){
	    var res;
	    res = ageInfo.replace(/[^0-9]/g,"");
	    return res;
	}
</script>

</head>
<body>
<div id="header"> 
  <nav>
      <ul id="hd"> 
      <li>
        <a href="main.jsp" class="headera">Home</a>
      </li>
      <li>
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
<!-- 홈페이지 들어가는 네비게이션 부분 -->
<div class="boardnav">
  <p class="title"><a href="main.jsp" class="page">3P Helper</a></p>
	<!-- 검색창 종료 -->
</div>

<!-- 홈페이지 아래 회색 네비게이션바 -->
<div class="bar"> 
  <div class="barcontent">
  <a href="main.jsp" class="home">home</a> > 제도 확인
  </div>
</div>

 <!-- 해당 페이지 타이틀 -->
<center>
 <div class="list">
 <div class="list2">
	추천 제도
	</div>
  <hr class="listhr"></hr>
 <div class="information">
    ※ 사용자에게 맞는 제도를 확인할 수 있습니다.
  </div>
</div>
</center>

 <br>
<center>
<form action="login.do" method="post">
<div class="policyListdiv">
 	<div id="listpolicy"></div>
	<p></p>
	<div id="listpolicy2"></div>
	<p></p>
	<div id="listpolicy3"></div>
	<p></p>
	<div id="listpolicy4"></div>
</div>
</form>
</center>
</html>