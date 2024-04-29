<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" isErrorPage="true"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>!Error</title>
<%@ include file="allcss.jsp"%>
<style type="text/css">
	.box{
		display: flex;
		flex-direction : column;
		justify-content:start;
		align-items: center;
		position : relative;
		top : 240px;
	}
	button{
		border-width : 2px;
		background-color:white;
		padding: 6px 25px ;
		border-radius: 20px;
	}
</style>
</head>
<body>
	<div class="box">	
			<div><i class="fa-regular fa-face-dizzy fa-xl" style="color: #000000;"></i> Oops, Something went wrong!</div>
			<a href="login.jsp"><button type="submit" ><i class="fa-solid fa-arrow-rotate-right" style="color: #000000;"></i></button></a>
	</div>
</body>
</html>