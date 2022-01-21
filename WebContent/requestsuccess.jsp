<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Success</title>
	<link rel="stylesheet" type="text/css" href=".\my-css\dinh_dang_trang_chu.css" />
	<style>
		._1{
			text-align: center;
			background-color: white;
			margin: auto;
			margin-top: 100px;
			padding: 40px;
			width: 30%;
			box-shadow: 0px 0px 10px #c7c7c7;
			padding: 40px;
			border-radius: 8px;
		}
	</style>
</head>
<body>
	<div id="taskbar">
		<div id="taskbar_left">
			<div id="trangchu" class="barhome" >
				<a href='.\trang_chu.jsp' class="taskbar_text">Trang chủ</a>
			</div>
			<div id="thongbao" class="barhome">
				<a href='.\thong_bao.jsp' class="taskbar_text">Thông báo</a>
			</div>
			<div id="huongdan" class="barhome">
				<a href='.\dich_vu.jsp' class="taskbar_text">Dịch vụ</a>
			</div>
			<div id="space" class="barhome"></div>
		</div>
		<%
			String username = (String) session.getAttribute("username");
			if (username != null) { %>
				<div class="dropdown">
					<button class="dropbtn">
						<img src=".\img\account.png" width="20" style="vertical-align: middle; 
									display: inline; margin-right: 3px">
						<div style="display: inline">${username}</div>
					</button>
					<div class="dropdown-content">
					    <a href="">Thông tin cá nhân</a>
					    <a href="user_notif.jsp">Thông báo</a>
					    <a href="LogoutServlet">Đăng xuất</a>
					</div>
				</div>
			<%}
		%>
		<div id="taskbar_right">
		<%
			if (username != null) { %>
			<% } else { %>
				<div id="dangnhap" class="barhome">
					<a href='.\dang_nhap.jsp' class="taskbar_text">Đăng nhập</a>
				</div>
				<div id="dangky" class="barhome">
					<a href='.\dang_ky.jsp' class="taskbar_text">Tạo tài khoản</a>
				</div>
			<% } %>
		</div>
	</div>
	<div class="_1">
		<div id="taotaikhoan">Tác vụ thành công</div>
		<form method="POST" action=".\trang_chu.jsp">
			<br><br>
			<input type="submit" value="Về trang chủ">
		</form>
	</div>
</body>
</html>