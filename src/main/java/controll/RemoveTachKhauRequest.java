package controll;

import java.io.IOException;

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/RemoveTachKhauRequest")
public class RemoveTachKhauRequest extends HttpServlet
{
	private static final long serialVersionUID = 1L;
	public RemoveTachKhauRequest() {
        super();
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
				throws ServletException, IOException{
		response.setContentType("text/html; character=UTF-8");
		try {
			int id = Integer.parseInt(request.getParameter("id"));
			
			if (new managerDAO().removeTachKhauRequest(id)) {
				response.sendRedirect("thong_bao.jsp");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}