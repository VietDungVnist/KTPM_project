<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "controll.*" %>
<%@ page import = "model.*" %>
<%@ page import = "java.text.*" %>
<!doctype html>
<html>
<head>
	<meta charset="utf-8">
	<title>DSTHA - Phần mềm quản lý dân cư</title>
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
	<div class="tao_tai_khoan" style="width: 40%">
		<%
			int id = Integer.parseInt((String)session.getAttribute("id"));
			person s = new userDAO().getPersonByID(id);
			System.out.println(s.getDob());
			
		%>
		<div id="taotaikhoan">Thông tin cá nhân</div>
		<div>
			<fieldset class="taotk_field">
				<label>Họ và tên</label>
				<input readonly type="text" value="<%=s.getName() %>" required>
			</fieldset>
			<fieldset class="taotk_field">
				<label>Số CCCD</label>
				<input readonly type="text" value="<%=s.getCCCD() %>" pattern="[0-9]{12}"
					title="Số CCCD không hợp lệ" required>
			</fieldset>
			<fieldset class="taotk_field">
				<label>Ngày sinh</label>
				<input readonly type="text" value="<%=new SimpleDateFormat("dd/MM/yyyy").format(s.getDob()) %>" 
					required>
			</fieldset>
			<fieldset class="taotk_field">
				<label>Quê quán</label>
				<input readonly type="text" value="<%=s.getHomeTown() %>" required>
			</fieldset>
			<fieldset class="taotk_field">
				<label>Dân tộc</label>
				<input readonly type="text" value="<%=s.getNation() %>" required>
			</fieldset>
			<fieldset class="taotk_field">
				<label>Số điện thoại</label>
				<input readonly type="text" pattern="[0-9]{10}" value="<%=s.getPhone() %>"
					title="Số điện thoại không hợp lệ" required>
			</fieldset>
			<fieldset class="taotk_field">
				<label>Nghề nghiệp</label>
				<input readonly type="text" value="<%=s.getJob() %>" required>
			</fieldset>
			<fieldset class="taotk_field">
				<label>Số sổ hộ khẩu</label>
				<input readonly type="text" value="<%=s.getShk() %>" required>
			</fieldset>
			<div style="text-align: center">
				<a href="trang_chu.jsp">
					<button class="submit_view_profile">Quay lại</button>
				</a>
				<a href="changeprofile.jsp">
					<button class="submit_view_profile">Sửa thông tin</button>
				</a>
			</div>
		</div>
	</div>
</body>
</html>
