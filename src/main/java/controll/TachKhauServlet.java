package controll;

import java.io.IOException;

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import model.*;


@WebServlet("/TachKhauServlet")
public class TachKhauServlet extends HttpServlet
{
	private static final long serialVersionUID = 1L;
	public TachKhauServlet() {
        super();
    }
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
				throws ServletException, IOException{
		response.setContentType("text/html; character=UTF-8");
		request.setCharacterEncoding("UTF-8");
		HttpSession session = request.getSession(false);
		
		int id = Integer.parseInt((String)session.getAttribute("id"));
		hokhau s = new hokhau();
		new userDAO().getPersonByID(id).getShk();
		s.setId_chuho(id);
		s.setDiachi(request.getParameter("diachi"));
		s.setShk(new userDAO().getPersonByID(id).getShk());
		
		if (new userDAO().addTachKhauRequest(s)) {
			response.sendRedirect("requestsuccess.jsp");
		} else {
			response.sendRedirect("error.jsp");
		}
	}
}