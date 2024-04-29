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
							<%=u.getName()%>'s Profile</p>

						<form action="home.jsp" method="post">
							<div class="mb-3">
								<label class="form-label">Name</label> : <input name="name"
									type="text" class="form-control" value="<%= u.getName()%>" readonly>
							</div>
							<div class="mb-3">
								<label class="form-label">Age</label> : <input name="age"
									type="text" class="form-control" value="<%=u.getAge()%>" readonly>
							</div>
							<div class="mb-3">
								<label class="form-label">Mobile</label> : <input name="mobile"
									type="text" class="form-control" value="<%=u.getMobile()%>" readonly>
							</div>
							<div class="mb-3">
								<label class="form-label">Email</label> : <input name="email"
									type="email" class="form-control" value="<%=u.getEmail()%>" readonly>
							</div>
							<button type="submit" class="btn bg-primary text-white col-md-12">Close</button>
						</form>

					</div>
				</div>
			</div>
		</div>
	</div>

</body>
</html>