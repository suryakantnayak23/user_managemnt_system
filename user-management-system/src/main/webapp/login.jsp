<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" errorPage="components/errorhandler.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Login</title>
<%@ include file="components/allcss.jsp"%>
<style type="text/css">
.paint-card {
	box-shadow: 0 0 15px 0 rgba(0, 0, 0, 0.4);
}
</style>
</head>
<body>
  <%@ include file="components/navbar.jsp"%>
	<div class="container p-5">
		<div class="row">
			<div class="col-md-4 offset-md-4">
				<div class="car paint-card">
					<div class="card-body">
						<p class="fs-4 text-center">User Login</p>
						
						<%String str =(String)session.getAttribute("fail");
							if(str != null)
							{%>
								<p class = "text-center text-danger fs-5">Invalid Email or Password</p>
						 	 <%}
								session.removeAttribute("fail");
							%>
							
						<form action="login_user" method ="post">
							<div class="mb-3">
								<label class="form-label">Email</label> <input name="email"
									type="email" class="form-control" required>
							</div>
							<div class="mb-3">
								<label class="form-label">Password</label> <input
									name="password" type="password" class="form-control" required>
							</div>
							<button type="submit" class="btn bg-primary text-white col-md-12">Login</button>
						</form>

					</div>
				</div>
			</div>
		</div>
	</div>

</body>
</html>