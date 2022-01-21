<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "controll.*" %>
<%@ page import = "model.*" %>
<!doctype html>
<html>
<head>
	<meta charset="utf-8">
	<title>Dịch vụ</title>
	<link rel="stylesheet" type="text/css" href=".\my-css\dinh_dang_trang_chu.css" />
</head>
<body>
	<%
		if (session.getAttribute("id") == null) {
			response.sendRedirect("dang_nhap.jsp");
		}
	%>
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
	<%
		if (session.getAttribute("id") != null
			&& Integer.parseInt((String) session.getAttribute("id")) > 10) { %>
	<div class="job_list">
		<div style="text-align: center">
			<h1 id="dichvu_title">Dịch vụ</h1>
			<a href="changeprofile.jsp" class="button_dichvu">
				<img src="img\user1.png" width="45%">
			</a>
			<a href="tach_khau.jsp" class="button_dichvu">
				<img src="img\user2.png" width="45%">
			</a>
			<a href="them_nhan_khau.jsp" class="button_dichvu">
				<img src="img\user3.png" width="45%">
			</a>
			<a href="#" class="button_dichvu">
				<img src="img\user4.png" width="45%">
			</a>
		</div>
	</div>
	<% } %>
	
	<%
		if (session.getAttribute("id") != null
			&& Integer.parseInt((String) session.getAttribute("id")) <= 10) { %>
	
		<div class="job_list">
			<div style="text-align: center">
				<h1 id="dichvu_title">Dịch vụ</h1>
				<a href="thong_ke_ho_dan.jsp" class="button_dichvu">
					<img src="img\ql1.png" width="300px" style="margin: 10px">
				</a>
				<a href="thong_ke_dan_cu.jsp" class="button_dichvu">
					<img src="img\ql2.png" width="300px" style="margin: 10px">
				</a>
				<a href="thong_bao.jsp" class="button_dichvu">
					<img src="img\ql3.png" width="300px" style="margin: 10px">
				</a>
				<a href="search_person.jsp" class="button_dichvu">
					<img src="img\ql4.png" width="300px" style="margin: 10px">
				</a>
			</div>
		</div>
	<% } %>
</body>
</html>