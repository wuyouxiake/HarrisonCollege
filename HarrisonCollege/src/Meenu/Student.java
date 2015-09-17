package Meenu;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityTransaction;
import javax.persistence.TypedQuery;

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
	
	
	public static void dropClass(long studentID, String classID){
			EntityManager em = DBUtil.getEmFactory().createEntityManager();
			String q = "SELECT h FROM Hclassenrollment h where h.hstudent = ?1 and h.enrolled ='yes' and h.hclass=?2";
			TypedQuery<Hclassenrollment> bq = DBUtil.createQuery(q, Hclassenrollment.class).setParameter(1, getStudent(studentID)).setParameter(2, getClass(classID));
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
	
	
	public static void enrollAgain(long studentID, String classID){
		EntityManager em = DBUtil.getEmFactory().createEntityManager();
		String q = "SELECT h FROM Hclassenrollment h where h.hstudent = ?1 and h.enrolled ='no' and h.hclass=?2";
		TypedQuery<Hclassenrollment> bq = DBUtil.createQuery(q, Hclassenrollment.class).setParameter(1, getStudent(studentID)).setParameter(2, getClass(classID));
		Hclassenrollment thisclass = bq.getSingleResult();
		System.out.println(thisclass.getHclass().getClassId());
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
	
	
	
	
	public static List<Hclassenrollment> getSchedule(long studentID){
		//EntityManager em = DBUtil.getEmFactory().createEntityManager();
		String q = "SELECT h FROM Hclassenrollment h where h.hstudent = ?1 and h.enrolled ='yes'";
		TypedQuery<Hclassenrollment> bq = DBUtil.createQuery(q, Hclassenrollment.class).setParameter(1, getStudent(studentID));
		List<Hclassenrollment> myclasses = bq.getResultList();
		return myclasses;
	}
	
	
	public static Hstudent getStudent(long studentID){
		//EntityManager em = DBUtil.getEmFactory().createEntityManager();
		String q = "SELECT h FROM Hstudent h where h.studentId =" +studentID;
		TypedQuery<Hstudent> bq = DBUtil.createQuery(q, Hstudent.class);
		Hstudent student = bq.getSingleResult();
		return student;
	}
	
	public static Hclass getClass(String classID){
		EntityManager em = DBUtil.getEmFactory().createEntityManager();
		String q = "SELECT h FROM Hclass h where h.classId =" +classID;
		TypedQuery<Hclass> bq = em.createQuery(q, Hclass.class);
		Hclass Class = bq.getSingleResult();
		return Class;
	}
	

	public static boolean checkschedule(long studentID, String classID, int capacity, int stime, int etime){
		boolean check = false;
		int dbstime =0;
		int dbetime =0;
		int x = 0;
		EntityManager em = DBUtil.getEmFactory().createEntityManager();
		//Check if the student has signed up for the class before
		String q = "SELECT h FROM Hclassenrollment h where h.hclass = ?1 and h.hstudent = ?2";
		TypedQuery<Hclassenrollment> bq = em.createQuery(q, Hclassenrollment.class).setParameter(1, getClass(classID)).setParameter(2, getStudent(studentID));
		List<Hclassenrollment> list = bq.getResultList();
		
		if(list!=null && !list.isEmpty())
		{
			for(Hclassenrollment temp: list)
			{
				if(temp.getEnrolled().equalsIgnoreCase("no"));
				enrollAgain(studentID, classID);
				
			}
		}
		
		if(list.isEmpty())
		{
			//if they have not signed up for the class, we will check the capacity
			String q1 = "SELECT count(h) FROM Hclassenrollment h where h.hclass = ?1 and h.enrolled = 'yes'";
			TypedQuery<Long> bq1 = em.createQuery(q1, Long.class).setParameter(1, getClass(classID));
			long count = bq1.getSingleResult();
			if(bq1.getSingleResult()==null)
				count = 0;
			if(count<capacity)
			{
				//if there is room in the classroom, now check the students schedule
				String q2 = "SELECT h FROM Hclassenrollment h where h.hstudent = ?1 and h.enrolled ='yes'";
				TypedQuery<Hclassenrollment> bq2 = em.createQuery(q2, Hclassenrollment.class).setParameter(1, getStudent(studentID));	
				List<Hclassenrollment> list1 = bq2.getResultList();
				for(Hclassenrollment temp: list1)
				{
					dbstime = Integer.parseInt(temp.getHclass().getStarttime());
					System.out.println(dbstime);
					dbetime = Integer.parseInt(temp.getHclass().getEndtime());
					System.out.println(dbetime);
					System.out.println(stime);
					System.out.println(etime);
					if(stime>=(dbetime+20) || etime<=(dbstime-60))
					{
						x=0;
					}
					else{
						x=1;
						break;
					}
						}
				if(x==0)
					check = true;
			}
			
		}
		else{
			
			check = false;
		}
		
		return check;
	}
	
	
	
	}
	
	
	
