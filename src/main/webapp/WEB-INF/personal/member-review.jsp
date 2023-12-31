<%--
  Created by IntelliJ IDEA.
  User: wonu
  Date: 10/27/23
  Time: 17:47
  To change this template use File | Settings | File Templates.
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<%@ include file="../include/member-side.jsp"%>

<table class="table">
	<h2>my review</h2>
	<c:if test="${empty reviews}">
		<p class="fs-5 col-md-8">아직 등록된 리뷰가 없습니다</p>
		<div class="mb-5">
			<a href="../category/list" class="btn btn-primary btn-lg px-4">둘러보러 가기</a>
		</div>
	</c:if>
	<c:if test="${not empty reviews}">
	<thead>
	<tr>
		<th scope="col">#</th>
		<th scope="col" colspan="2" style="text-align: center">상품</th>
		<th scope="col">리뷰</th>
		<th scope="col">등록일</th>
		<th scope="col"><img src="../img/like.png" class="img20"</th>
	</tr>
	</thead>
	<tbody>
	<c:forEach items="${reviews }" var="review" varStatus="loop">
		<tr>
			<th scope="row">${review.rNum }</th>
			<c:choose>
				<c:when test="${review.postDeletedDate eq null}">
					<td class="entP"><a href="../view/product?no=${review.postNo}"><img src="/upload/${review.postImg}" class="img100"  alt="postImg"/></a></td>
					<td class="entP"><a href="../view/product?no=${review.postNo}">${review.postTitle}</a></td>
				</c:when>
				<c:otherwise>
					<td colspan="2" class="entP">삭제된 상품입니다.</td>
				</c:otherwise>
			</c:choose>
			<td class="entP"><a href="#">${review.title }</a></td>
			<td class="entP">${review.regDate }</td>
			<td class="entP">${review.likes }</td>
		</tr>
	</tbody>
	</c:forEach>
</table>
<nav aria-label="Page navigation example">
	<ul class="pagination">
		<li class="page-item">
			<a class="page-link" href="#" aria-label="Previous">
				<span aria-hidden="true">&laquo;</span>
			</a>
		</li>
		<c:forEach var="page" begin="1" end="${pages}">
			<li class="page-item"><a class="page-link" href="../personal/member-review?idx=${page}">${page}</a></li>
		</c:forEach>
		<li class="page-item">
			<a class="page-link" href="#" aria-label="Next">
				<span aria-hidden="true">&raquo;</span>
			</a>
		</li>
	</ul>
</nav>
	</c:if>
</div>

<%@ include file="../include/footer.jsp"%>