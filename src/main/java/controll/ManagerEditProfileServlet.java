package controll;

import java.io.IOException;
import java.text.SimpleDateFormat;

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import model.*;

@WebServlet("/ManagerEditProfile")
public class ManagerEditProfileServlet extends HttpServlet
{
	private static final long serialVersionUID = 1L;
	public ManagerEditProfileServlet() {
        super();
    }
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
				throws ServletException, IOException{
		response.setContentType("text/html; character=UTF-8");
		request.setCharacterEncoding("UTF-8");
		
		try {
			person s = new person();
			s.setID(Integer.parseInt((String) request.getParameter("id")));
			s.setName(request.getParameter("name"));
			s.setDob(new SimpleDateFormat("dd/MM/yyyy").parse(request.getParameter("dob")));
			s.setHomeTown(request.getParameter("hometown"));
			s.setNation(request.getParameter("nation"));
			s.setCCCD(request.getParameter("cccd"));
			s.setJob(request.getParameter("job"));
			s.setShk(request.getParameter("shk"));
			s.setPhone(request.getParameter("phone"));
			
			userDAO uD = new userDAO();
			if (uD.editPerson(s))
				response.sendRedirect("thong_ke_dan_cu.jsp");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}