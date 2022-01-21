package controll;

import java.io.IOException;

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet
{
	private static final long serialVersionUID = 1L;
	public LoginServlet() {
        super();
    }
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
				throws ServletException, IOException{
		response.setContentType("text/html; character=UTF-8");
		try {
			String username = request.getParameter("username");
			String password = request.getParameter("password");
			
			userDAO uD = new userDAO();
			int isValid = uD.checkLogin(username, password);
			HttpSession session = request.getSession();
			String url;
			
			if (isValid != -1) {
				session.setAttribute("username", username);	
				session.setAttribute("id", String.valueOf(isValid));
				url = "trang_chu.jsp";
			} else {
				url = "dang_nhap.jsp?error=1";
			}
			response.sendRedirect(url);
			return;
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
}