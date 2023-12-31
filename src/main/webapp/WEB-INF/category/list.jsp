<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../include/header-main.jsp"%>
<%@ include file="../include/nav.jsp"%>


<div class="container">

	<!-- 1. show material -->

	<c:if test="${ not empty materialList }">
			<div class="show-material">
				<div class="row align-items-md-stretch">
					<div class="h-100 p-5 bg-body-tertiary border rounded-3">


						<div class="container main-category-buttons">
							<div class="row ">

								<c:forEach items="${ materialList }" var="material" varStatus="status">

									<div class="col-md-3 ">
										<a href="../category/list?sort=${sort }&symp=${sympNo }&material=${ material.materialNo }" class="nav-link link-body-emphasis">
											${material.materialName } 
										</a>
									</div>

								</c:forEach>

							</div>
						</div>

					</div>
				</div>
			</div>
</c:if>



			<!-- 2. no content -->
			<c:choose>
				<c:when test="${ empty postList }">
					<div class="no-category-content d-flex align-items-center justify-content-center">
						<h2 class="use-main-color">게시글이 없습니다</h2>
					</div>
				</c:when>
				<c:otherwise>



			<!-- 3. show postList -->
			<div class="sort-select d-flex justify-content-start">
				<form action="../category/list?" method="get" name="sort-select"
					id="sort-select">
					<input type="hidden" name="symp" value="${sympNo}">
      				<input type="hidden" name="material" value="${materialNo}">
					<select class="form-select" aria-label="Default select example" name="sort" id="sort" style="width: 150px;">
						<option value="recent" ${sort=='recent'?'selected':null }>최신순</option>
						<option value="old" ${sort=='old'?'selected':null }>오래된순</option>
					</select>
				</form>
			</div>
			<script>
				$("#sort").on('change', function() {
					$("#sort-select").submit();
				});
			</script>


			<div class="container album py-5 bg-light">
						<div class="row row-cols-1 row-cols-sm-2 row-cols-md-4 g-3">
							<c:forEach items="${ postList }" var="post" varStatus="status">

								<div class="col">
									<div class="card shadow-sm">
										<a href="../view/product?no=${post.postNo }"> 
										<svg
												class="bd-placeholder-img card-img-top" width="100%"
												height="225" xmlns="http://www.w3.org/2000/svg" role="img"
												aria-label="Placeholder: Thumbnail"
												preserveAspectRatio="xMidYMid slice" focusable="false">
						<title>Placeholder</title>
						<rect width="100%" height="100%" fill="#55595c"></rect>
						<image href="${ post.postImg }" height="100%" width="100%" />
						<text x="50%" y="50%" fill="#eceeef" dy=".3em"> </text>
					</svg>
										</a>

										<div class="card-body">
											<a href="../view/product?no=${post.postNo }">
												<p class="card-text category-title">${ post.title }</p> 
											</a>
											<div class="d-flex justify-content-between align-items-center">
												<div class="btn-group">
													<a href="../post/modify?no=${post.postNo }" class="btn btn-outline-secondary mt-3" id="btn-modify" >수정</a>
													<a href="../post/delete?no=${post.postNo }" class="btn btn-outline-secondary mt-3" id="btn-delete">삭제</a>
												</div>
												
												<small class="text-muted">${post.name }</small>
											</div>
										</div>
									</div>
								</div>


							</c:forEach>
				</c:otherwise>
			</c:choose>
</div>
</div>
	
	
	
	
	<!-- 4. review -->







</div>


<%@ include file="../include/footer.jsp"%>

<script>

$("#modalAccept").on("click", function() {

	location.href="../post/modify";
});
</script>
