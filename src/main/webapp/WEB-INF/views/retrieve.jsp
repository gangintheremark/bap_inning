<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 조회</title>
<style>
.gray-font, #team {
	color: rgb(143, 143, 143);
}

a {
	text-decoration: none !important;
}
</style>
<script type="text/javascript">
	function go_list() {
		location.href = "list";
	}
	function reply_delete() {
		alert(${list.reivews_num});
		
	}
</script>
</head>
<body>
	<jsp:include page="common/nav.jsp" flush="true" />
	<div class="container mt-4 board">
		<form class="form-horizontal" action="updateForm" method="post">
			<input type="hidden" name="title" value="${retrieve.title}">
			<input type="hidden" name="team_code" value="${retrieve.team_code}">
			<div class="form-group">
				<div>
					<p>
						<c:choose>
							<c:when test="${retrieve.team_code eq 0}">
								<span id="team">기타</span>
							</c:when>
							<c:when test="${retrieve.team_code eq 1}">
								<span id="team">SSG</span>
							</c:when>
							<c:when test="${retrieve.team_code eq '2'}">
								<span id="team">키움</span>
							</c:when>
							<c:when test="${retrieve.team_code eq 3}">
								<span id="team">LG</span>
							</c:when>
							<c:when test="${retrieve.team_code eq 4}">
								<span id="team">KT</span>
							</c:when>
							<c:when test="${retrieve.team_code eq 5}">
								<span id="team">KIA</span>
							</c:when>
							<c:when test="${retrieve.team_code eq 6}">
								<span id="team">NC</span>
							</c:when>
							<c:when test="${retrieve.team_code eq 7}">
								<span id="team">삼성</span>
							</c:when>
							<c:when test="${dto.team_code eq 8}">
								<span id="team">롯데</span>
							</c:when>
							<c:when test="${dto.team_code eq 9}">
								<span id="team">두산</span>
							</c:when>
							<c:when test="${retrieve.team_code eq 10}">
								<span id="team">한화</span>
							</c:when>
						</c:choose>
					</p>
					<h2>${retrieve.title}</h2>
					<span> <c:choose>
							<c:when test="${team == 1}">
								<img src="images/logo/SSG.png" width="40" height="30">
							</c:when>
							<c:when test="${team == 2}">
								<img src="images/logo/키움.png" width="40" height="32">
							</c:when>
							<c:when test="${team == 3}">
								<img src="images/logo/LG.png" width="35" height="32">
							</c:when>
							<c:when test="${team == 4}">
								<img src="images/logo/KT.png" width="35" height="35">
							</c:when>
							<c:when test="${team == 5}">
								<img src="images/logo/KIA.png" width="43" height="35">
							</c:when>
							<c:when test="${team == 6}">
							<img src="images/logo/NC.png" width="43" height="35">
							</c:when>
							<c:when test="${team == 7}">
								<img src="images/logo/삼성.png" width="38" height="35">
							</c:when>
							<c:when test="${team == 8}">
								<img src="images/logo/롯데.png" width="40" height="35">
							</c:when>
							<c:when test="${team == 9}">
								<img src="images/logo/두산.png" width="40" height="35">
							</c:when>
							<c:when test="${team == 10}">
								<img src="images/logo/한화.png" width="50" height="35">
							</c:when>
							<c:when test="${team == 0}">
								<img src="images/logo/noTeam.png" width="36" height="40">
							</c:when>
						</c:choose> ${retrieve.userid}
					</span> &nbsp; <span class="gray-font">2023.10.25</span> &nbsp; <span
						class="gray-font">조회수: ${retrieve.count}</span> <a type="submit"
						class="ms-3">수정</a> <a href="delete?no=${retrieve.board_num}"
						class="mx-1">삭제</a>
					<hr>
				</div>
			</div>
			<div class="form-group">
				<div class="mb-4">
					<textarea class="form-control" rows="10"
						style="border: none; background-color: rgba(248, 249, 250, 0.5);"
						name="text" disabled>${retrieve.text}</textarea>
				</div>
				<button type="button" class="btn btn-primary" onclick="go_list()">목록</button>
			</div>
		</form>
		<hr>
		<div class="form-group">
			<div class="mb-4">
				<form action="replyInsert" method="get">
					<div class="row">
						<div class="col-md-10 mb-3">
							<input type="hidden" name="board_num"
								value="${retrieve.board_num}"> <input type="text"
								class="form-control" name="text" id="text" required
								autocomplete="off">
						</div>
						<div class="col-md-2">
							<button type="submit" class="btn btn-primary">등록</button>
							<br>
						</div>
					</div>
				</form>
			</div>
		</div>
		<div class="form-group">
			<div class="mb-4">
				<c:forEach var="list" items="${retrieve.replyList}">
					<div class="row">

						<div>
							<c:choose>
								<c:when test="${list.team_code == 1}">
										<img src="images/logo/SSG.png" width="40" height="30">
								</c:when>
								<c:when test="${list.team_code == 2}">
									<img src="images/logo/키움.png" width="40" height="32">
								</c:when>
								<c:when test="${list.team_code == 3}">
									<img src="images/logo/LG.png" width="35" height="32">
								</c:when>
								<c:when test="${list.team_code == 4}">
									<img src="images/logo/KT.png" width="35" height="35">
								</c:when>
								<c:when test="${list.team_code == 5}">
									<img src="images/logo/KIA.png" width="43" height="35">
								</c:when>
								<c:when test="${list.team_code == 6}">
									<img src="images/logo/NC.png" width="43" height="35">
								</c:when>
								<c:when test="${list.team_code == 7}">
									<img src="images/logo/삼성.png" width="38" height="35">
								</c:when>
								<c:when test="${list.team_code == 8}">
									<img src="images/logo/롯데.png" width="40" height="35">
								</c:when>
								<c:when test="${list.team_code == 9}">
									<img src="images/logo/두산.png" width="40" height="35">
								</c:when>
								<c:when test="${list.team_code == 10}">
									<img src="images/logo/한화.png" width="50" height="35">
								</c:when>
								<c:when test="${list.team_code == 0}">
									<img src="images/logo/noTeam.png" width="36" height="40">
								</c:when>
							</c:choose>
							${list.userid}<span class="mx-3"
								style="color: rgb(185, 185, 185)">${list.updateDate}</span>
						</div>
						<div class="col-md-10 my-2">${list.text}</div>
						<div class="col-md-2">
							<button type="button" class="btn btn-primary">
								<a href="replydelete?no=${list.reviews_num}">삭제</a>
							</button>
							<br>
						</div>
					</div>
				</c:forEach>
			</div>
		</div>
	</div>
</body>
</html>