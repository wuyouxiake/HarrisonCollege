package brandon;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import customTools.DBUtil;
import model.*;

/**
 * Servlet implementation class AdminSearch
 */
@WebServlet("/AdminSearch")
public class AdminSearch extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public AdminSearch() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {

		getServletContext().getRequestDispatcher("/AdminSearch.jsp").forward(
				request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		String criteria = request.getParameter("select");
		System.out.println(criteria);
		if (departmentFormAvailable(request)) {
			Admin.createDepartment(request.getParameter("code"),
					request.getParameter("name"));
		}
		else if(courseFormAvailable(request)){
			Hdepartment department = DBUtil.find(Long.parseLong(request.getParameter("selDepartment")), Hdepartment.class);
			System.out.println(department.getName());
			Admin.createCourse(department, 
					request.getParameter("subject"), Integer.parseInt(request.getParameter("hours")));
		}
		else if(majorFormAvailable(request)){
			Hdepartment department = DBUtil.find(Long.parseLong(request.getParameter("selDepartment")), Hdepartment.class);
			System.out.println(department.getName());
			Admin.createMajor(department, request.getParameter("name"));
		}
		else if(classFormAvailable(request)){
			Hclassroom classroom = DBUtil.find(Long.parseLong(request.getParameter("selClassroom")), Hclassroom.class);
			Hcours course = DBUtil.find(Long.parseLong(request.getParameter("selCourse")), Hcours.class);
			System.out.println(request.getParameter("selDay"));
			Admin.createClass(course, printDays(request), request.getParameter("startTime"), request.getParameter("endTime")
					, request.getParameter("selSemester"), request.getParameter("year"));
		}
		String display = displaySearchList(criteria);
		request.setAttribute("display", display);

		doGet(request, response);
	}

	protected String displaySearchList(String criteria) {

		switch (criteria) {
		case ("students"):
			return displayStudents(Admin.getAllStudents());
		case ("instructors"):
			return displayInstructors(Admin.getAllInstructors());
		case ("advisors"):
			return displayAdvisors(Admin.getAllAdvisors());
		case ("departments"):
			return displayDepartments(Admin.getAllDepartments());
		case ("courses"):
			return displayCourses(Admin.getAllCourses());
		case ("majors"):
			return displayMajors(Admin.getAllMajors());
		case ("classes"):
			return displayClasses(Admin.getAllClasses());
		case ("classrooms"):
			return displayClassrooms(Admin.getAllClassrooms());
		default:
			return "";
		}
	}

	protected String displayStudents(List<Hstudent> students) {
		StringBuilder display = new StringBuilder();
		display.append("<div class=\"container\"><h2>Students</h2>"
				+ "<table class=\"table table-hover\"><thead><tr><th>Id</th><th>Name</th><th>Entry Year</th></tr></thead><tbody>");
		for (Hstudent s : students) {
			display.append("<tr class='clickable-row' data-href= \"AdminCreate.jsp\"><td>"
					+ s.getStudentId()
					+ "</td><td>"
					+ s.getHuser().getName()
					+ "</td><td>" + s.getEntryYear() + "</td></tr>");
		}
		display.append("</tbody></table></div>");
		return display.toString();
	}

	protected String displayInstructors(List<Hofficial> instructors) {
		StringBuilder display = new StringBuilder();
		display.append("<div class=\"container\"><h2>Instructors</h2>"
				+ "<table class=\"table table-hover\"><thead><tr><th>Id</th><th>Name</th><th>Department</th> <th>Office #</th></tr></thead><tbody>");

		for (Hofficial i : instructors) {
			display.append("<tr class='clickable-row' data-href= \"AdminCreate.jsp\"><td>"
					+ i.getOfficialId()
					+ "</td><td>"
					+ i.getHuser().getName()
					+ "</td><td>"
					+ i.getHdepartment().getName()
					+ "</td><td>"
					+ i.getOfficeNumber() + "</td></tr>");
		}
		display.append("</tbody></table></div>");
		return display.toString();
	}

	protected String displayAdvisors(List<Hofficial> advisors) {
		StringBuilder display = new StringBuilder();
		display.append("<div class=\"container\"><h2>Advisors</h2>"
				+ "<table class=\"table table-hover\"><thead><tr><th>Id</th><th>Name</th><th>Department</th> <th>Office #</th></tr></thead><tbody>");

		for (Hofficial a : advisors) {
			display.append("<tr class='clickable-row' data-href= \"AdminCreate.jsp\"><td>"
					+ a.getOfficialId()
					+ "</td><td>"
					+ a.getHuser().getName()
					+ "</td><td>"
					+ a.getHdepartment().getName()
					+ "</td><td>"
					+ a.getOfficeNumber() + "</td></tr>");
		}
		display.append("</tbody></table></div>");
		return display.toString();
	}

	protected String displayDepartments(List<Hdepartment> departments) {
		StringBuilder display = new StringBuilder();
		display.append(departmentCreationForm());
		display.append("<div class=\"container\"><h2>Departments</h2>"
				+ "<table class=\"table table-hover\"><thead><tr><th>Code</th><th>Name</th></tr></thead><tbody>");
		for (Hdepartment d : departments) {
			display.append("<tr class='clickable-row' data-href= \"AdminCreate.jsp\"><td>"
					+ d.getCode() + "</td><td>" + d.getName() + "</td></tr>");
		}
		display.append("</tbody></table></div>");
		return display.toString();
	}

	protected String displayCourses(List<Hcours> courses) {
		StringBuilder display = new StringBuilder();
		display.append(courseCreationForm());
		display.append("<div class=\"container\"><h2>Courses</h2>"
				+ "<table class=\"table table-hover\"><thead><tr><th>Subject</th><th>Credit Hours</th></tr></thead><tbody>");
		for (Hcours c : courses) {
			display.append("<tr class='clickable-row' data-href= \"AdminCreate.jsp\"><td>"
					+ c.getSubject()
					+ "</td><td>" + c.getCreditHours() + "</td></tr>");
		}
		display.append("</tbody></table></div>");
		return display.toString();
	}

	protected String displayMajors(List<Hmajor> majors) {
		StringBuilder display = new StringBuilder();
		display.append(majorCreationForm());
		display.append("<div class=\"container\"><h2>Majors</h2>"
				+ "<table class=\"table table-hover\"><thead><tr><th>Name</th><th>Department</th></tr></thead><tbody>");
		for (Hmajor m : majors) {
			display.append("<tr nclass='clickable-row' data-href= \"AdminCreate.jsp\"><td>"
					+ m.getName()
					+ "</td><td>"
					+ m.getHdepartment().getName()
					+ "</td></tr>");
		}
		display.append("</tbody></table></div>");
		return display.toString();
	}

	protected String displayClasses(List<Hclass> classes) {
		StringBuilder display = new StringBuilder();
		display.append(classCreationForm());
		display.append("<div class=\"container\"><h2>Classes</h2>"
				+ "<table class=\"table table-hover\"><thead><tr><th>Id</th><th>Subject</th><th>Day</th>"
				+ "<th>Start Time</th><th>End Time</th><th>Semester</th><th>Year</th></tr></thead><tbody>");
		for (Hclass c : classes) {
			display.append("<tr class='clickable-row' data-href= \"AdminCreate.jsp\"><td>"
					+ c.getHcours().getCourseId()
					+ "</td><td>"
					+ c.getHcours().getSubject()
					+ "</td><td>"
					+ c.getDay()
					+ "</td><td>"
					+ c.getStarttime()
					+ "</td><td>"
					+ c.getEndtime()
					+ "</td><td>"
					+ c.getSemester()
					+ "</td><td>" + c.getYear() + "</td></tr>");
		}
		display.append("</tbody></table></div>");
		return display.toString();
	}

	protected String displayClassrooms(List<Hclassroom> classrooms) {
		StringBuilder display = new StringBuilder();
		display.append("<div class=\"container\"><h2>Classrooms</h2>"
				+ "<table class=\"table table-hover\"><thead><tr><th>Room Number</th><th>Building</th><th>Capacity</th></tr></thead><tbody>");
		for (Hclassroom c : classrooms) {
			display.append("<tr class='clickable-row' data-href= \"AdminCreate.jsp\"><td>"
					+ c.getRoomNumber()
					+ "</td><td>"
					+ c.getBuilding()
					+ "</td><td>" + c.getCapacity() + "</td></tr>");
		}
		display.append("</tbody></table></div>");
		return display.toString();
	}

	protected String departmentCreationForm() {
		return "<div class=\"container\"><form class=\"form-inline\" role=\"form\" method=\"post\" action=\"AdminSearch\">"
				+ "<div class=\"form-group\"><label for=\"code\">Code:</label><input type=\"text\" class=\"form-control\""
				+ " id=\"code\" name =\"code\" placeholder=\"Enter Code\"></div><div class=\"form-group\"><label for=\"name\">Name:</label>"
				+ "<input type=\"text\" class=\"form-control\" id=\"name\" name =\"name\" placeholder=\"Enter Name\"></div>"
				+ "<input type=\"hidden\" name=\"select\" value=\"departments\"/>"
				+ "<button type=\"submit\" class=\"btn btn-default\">Add</button></form></div>";

	}

	protected String courseCreationForm() {
		return "<div class=\"container\"><form class=\"form-inline\" role=\"form\" method=\"post\" action=\"AdminSearch\">"
				+ "<div class=\"form-group\"><label for=\"subject\">Subject</label>"
				+ "<input type=\"text\" class=\"form-control\" id=\"subject\" name =\"subject\" placeholder=\"Enter Subject\"></div>"
				+ "<div class=\"form-group\"><label for=\"hours\">Credit Hours:</label>"
				+ "<input type=\"number\" class=\"form-control\" id=\"hours\" name =\"hours\" placeholder=\"Enter Credit Hours\"></div>"
				+ "<div class=\"form-group\"><label for=\"selDepartment\">Select Department:</label>"
				+ "<select class=\"form-control\" id=\"selDepartment\" name =\"selDepartment\">"
				+ listDepartments()
				+ "</select></div>"
				+ "<input type=\"hidden\" name=\"select\" value=\"courses\"/>"
				+ "<button type=\"submit\" class=\"btn btn-default\">Add</button></form></div>";

	}
	

	protected String majorCreationForm() {
		return "<div class=\"container\"><form class=\"form-inline\" role=\"form\" method=\"post\" action=\"AdminSearch\">"
				+ "<div class=\"form-group\"><label for=\"name\">Name</label>"
				+ "<input type=\"text\" class=\"form-control\" id=\"name\" name =\"name\" placeholder=\"Enter Name\"></div>"
				+ "<div class=\"form-group\"><label for=\"selDepartment\">Select Department:</label>"
				+ "<select class=\"form-control\" id=\"selDepartment\" name =\"selDepartment\">"
				+ listDepartments()
				+ "</select></div>"
				+ "<input type=\"hidden\" name=\"select\" value=\"majors\"/>"
				+ "<button type=\"submit\" class=\"btn btn-default\">Add</button></form></div>";

	}
	
	protected String classCreationForm() {
		return "<div class=\"container\"><form class=\"form-inline\" role=\"form\" method=\"post\" action=\"AdminSearch\">"
				+ "<div class=\"form-group\"><label for=\"selCours\">Select Course:</label>"
				+ "<select class=\"form-control\" id=\"selCourse\" name =\"selCourse\">"
				+ listCourses()
				+ "</select></div>"
				
				+ "<div class=\"form-group\"><label for=\"selClassroom\">Select Classroom:</label>"
				+ "<select class=\"form-control\" id=\"selClassroom\" name =\"selClassroom\">"
				+ listClassrooms()
				+ "</select></div>"
				
				+"<div class =\"form-group\"><label class=\"checkbox-inline\"><input type=\"checkbox\" name=\"monday\" value=\"M\">M</label>"
				+"<label class=\"checkbox-inline\"><input type=\"checkbox\" name=\"tuesday\" value=\"T\">T</label><label class=\"checkbox-inline\">"
				+"<input type=\"checkbox\" name=\"wednesday\" value=\"W\">W</label><label class=\"checkbox-inline\"><input type=\"checkbox\" name=\"thursday\" value=\"H\">H"
				+"</label><label class=\"checkbox-inline\"><input type=\"checkbox\" name=\"friday\" value=\"F\">F</label></div>"
				
				+ "<div class=\"form-group\"><label for=\"startTime\">Start Time:</label>"
				+ "<input type=\"text\" class=\"form-control\" id=\"startTime\" name =\"startTime\" placeholder=\"Enter Start Time\"></div>"
				
				+ "<div class=\"form-group\"><label for=\"endTime\">End Time:</label>"
				+ "<input type=\"text\" class=\"form-control\" id=\"endTime\" name =\"endTime\" placeholder=\"Enter End Time\"></div>"
				
				+ "<div class=\"form-group\"><label for=\"selSemester\">Select Semester:</label>"
				+ "<select class=\"form-control\" id=\"selSemester\" name =\"selSemester\">"
				+ "<option value =\"Fall\">Fall</option><option value =\"Spring\">Spring</option>"
				+ "</select></div>"
				
				+ "<div class=\"form-group\"><label for=\"year\">Year:</label>"
				+ "<input type=\"number\" class=\"form-control\" id=\"year\" name =\"year\" min =\"2015\" max = \"2070\" value=\"2015\"></div>"

				+ "<input type=\"hidden\" name=\"select\" value=\"classes\"/>"
				+ "<button type=\"submit\" class=\"btn btn-default\">Add</button></form></div>";

	}
	


	protected String listDepartments() {
		StringBuilder listDepart = new StringBuilder();
		for (Hdepartment d : Admin.getAllDepartments()) {
			;
			listDepart.append("<option value= " + d.getDepartmentId() + ">"
					+ d.getCode() + " " + d.getName() + "</option>");
		}
		return listDepart.toString();
	}
	
	protected String listCourses() {
		StringBuilder listCourses = new StringBuilder();
		for (Hcours d : Admin.getAllCourses()) {
			;
			listCourses.append("<option value= " + d.getCourseId() + ">"
					+ d.getSubject() + "</option>");
		}
		return listCourses.toString();
	}
	
	protected String listClassrooms() {
		StringBuilder listClassrooms = new StringBuilder();
		for (Hclassroom d : Admin.getAllClassrooms()) {
			;
			listClassrooms.append("<option value= " + d.getClassroomId() + ">"
					+ d.getBuilding() + " " + d.getRoomNumber() +"</option>");
		}
		return listClassrooms.toString();
	}

	protected boolean departmentFormAvailable(HttpServletRequest request) {
		if (request.getParameter("code") != null
				&& request.getParameter("name") != null) {
			System.out.println("departmentForm is available");
			return true;
		} else
			return false;
	}
	
	protected boolean majorFormAvailable(HttpServletRequest request) {
		if (request.getParameter("name") != null
				&& request.getParameter("selDepartment") != null) {
			System.out.println("majorForm is available");
			return true;
		} else
			return false;
	}

	protected boolean courseFormAvailable(HttpServletRequest request) {
		if ( request.getParameter("selDepartment") != null
				&& request.getParameter("subject") != null
				&& request.getParameter("hours") != null) {
			System.out.println("courseForm is available");
			return true;
		} else
			return false;
	}
	
	protected boolean classFormAvailable(HttpServletRequest request) {
		if (request.getParameter("selCourse") != null
				&& request.getParameter("selClassroom") != null
				&& request.getParameter("startTime") != null
				&& request.getParameter("endTime") != null
				&& request.getParameter("selSemester") != null
				&& request.getParameter("year") != null) {
			System.out.println("classForm is available");
			return true;
		} else
			return false;
	}
	
	protected String printDays(HttpServletRequest request){
		StringBuilder days = new StringBuilder();
		if(request.getParameter("monday")!=null){
			days.append("M");
		}
		if(request.getParameter("tuesday")!=null){
			days.append("T");
		}
		if(request.getParameter("wednesday")!=null){
			days.append("W");
		}
		if(request.getParameter("thursday")!=null){
			days.append("H");
		}
		if(request.getParameter("friday")!=null){
			days.append("F");
		}
		return days.toString();
	}

}
