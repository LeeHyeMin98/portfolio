<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> <!--  안될 때-->
<!DOCTYPE html>
<html>
<head>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="../../resources/css/policyList.css?ver=0.2" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Nanum+Gothic&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Nanum+Brush+Script&display=swap" rel="stylesheet">
<meta charset="EUC-KR">
<title>Insert title here</title>
<script>
console.log("4");
var result1="";
var result2="";
var result3="";
var result4="";
var rownum1=0;
var rownum2=0;
//경기도 일자리 관련 지원 정책
$.ajax({          
    url: 'PublicData.do',
    type: 'post',
    dataType: 'json',
    contentType: "application/x-www-form-urlencoded;charset=UTF-8",
    success: function(msg){
        console.log(msg); 
        var myItem =new Array();  
        //myItem = decodeURIComponent(msg.JobFndtnSportPolocy);
        //console.log(myItem);
        //console.log(myItem[0].PBLANC_TITLE);
        myItem1 = msg.JobFndtnSportPolocy;
        console.log(myItem1);
        console.log(myItem1[1]);
        console.log(myItem1[1].row[1]);
        
       date=getTimeStamp(); //현재 날짜 YYYY-MM-DD 형식
       twoMonthLater=getTimeStampTwo(); //현재 날짜로부터 두달 후 YYYY-MM-DD 형식

        console.log(date);
        console.log(twoMonthLater);

        for(var i=0;i<34;i++){
        	if(rownum1<3&&(myItem1[1].row[i].RECRUT_END_DE >date) && (myItem1[1].row[i].RECRUT_END_DE < twoMonthLater)){
        		result1=result1+"<td>"+"<strong>"+"공고명: " +myItem1[1].row[i].PBLANC_TITLE+"</strong>"+"<br>";//공고명
        		result1=result1+"<h4>"+"<h5>"+"모집 시작일: "+"</h5>"+myItem1[1].row[i].RECRUT_BEGIN_DE+"</h4>"+"<br>";//모집 시작 날짜
        		result1=result1+"<h4>"+"<h5>"+"모집 종료일: "+"</h5>"+myItem1[1].row[i].RECRUT_END_DE+"</h4>"+"<br>";//모집 종료 날짜
            	result1=result1+"<h4>"+"<h5>"+"상세 URI: "+"</h5>"+myItem1[1].row[i].DETAIL_PAGE_URL+"</h4>"+"</td>"+"<br>";//상세 페이지 URI
            	rownum1=rownum1+1;	
        	}
        	if(rownum1>=3&&rownum1<6&&(myItem1[1].row[i].RECRUT_END_DE >date) && (myItem1[1].row[i].RECRUT_END_DE < twoMonthLater)){
        		result2=result2+"<td>"+"<strong>"+"공고명: " +myItem1[1].row[i].PBLANC_TITLE+"</strong>"+"<br>";//공고명
        		result2=result2+"<h4>"+"<h5>"+"모집 시작일: "+"</h5>"+myItem1[1].row[i].RECRUT_BEGIN_DE+"</h4>"+"<br>";//모집 시작 날짜
        		result2=result2+"<h4>"+"<h5>"+"모집 종료일: "+"</h5>"+myItem1[1].row[i].RECRUT_END_DE+"</h4>"+"<br>";//모집 종료 날짜
        		result2=result2+"<h4>"+"<h5>"+"상세 URI: "+"</h5>"+myItem1[1].row[i].DETAIL_PAGE_URL+"</h4>"+"</td>"+"<br>";//상세 페이지 URI
        		rownum1=rownum1+1;	
        	}
        	if(rownum1>=6&&rownum1<9&&(myItem1[1].row[i].RECRUT_END_DE >date) && (myItem1[1].row[i].RECRUT_END_DE < twoMonthLater)){
    			result3=result3+"<td>"+"<strong>"+"공고명: " +myItem1[1].row[i].PBLANC_TITLE+"</strong>"+"<br>";//공고명
    			result3=result3+"모집 기관명: " +myItem1[1].row[i].INST_NM+"<br>";//모집 기관명
    			result3=result3+"모집 시작일: " +myItem1[1].row[i].RECRUT_BEGIN_DE+"<br>";//모집 시작 날짜
    			result3=result3+"모집 종료일: " +myItem1[1].row[i].RECRUT_END_DE+"<br>";//모집 종료 날짜
    			result3=result3+"상세 URI: " +myItem1[1].row[i].DETAIL_PAGE_URL+"</td>"+"<br>";//상세 페이지 URI 
    			rownum1=rownum1+1;
         	} 
    		if(rownum1>=9&&rownum1<12&&(myItem1[1].row[i].RECRUT_END_DE >date) && (myItem1[1].row[i].RECRUT_END_DE < twoMonthLater)){
    			result4=result4+"<td>"+"<strong>"+"공고명: " +myItem1[1].row[i].PBLANC_TITLE+"</strong>"+"<br>";//공고명
    			result4=result4+"모집 기관명: " +myItem1[1].row[i].INST_NM+"<br>";//모집 기관명
    			result4=result4+"모집 시작일: " +myItem1[1].row[i].RECRUT_BEGIN_DE+"<br>";//모집 시작 날짜
    			result4=result4+"모집 종료일: " +myItem1[1].row[i].RECRUT_END_DE+"<br>";//모집 종료 날짜
    			result4=result4+"상세 URI: " +myItem1[1].row[i].DETAIL_PAGE_URL+"</td>"+"<br>";//상세 페이지 URI 
    			rownum1=rownum1+1;
         	} 
        	console.log(result1);
        	 $("#listpolicy").html(result1);
        	 $("#listpolicy2").html(result2);
        	 $("#listpolicy3").html(result3);
        	 $("#listpolicy4").html(result4);
        }
    }
});    

//경기도 대외활동 데이터
$.ajax({          
    url: 'JobFndActData.do',
    type: 'get',
    dataType: 'json',
    contentType: "application/x-www-form-urlencoded; charset=UTF-8",
    success: function(msgg){
        console.log(msgg); 
        var myItem2 =new Array();  
        myItem2 = msgg.JobFndtnTosAct;
        console.log(myItem2);
        console.log(myItem2[1]);
        console.log(myItem2[1].row[1]);
        console.log(myItem2[1].row[0].PBLANC_TITLE);

        date2=getTimeStamp(); //현재 날짜 YYYY-MM-DD 형식
       twoMonthLater2=getTimeStampTwo(); //현재 날짜로부터 두달 후 YYYY-MM-DD 형식

        console.log(date2);
        console.log(twoMonthLater2); 

        for(var i=0;i<150;i++){
        	if(rownum1<3&&(myItem2[1].row[i].RECRUT_END_DE >date2)&& (myItem2[1].row[i].RECRUT_END_DE < twoMonthLater2)){
        		result1=result1+"<td>"+"<strong>"+"공고명: " +myItem2[1].row[i].PBLANC_TITLE+"</strong>"+"<br>";//공고명
        		result1=result1+"<h4>"+"<h5>"+"모집 시작일: "+"</h5>"+myItem2[1].row[i].RECRUT_BEGIN_DE+"</h4>"+"<br>";//모집 시작 날짜
        		result1=result1+"<h4>"+"<h5>"+"모집 종료일: "+"</h5>"+myItem2[1].row[i].RECRUT_END_DE+"</h4>"+"<br>";//모집 종료 날짜
            	result1=result1+"<h4>"+"<h5>"+"상세 URI: "+"</h5>"+myItem2[1].row[i].DETAIL_PAGE_URL+"</h4>"+"</td>"+"<br>";//상세 페이지 URI
            	rownum1=rownum1+1;	
        	}
        	if(rownum1>=3&&rownum1<6&&(myItem2[1].row[i].RECRUT_END_DE >date2) && (myItem2[1].row[i].RECRUT_END_DE < twoMonthLater2)){
        		result2=result2+"<td>"+"<strong>"+"공고명: " +myItem2[1].row[i].PBLANC_TITLE+"</strong>"+"<br>";//공고명
        		result2=result2+"<h4>"+"<h5>"+"모집 시작일: "+"</h5>"+myItem2[1].row[i].RECRUT_BEGIN_DE+"</h4>"+"<br>";//모집 시작 날짜
        		result2=result2+"<h4>"+"<h5>"+"모집 종료일: "+"</h5>"+myItem2[1].row[i].RECRUT_END_DE+"</h4>"+"<br>";//모집 종료 날짜
        		result2=result2+"<h4>"+"<h5>"+"상세 URI: "+"</h5>"+myItem2[1].row[i].DETAIL_PAGE_URL+"</h4>"+"</td>"+"<br>";//상세 페이지 URI
        		rownum1=rownum1+1;	
        	}
        		if(rownum1>=6&&rownum1<9&&(myItem2[1].row[i].RECRUT_END_DE >date2) && (myItem2[1].row[i].RECRUT_END_DE < twoMonthLater2)){
        			result3=result3+"<td>"+"<strong>"+"공고명: " +myItem2[1].row[i].PBLANC_TITLE+"</strong>"+"<br>";//공고명
        			result3=result3+"모집 기관명: " +myItem2[1].row[i].INST_NM+"<br>";//모집 기관명
        			result3=result3+"모집 시작일: " +myItem2[1].row[i].RECRUT_BEGIN_DE+"<br>";//모집 시작 날짜
        			result3=result3+"모집 종료일: " +myItem2[1].row[i].RECRUT_END_DE+"<br>";//모집 종료 날짜
        			result3=result3+"상세 URI: " +myItem2[1].row[i].DETAIL_PAGE_URL+"</td>"+"<br>";//상세 페이지 URI 
        			rownum1=rownum1+1;
             	} 
        		if(rownum1>=9&&rownum1<12&&(myItem2[1].row[i].RECRUT_END_DE >date2) && (myItem2[1].row[i].RECRUT_END_DE < twoMonthLater2)){
        			result4=result4+"<td>"+"<strong>"+"공고명: " +myItem2[1].row[i].PBLANC_TITLE+"</strong>"+"<br>";//공고명
        			result4=result4+"모집 기관명: " +myItem2[1].row[i].INST_NM+"<br>";//모집 기관명
        			result4=result4+"모집 시작일: " +myItem2[1].row[i].RECRUT_BEGIN_DE+"<br>";//모집 시작 날짜
        			result4=result4+"모집 종료일: " +myItem2[1].row[i].RECRUT_END_DE+"<br>";//모집 종료 날짜
        			result4=result4+"상세 URI: " +myItem2[1].row[i].DETAIL_PAGE_URL+"</td>"+"<br>";//상세 페이지 URI 
        			rownum1=rownum1+1;
             	} 
           	 $("#listpolicy").html(result1);
        	 $("#listpolicy2").html(result2);
        	 $("#listpolicy3").html(result3);
        	 $("#listpolicy4").html(result4);
        }
    }
});    


//현재 날짜  YYYY-MM-DD 형식
function getTimeStamp() {
	var d= new Date();
    var s =
        leadingZeros(d.getFullYear(), 4) + '-' +
        leadingZeros(d.getMonth() + 1, 2) + '-' +
        leadingZeros(d.getDate(), 2);

    return s;
    console.log(s);
}

//현재로부터 두달 후  YYYY-MM-DD 형식
function getTimeStampTwo() {
	var d= new Date();
    var s =
        leadingZeros(d.getFullYear(), 4) + '-' +
        leadingZeros(d.getMonth() + 3, 2) + '-' +
        leadingZeros(d.getDate(), 2); 

    return s;
    console.log(s);
}

// YYYY-MM-DD 형식
function leadingZeros(n, digits) {

    var zero = '';
    n = n.toString();

    if (n.length < digits) {
        for (i = 0; i < digits - n.length; i++)
            zero += '0';
    }
    return zero + n;
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
	마감 예정 제도
	</div>
  <hr class="listhr"></hr>
 <div class="information">
    ※ 모집 마감일이 얼마 남지 않은 제도를 확인할 수 있습니다.
  </div>
</div>
</center>


 <br>
<center>
<form action="PublicData.do" method="get">
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