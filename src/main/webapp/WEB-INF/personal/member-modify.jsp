<%--
  Created by IntelliJ IDEA.
  User: wonu
  Date: 10/21/23
  Time: 11:55
  To change this template use File | Settings | File Templates.
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<%@ include file="../include/member-side.jsp" %>

		<!-- Content -->
			<h1>Edit Member Profile</h1>
			<form action="../personal/member-modify-process" method="post">
				<div class="mb-3">
					<label for="user-email" class=form-label">Email</label>
<%--					<span class="input-group-text">@</span>--%>
					<input type="email" class="form-control" id="user-email" name="email" value=${loggedMember.email }>

				</div>
				<div class="mb-3">
					<label for="nickname" class="form-label">Nickname</label>
					<input type="text" class="form-control" id="nickname" name="nickName" value=${loggedMember.nickName }>
				</div>
				<div class="mb-3">
					<label for="user-address" class="form-label">Address</label>
					<input type="text" class="form-control" id="user-address" name="address" value=${loggedMember.address }>
				</div>
				<div class="mb-3">
					<label for="addressDetail" class="form-label">Address Detail</label>
					<input type="text" class="form-control" id="addressDetail" name="addressDetail" value=${loggedMember.addressDetail }>
				</div>
				<button type="submit" class="btn btn-primary">Update Profile</button>
			</form>
		</div>
	</div>
</div>
<%@ include file="../include/footer.jsp"%>