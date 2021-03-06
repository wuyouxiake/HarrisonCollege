package Meenu;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityTransaction;
import javax.persistence.TypedQuery;
import javax.servlet.http.HttpSession;

import customTools.DBUtil;
import model.*;

public class Student {

	public static void addClass(Hclassenrollment student) {
		EntityManager em = DBUtil.getEmFactory().createEntityManager();
		EntityTransaction trans = em.getTransaction();
		trans.begin();
		try {
			em.persist(student);
			trans.commit();
		} catch (Exception e) {
			System.out.println(e);
			trans.rollback();
		} finally {
			em.close();
		}
	}

	public static void dropClass(long studentID, String classID) {
		EntityManager em = DBUtil.getEmFactory().createEntityManager();
		String q = "SELECT h FROM Hclassenrollment h where h.hstudent = ?1 and h.enrolled ='yes' and h.hclass=?2";
		TypedQuery<Hclassenrollment> bq = DBUtil
				.createQuery(q, Hclassenrollment.class)
				.setParameter(1, getStudent(studentID))
				.setParameter(2, getClass(classID));
		Hclassenrollment thisclass = bq.getSingleResult();
		EntityTransaction trans = em.getTransaction();
		trans.begin();
		try {
			thisclass.setGrade("W");
			thisclass.setEnrolled("no");
			em.merge(thisclass);
			trans.commit();
		} catch (Exception e) {
			System.out.println(e);
			trans.rollback();
		} finally {
			em.close();
		}
	}

	public static void enrollAgain(long studentID, String classID) {
		EntityManager em = DBUtil.getEmFactory().createEntityManager();
		String q1 = "SELECT h FROM Hclassenrollment h where h.hstudent = ?1 and h.enrolled ='no' and h.hclass=?2";
		TypedQuery<Hclassenrollment> bq1 = DBUtil
				.createQuery(q1, Hclassenrollment.class)
				.setParameter(1, getStudent(studentID))
				.setParameter(2, getClass(classID));
		Hclassenrollment thisclass = bq1.getSingleResult();
		if(thisclass == null)
			System.out.println("NE");
		EntityTransaction trans = em.getTransaction();
		trans.begin();
		try {
			thisclass.setEnrolled("yes");
			em.merge(thisclass);
			trans.commit();
		} catch (Exception e) {
			System.out.println(e);
			trans.rollback();
		} finally {
			em.close();
		}

	}

	public static List<Hclassenrollment> getSchedule(long studentID) {
		// EntityManager em = DBUtil.getEmFactory().createEntityManager();
		String q = "SELECT h FROM Hclassenrollment h where h.hstudent = ?1 and h.enrolled ='yes'";
		TypedQuery<Hclassenrollment> bq = DBUtil.createQuery(q,
				Hclassenrollment.class).setParameter(1, getStudent(studentID));
		List<Hclassenrollment> myclasses = bq.getResultList();
		return myclasses;
	}

	public static Hstudent getStudent(long studentID) {
		// EntityManager em = DBUtil.getEmFactory().createEntityManager();
		String q = "SELECT h FROM Hstudent h where h.studentId =" + studentID;
		TypedQuery<Hstudent> bq = DBUtil.createQuery(q, Hstudent.class);
		Hstudent student = bq.getSingleResult();
		return student;
	}

	public static Hclass getClass(String classID) {
		EntityManager em = DBUtil.getEmFactory().createEntityManager();
		String q = "SELECT h FROM Hclass h where h.classId =" + classID;
		TypedQuery<Hclass> bq = em.createQuery(q, Hclass.class);
		Hclass Class = bq.getSingleResult();
		return Class;
	}


	
	
	public static int checkschedule(long studentID, String classID,	int capacity, int stime, int etime, String currentYear, String currentSemester) {
		int check = 0;
		int dbstime = 0;
		int dbetime = 0;
		String weekday = "";
		EntityManager em = DBUtil.getEmFactory().createEntityManager();
		
		//checking if the student has signed up for that class before
		String q = "SELECT h FROM Hclassenrollment h where h.hclass = ?1 and h.hstudent = ?2";
		TypedQuery<Hclassenrollment> bq = em
				.createQuery(q, Hclassenrollment.class)
				.setParameter(1, getClass(classID))
				.setParameter(2, getStudent(studentID));
		List<Hclassenrollment> studentandclass = bq.getResultList();
		System.out.println("studentandclass "+studentandclass);
		if(studentandclass.isEmpty())
			check = 1;
		//checking for room capacity
		String q1 = "SELECT count(h) FROM Hclassenrollment h where h.hclass = ?1 and h.enrolled = 'yes'";
		TypedQuery<Long> bq1 = em.createQuery(q1, Long.class).setParameter(
				1, getClass(classID));
		long count = bq1.getSingleResult();
		System.out.println(count);
		System.out.println(capacity);
		if (count < capacity) {

			//if there is room then check the for classes on the same day
			//get the days of the week this class happens on
			for(Hclassenrollment temp : studentandclass)
			{
				weekday = temp.getHclass().getDay();
			}
			List<String> dow = getDays(weekday);
			for (String day : dow) {
				System.out.println(day);
			TypedQuery<Hclass> q4 = DBUtil
					.createQuery(
							"SELECT h.hclass FROM Hclassenrollment h where h.hstudent = ?1 and h.hclass.year = ?2 and h.hclass.semester = ?3 and h.hclass.day like ?4",
							Hclass.class)
					.setParameter(1, getStudent(studentID))
					.setParameter(2, currentYear)
					.setParameter(3, currentSemester)
					.setParameter(4, "%" + day + "%");
			List<Hclass> sameday = q4.getResultList();
			System.out.println("classes in same day"+sameday);
			for(Hclass temp2 : sameday)
			{
				
				dbstime = Integer.parseInt(temp2.getStarttime());
				dbetime = Integer.parseInt(temp2.getEndtime());
				if (!studentandclass.isEmpty())
				{
					System.out.println("updating!!");
					for (Hclassenrollment temp : studentandclass)
					{
						if (temp.getEnrolled().equalsIgnoreCase("no"))
						{
							System.out.println("enrolled is " +temp.getEnrolled());
							check= 0; //true is enroll again
						}
					}
				}
				else if (studentandclass.isEmpty()){
					System.out.println(stime);
					System.out.println(etime);
					System.out.println(dbstime);
					System.out.println(dbetime);

					if (stime > dbetime || etime < dbstime){
						System.out.println("same time");
						check = 1; //false is add new class
						
				}
					else
						check = 2;
			}
			
			}
			
		}
		}
		return check;
		}
		
	
public static List<String> getDays(String weekday) {
		
		List<String> dayList = new ArrayList<String>();
		for (int i = 0; i < weekday.length(); i++) {
			char c = weekday.charAt(i);
			dayList.add(Character.toString(c));
		}
		return dayList;
	}


	
	

}