package controll;

import java.io.IOException;

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/AddAccount")
public class AddAccount extends HttpServlet
{
	private static final long serialVersionUID = 1L;
	public AddAccount() {
        super();
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
				throws ServletException, IOException{
		response.setContentType("text/html; character=UTF-8");
		try {
			int id = Integer.parseInt(request.getParameter("id"));
			
			if (new managerDAO().addPersonFromTemp(id) && new managerDAO().addAccountFromTemp(id)) {
				response.sendRedirect("RemoveRegisterRequest?id=" + String.valueOf(id));
			} else {
				response.sendRedirect("error.jsp");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}