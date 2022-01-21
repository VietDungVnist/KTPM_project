package controll;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Random;

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import model.person;

@WebServlet("/RegisterServlet")
public class RegisterServlet extends HttpServlet
{
	private static final long serialVersionUID = 1L;
	public RegisterServlet() {
        super();
    }
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
				throws ServletException, IOException{
		response.setContentType("text/html; character=UTF-8");
		request.setCharacterEncoding("UTF-8");
		try {
			int id = new Random().nextInt(900000) + 1000000;
			String username = request.getParameter("username");
			String password = request.getParameter("password");
			
			person s = new person();
			s.setID(id);
			s.setName(request.getParameter("name"));
			s.setDob(new SimpleDateFormat("dd/MM/yyyy").parse(request.getParameter("dob")));
			s.setHomeTown(request.getParameter("hometown"));
			s.setNation(request.getParameter("nation"));
			s.setCCCD(request.getParameter("cccd"));
			s.setJob(request.getParameter("job"));
			s.setShk(request.getParameter("shk"));
			s.setPhone(request.getParameter("phone"));
			
			userDAO uD = new userDAO();
			if (uD.isValidUsername(username)) {
				response.sendRedirect("dang_ky.jsp?error=1");
			} else {
				uD.addTempAccount(id, username, password);
				uD.addTempPerson(s);
				response.sendRedirect("requestsuccess.jsp");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}