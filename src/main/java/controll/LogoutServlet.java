package controll;

import java.io.IOException;

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/LogoutServlet")
public class LogoutServlet extends HttpServlet
{
	private static final long serialVersionUID = 1L;
	public LogoutServlet() {
        super();
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
				throws ServletException, IOException{
		response.setContentType("text/html; character=UTF-8");
		HttpSession session = request.getSession(false);
		if (session != null) {
			session.removeAttribute("username");
			session.removeAttribute("id");
			response.sendRedirect("trang_chu.jsp");
			return;
		}
	}
}