package brandon;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.*;
import customTools.DBUtil;

/**
 * Servlet implementation class OfficialInfo
 */
@WebServlet("/OfficialInfo")
public class OfficialInfo extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public OfficialInfo() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Hofficial official = DBUtil.find(Long.parseLong(request.getParameter("id")),Hofficial.class);
		String info = displayOfficialInfo(official);
		String classes = displayOfficialClasses(official);
		request.setAttribute("info", info);
		request.setAttribute("classes",classes);
		getServletContext().getRequestDispatcher("/AdminInfo.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}
	
	protected static String displayOfficialInfo(Hofficial official){
		StringBuilder display = new StringBuilder();
		display.append("<div class=\"container\">"+official.getOfficialId() + " " + official.getHuser().getName() + " "+ official.getHdepartment().getName()+ " " + official.getOfficeNumber() + "</div>");
		return display.toString();
	}
	
	protected static String displayOfficialClasses(Hofficial official){
		return AdminSearch.displayClasses(official.getHclasses());
	}

}