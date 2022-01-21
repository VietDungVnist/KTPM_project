<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "controll.*" %>
<%@ page import = "model.*" %>
<%@ page import = "java.util.ArrayList" %>
<!doctype html>
<html>
<head>
	<meta charset="utf-8">
	<title>Thông báo</title>
	<link rel="stylesheet" type="text/css" href=".\my-css\dinh_dang_trang_chu.css" />
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
					    <a href="user_infor.jsp">Thông tin cá nhân</a>
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

	<div style="width: 60%; margin: auto; padding: 30px 0px; text-align: center
				background-color: white">
		<h1>Dach sách yêu cầu</h1>
		<br />
		<table id="tbldancu">
			<tr>
				<th style="width: 40px"></th>
				<th>Họ và tên</th>
				<th style="text-align: left; width: 50%">Yêu cầu</th>
				<th colspan="2" style="text-align: left">Thao tác</th>
			</tr>
			<%
				int i = 1;
				ArrayList<person> list = new managerDAO().getRegisterRequest();
				ArrayList<person> list_2 = new managerDAO().getTachKhauRequest();
				for (person s: list) {
					String urle = "RemoveRegisterRequest?id=" + s.getID();
					String urlr = "xem_yeu_cau.jsp?id=" + s.getID();
			%>
		
			<tr>
				<td><%= i++ %></td>
				<td><%= s.getName() %></td>
				<td style="text-align: left">Đăng ký tạo tài khoản mới</td>
				<td style="text-align: left"><a href="<%= urle %>">Bỏ qua</a></td>
				<td><a href="<%= urlr %>">Xem chi tiết</a></td>
			</tr>
			<% } %>
			<%
				for (person s: list_2) {
					String urle = "RemoveTachKhauRequest?id=" + s.getID();
					String urlr = "xem_tach_khau.jsp?id=" + s.getID();
			%>
			<tr>
				<td><%= i++ %></td>
				<td><%= s.getName() %></td>
				<td style="text-align: left">Đăng ký tách hộ thành hộ khẩu mới</td>
				<td style="text-align: left"><a href="<%= urle %>">Bỏ qua</a></td>
				<td><a href="<%= urlr %>">Xem chi tiết</a></td>
			</tr>
			<% } %>
			</table>
	</div>
</body>
</html>