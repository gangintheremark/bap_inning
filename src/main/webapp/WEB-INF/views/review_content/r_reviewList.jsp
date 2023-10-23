<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>임시 음식점 리뷰 목록</title>

<script type="text/javascript">
	function writeui() {
	    location.href = "reviewWrite";
	}
	/* 
	function reviewDelete(){
		var shouldDelete = confirm("리뷰를 삭제하시겠습니까?");
		if (shouldDelete) {
		    // AJAX 요청을 사용하여 서버에 리뷰 삭제를 요청합니다.
		    $.ajax({
		      url: "reviewDelete", // 삭제 요청을 처리할 URL을 설정
		      method: "GET", // 또는 "GET" 등 요청 메소드 설정
		      data: { num: review_id }, // 서버에 전달할 데이터
		      success: function(data) {
		        // 삭제 요청이 성공시
		        alert("리뷰가 삭제되었습니다.");
		        location.href="reviewDelete?num="+num;
		      },
		      error: function(xhr, status, error) {
		        // 삭제 요청이 실패시
		        console.error("삭제 요청 실패:", error);
		      }
		    });
	}
 */
</script>
</head>
<body>
	<div class="container">
		<h2 class="text-center">임시 음식점 리뷰 목록</h2>
		<select>
			<option>최신순
			<option>별점 높은 순			
			<option>별점 낮은 순			
		</select>
		<input type="checkbox">사진리뷰만 보기
		
		<table class="table table-striped">
			<thead>
				<tr>
					<th>리뷰번호</th>
					<th>내용</th>
					<th>리뷰이미지</th>
					<th>작성자</th>
					<th>별점</th>
					<th>추천</th>
					<th>작성일</th>
				</tr>
			</thead>
			<tbody>
			<c:set var="pageDTO" value="${pageDTO}" />
			<c:forEach var="reviewDTO" items="${pageDTO.list}">
				<tr>
					<td>${reviewDTO.review_id}</td>
					<td>${reviewDTO.review_content}</td>
					<td>이미지추가</td>
					<td>${reviewDTO.user_id}</td>
					<td>${reviewDTO.rating}</td>
					<td>${reviewDTO.like_cnt}</td>
					<td>${reviewDTO.modified_date}</td>
					<td><a href="reviewRetrieve?review_id=${reviewDTO.review_id}">수정</a></td>
					<td><button onclick="reviewDelete()">삭제</button></td>
										
				</tr>
			</c:forEach>
			</tbody>
			 <!--  page 번호 출력 -->
  <c:set var="perPage" value="${pageDTO.perPage}" />
  <c:set var="curPage" value="${pageDTO.curPage}" />
  <c:set var="totalCount" value="${pageDTO.totalCount}" />
  <c:set var="totalNum" value="${totalCount / perPage}" />
  <c:if test="${totalCount%perPage != 0}">
    <c:set var="totalNum" value="${totalNum+1}" />
  </c:if>
   <tr>
    <td colspan="6">
    <c:forEach var="i" begin="1" end="${totalNum}" >
    	<c:if test="${curPage==i}">
    	   ${i}
    	</c:if>
    	<c:if test="${curPage!=i}">
    	  <a href="list?curPage=${i}">${i}</a>
    	</c:if>
    </c:forEach>
     </td>
  </tr>
  <!--  page 번호 출력 --> 
		</table>
		<button onclick="writeui()">리뷰작성</button>
	</div>

</body>
</html>