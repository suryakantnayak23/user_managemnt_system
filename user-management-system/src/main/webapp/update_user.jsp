<%@page import="com.org.dto.User"%>
<%@page import="com.org.dao.UserDao"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" errorPage="components/errorhandler.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Update Page</title>
</head>
<body>
	<%@ include file="components/user_home_navbar.jsp" %>
	<%@ include file="components/allcss.jsp" %>
	<%
		UserDao dao = new UserDao();
			int id  = Integer.parseInt(request.getParameter("id"));
			User u = dao.fetchUserById(id);
	%>
	<div class="container p-5">
		<div class="row">
			<div class="col-md-4 offset-md-4">
				<div class="car paint-card">
					<div class="card-body">
						
						<p class="fs-4 text-center">
							Update <%=u.getName()%>'s Profile</p>

						<form action="update_user" method="post">
							<div class="mb-3">
								<label class="form-label">Name</label> <input name="name"
									type="text" class="form-control" value="<%= u.getName()%>" required>
							</div>
							<div class="mb-3">
								<label class="form-label">Age</label> <input name="age"
									type="text" class="form-control" value="<%=u.getAge()%>" required>
							</div>
							<div class="mb-3">
								<label class="form-label">Mobile</label> <input name="mobile"
									type="text" class="form-control" value="<%=u.getMobile()%>" required>
							</div>
							<div class="mb-3">
								<label class="form-label">Email</label> <input name="email"
									type="email" class="form-control" value="<%=u.getEmail()%>" required>
							</div>
							<div class="mb-3">
								<label class="form-label">Password</label> <input
									name="password" type="password" class="form-control" value="<%=u.getPassword()%>" required>
							</div>
							<input type="hidden" name="id" value="<%=u.getId()%>">
							<button type="submit" class="btn bg-primary text-white col-md-12">Update</button>
						</form>

					</div>
				</div>
			</div>
		</div>
	</div>

</body>
</html>