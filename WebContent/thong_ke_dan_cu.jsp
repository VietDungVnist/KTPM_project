<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "controll.*" %>
<%@ page import = "model.*" %>
<%@ page import="java.util.ArrayList"%>
<%@ page import = "java.text.*" %>

<!doctype html>
<html>
<head>
	<meta charset="utf-8">
	<title>DSTHA - Phần mềm quản lý dân cư</title>
	<link rel="stylesheet" type="text/css" href=".\my-css\dinh_dang_trang_chu.css"/>
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
	
	<div style="margin-top: 40px">
		<div id="thongkesobo">
			<%
				ArrayList<person> list_tk = new managerDAO().getList();
				ArrayList<hokhau> list_hk = new managerDAO().getShkList();
				ArrayList<person> list_1 = new managerDAO().getRegisterRequest();
				ArrayList<person> list_2 = new managerDAO().getTachKhauRequest();
				String soluongtk = String.valueOf(list_tk.size())+" người";
				String soluonghk = String.valueOf(list_hk.size())+" hộ dân";
				String soluongyc = String.valueOf(list_1.size() + list_2.size()) + " yêu cầu";
			%>
			<div style="display: inline-block; margin: 0px 90px">
				<img src="img\nguoi.png" class="sobo_icon" height="50px"
							style="vertical-align: middle; display: inline; margin-right: 10px">
				<div class="sobo_icon" style="display: inline-block; vertical-align: middle; 
								text-align: left; color: white">
					<b style="display: inline-block"><%= soluongtk%></b>
					<br />
					<div style="display: inline-block; font-size: 13px">Đã đăng ký phần mềm</div>
				</div>
			</div>
			<div style="display: inline-block; margin: 0px 90px">
				<img src="img\hodan.png" class="sobo_icon" height="50px"
							style="vertical-align: middle; display: inline; margin-right: 10px">
				<div class="sobo_icon" style="display: inline-block; vertical-align: middle; 
								text-align: left; color: white">
					<b style="display: inline-block"><%= soluonghk %></b>
					<br />
					<div style="display: inline-block; font-size: 13px" >Tổng cộng</div>
				</div>
			</div>
			<div style="display: inline-block; margin: 0px 90px">
				<img src="img\xuly.png" class="sobo_icon" height="50px"
							style="vertical-align: middle; display: inline; margin-right: 10px">
				<div class="sobo_icon" style="display: inline-block; vertical-align: middle; 
								text-align: left; color: white">
					<b style="display: inline-block"><%= soluongyc %></b>
					<br />
					<div style="display: inline-block; font-size: 13px">Đang chờ xử lý</div>
				</div>
			</div>
		</div>
	</div>
	<div style="width: 80%; margin: auto; padding: 30px 0px; text-align: center
				background-color: white">
		<h1>Danh sách người dân</h1>
		<br />
		<table id="tbldancu">
			<tr>
				<th style="width: 40px"></th>
				<th>Họ và tên</th>
				<th>Số CCCD</th>
				<th>Ngày sinh</th>
				<th>Quê quán</th>
				<th>Dân tộc</th>
				<th>SĐT</th>
				<th>Nghề nghiệp</th>
				<th>Số sổ hộ khẩu</th>
				<th colspan="2">Thao tác</th>
			</tr>
			<%
				int i = 1;
				for (person s: list_tk) {
					String urle = "sua_thong_tin.jsp?id=" + s.getID();
					String urlr = "RemovePerson?id=" + s.getID();
			%>
		
			<tr>
				<td><%= i++ %></td>
				<td><%= s.getName() %></td>
				<td><%= s.getCCCD() %></td>
				<td><%= new SimpleDateFormat("dd/MM/yyyy").format(s.getDob()) %></td>
				<td><%= s.getHomeTown()%></td>
				<td><%= s.getNation() %></td>
				<td><%= s.getPhone() %></td>
				<td><%= s.getJob() %></td>
				<td><%= s.getShk() %></td>
				<td><a href="<%= urle %>">Sửa</a></td>
				<td><a href="<%= urlr %>">Xóa</a></td>
			</tr>
			<% } %>
			</table>
	</div>
</body>
</html>
