<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "controll.*" %>
<%@ page import = "model.*" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Tạo tài khoản</title>
	<link rel="stylesheet" type="text/css" href=".\my-css\dinh_dang_trang_chu.css" />
	
</head>
<body style="">
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
	<div class="tao_tai_khoan">
		<div id="taotaikhoan">Tạo tài khoản</div>
		<form method="POST" action="RegisterServlet">
			<fieldset class="taotk_field">
				<label>Họ và tên</label>
				<input name="name" type="text" value="" required>
			</fieldset>
			<fieldset class="taotk_field">
				<label>Số CCCD</label>
				<input name="cccd" type="text" value="" pattern="[0-9]{12}"
					title="Số CCCD không hợp lệ" required>
			</fieldset>
			<fieldset class="taotk_field">
				<label>Ngày sinh</label>
				<input name="dob" type="text" value="" placeholder="dd/MM/yyyy" required>
			</fieldset>
			<fieldset class="taotk_field">
				<label>Quê quán</label>
				<input name="hometown" type="text" value="" required>
			</fieldset>
			<fieldset class="taotk_field">
				<label>Dân tộc</label>
				<input name="nation" type="text" value="" required>
			</fieldset>
			<fieldset class="taotk_field">
				<label>Số điện thoại</label>
				<input name="phone" type="text" pattern="[0-9]{10}" value=""
					title="Số điện thoại không hợp lệ" required>
			</fieldset>
			<fieldset class="taotk_field">
				<label>Nghề nghiệp</label>
				<input name="job" type="text" value="" required>
			</fieldset>
			<fieldset class="taotk_field">
				<label>Số sổ hộ khẩu</label>
				<input name="shk" type="text" value="">
			</fieldset>
			<fieldset class="taotk_field">
				<label>Tên đăng nhập</label>
				<input name="username" type="text" maxlength="255" value="" required>
			</fieldset>
			<fieldset class="taotk_field">
				<label>Mật khẩu</label>
				<input name="password" type="password" maxlength="255" value="" required>
			</fieldset>
			<%
				if (request.getParameter("error") != null) {%>
					<label style="display: block; color: red; font-size: 10px; margin: 0px auto">
						Tên đăng nhập đã tồn tại
					</label>
				<%}
			%>
			<input style="margin-top: 20px" type="submit" value="Đăng ký">
		</form>
	</div>
</body>
</html>