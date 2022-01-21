<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "controll.*" %>
<%@ page import = "model.*" %>
<%@ page import = "java.text.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<script type="text/javascript">
		function alertName(){
			alert("Đăng ký thành công, chờ quản lý xác thực\n. Kết quả sẽ được thông báo qua tin nhắn");
		} 
	</script>
	<script type="text/javascript"> window.onload = alertName; </script> 
	<%
		request.setCharacterEncoding("UTF-8");
		String name = request.getParameter("name");
		String cccd = request.getParameter("cccd");
		String phone = request.getParameter("phone");
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		
		if (new userDAO().addAccount(name, cccd, phone, username, password)) {
			response.sendRedirect("requestsuccess.jsp");
		} else {
			response.sendRedirect("error.jsp");
		}
	%>
	
	
</body>
</html>