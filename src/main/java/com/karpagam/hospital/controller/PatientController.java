package com.karpagam.hospital.controller;

import java.sql.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Arrays;
import java.util.Calendar;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;

import com.karpagam.hospital.model.Appointment;
import com.karpagam.hospital.model.Department;
import com.karpagam.hospital.model.PatientDetail;
import com.karpagam.hospital.model.PatientLogin;
import com.karpagam.hospital.service.Administator;

import jakarta.servlet.http.HttpSession;

@Controller
public class PatientController {
	@Autowired
	Administator administator;
	
	@Autowired
	HttpSession session;
	
	@GetMapping("/patienthome")
	public String home() {
		session.setAttribute("departmentList", administator.getAllDepartments());
		return "PatientHome";
	}
	
	@GetMapping("/signup")
	public String signUp() {
		return "PatientSignUp";
	}
	
	@GetMapping("/signin")
	public String signIn() {
		return "PatientSignIn";
	}
	
	@PostMapping("/validateSignUp")
	public String validateSignUp(PatientDetail pd , String password1 , String password2) {
		String[] email = pd.getEmail().split("@");
		if(email[1].equalsIgnoreCase("gmail.com") && (password1.equals(password2)) && (String.valueOf(pd.getNumber()).length()==10)) {
			PatientLogin pl = new PatientLogin();
			pl.setEmail(pd.getEmail());
			pl.setPassword(password1);
			if(!administator.isExistingPatient(pl)) { 
				administator.savePDetail(pd);
				administator.savePLogin(pl);
				session.setAttribute("success", "yes");
				return "PatientSignIn";
			}else {
				session.setAttribute("exist", "yes");
				return "PatientSignUp";	
			}
		}else {
			session.setAttribute("invalid", "yes");
			return "PatientSignUp";			
		}
	}
	
	@PostMapping("/validateSignIn")
	public String validateSignIn(PatientLogin pl) {
		if(administator.isExistingPatient(pl)) {
			if(administator.isEqualPassword(pl)) {
				PatientDetail pd = administator.getPatient(pl.getEmail());
				session.setAttribute("departmentList", administator.getAllDepartments());
				session.setAttribute("user", pl);
				session.setAttribute("userDetail", pd);
				return "PatientHome";
			}else {
				session.setAttribute("invalid", "passwordWrong");
				return "PatientSignIn";
			}
		}else {
			session.setAttribute("invalid", "notFound");
			return "PatientSignIn";
		}
	}
	
	@GetMapping("/patientprofile")
	public String patientProfile() {
		return "PatientProfile";
	}
	
	@PostMapping("/BookAppointment")
	public ModelAndView bookAppointment(String name,String email,long number,String department,String date,String comment) {
		if(session.getAttribute("user")==null) {
			ModelAndView mv = new ModelAndView("PatientSignIn");
			return mv;
		}else {
			ModelAndView mv = new ModelAndView("PatientViewAppointment");
			//Parsing Given Date
			SimpleDateFormat sdfDate = new SimpleDateFormat("MM/dd/yyyy");
			java.util.Date date1=null;
			try {
				date1 = sdfDate.parse(date);
			} catch (ParseException e) {}
			Date date2 = new Date(date1.getTime()); 
			
			Appointment appointment = new Appointment();
			appointment.setPatientName(name);
			appointment.setEmail(email);
			appointment.setNumber(number);
			appointment.setDepartment(department);
			appointment.setDate(date2);
			appointment.setComment(comment);
			
			if(administator.bookAppoinment(appointment)) {
				mv.addObject("AllAppointment", administator.getAppointmentsByStatusAndEmail("Scheduled",email));
				List<String> statuses = Arrays.asList("Completed", "Cancelled");
				mv.addObject("AppoinmentHistory", administator.getAppointmentsByStatusInAndEmail(statuses, email));
				session.setAttribute("BookStatus", "Scheduled");
				return mv;
			}else {
				System.out.println("Not Booked..........!!!");
				return mv;
			}
		}
	}
	
	@PostMapping("/BookDoctor")
	public ModelAndView BookSpecificDoctor(String name,String email,long number,String department,String date,String comment,int idDoctor) {
		if(session.getAttribute("user")==null) {
			ModelAndView mv = new ModelAndView("PatientSignIn");
			return mv;
		}else {
			ModelAndView mv = new ModelAndView("PatientViewAppointment");
			//Parsing Given Date
			SimpleDateFormat sdfDate = new SimpleDateFormat("MM/dd/yyyy");
			java.util.Date date1=null;
			try {
				date1 = sdfDate.parse(date);
			} catch (ParseException e) {}
			Date date2 = new Date(date1.getTime()); 
			
			Appointment appointment = new Appointment();
			appointment.setPatientName(name);
			appointment.setEmail(email);
			appointment.setNumber(number);
			appointment.setDepartment(department);
			appointment.setDate(date2);
			appointment.setComment(comment);
			appointment.setDoctorId(idDoctor);
			
			if(administator.bookDoctor(appointment)) {
				mv.addObject("AllAppointment", administator.getAppointmentsByStatusAndEmail("Scheduled",email));
				List<String> statuses = Arrays.asList("Completed", "Cancelled");
				mv.addObject("AppoinmentHistory", administator.getAppointmentsByStatusInAndEmail(statuses, email));
				session.setAttribute("BookStatus", "Scheduled");
				return mv;
			}else {
				System.out.println("Not Booked..........!!!");
				return mv;
			}
		}
	}
	
	@GetMapping("/ViewAppointment")
	public ModelAndView ViewAppointment() {
		if(session.getAttribute("user")==null) {
			return new ModelAndView("PatientSignIn");
		}else {
			ModelAndView mv = new ModelAndView("PatientViewAppointment");
			PatientLogin pd = (PatientLogin) session.getAttribute("user");
			mv.addObject("AllAppointment", administator.getAppointmentsByStatusAndEmail("Scheduled",pd.getEmail()));
			List<String> statuses = Arrays.asList("Completed", "Cancelled");
			mv.addObject("AppoinmentHistory", administator.getAppointmentsByStatusInAndEmail(statuses, pd.getEmail()));
			return mv;
		}
	}
	
	@GetMapping("/HospitalService")
	public ModelAndView HospitalService(String department) {
		ModelAndView mv = new ModelAndView("HospitalService");
		Department dept = administator.getDepartment(department);
		mv.addObject("overView", dept);
		mv.addObject("DoctorList", administator.getDoctorList(dept));
		return mv;
	}
	
	@PostMapping("/cancelAppoinment")
	public ModelAndView cancelAppoinment(int cancelId) {
		administator.cancelAppoinment(cancelId);
		ModelAndView mv = new ModelAndView("PatientViewAppointment");
		PatientLogin pd = (PatientLogin) session.getAttribute("user");
		mv.addObject("AllAppointment", administator.getAppointmentsByStatusAndEmail("Scheduled",pd.getEmail()));
		List<String> statuses = Arrays.asList("Completed", "Cancelled");
		mv.addObject("AppoinmentHistory", administator.getAppointmentsByStatusInAndEmail(statuses, pd.getEmail()));
		return mv;
	}
	
	@GetMapping("/patientService")
	public ModelAndView patientService() {
		ModelAndView mv = new ModelAndView("PatientService");
		return mv;
	}
	
	@GetMapping("/viewDoctor")
	public ModelAndView viewDoctor(int doctorId) {
		ModelAndView mv = new ModelAndView("PatientDoctorView");
		mv.addObject("doctorObj", administator.getDoctorById(doctorId));
		return mv;
	}
	@PostMapping("/updateProfile")
	public String updateProfile(PatientDetail pdPatientDetail, String password) {
		System.out.println(pdPatientDetail.getEmail());
		administator.updatePatientProfile(pdPatientDetail,password);
		session.setAttribute("userDetail",administator.getPatient(pdPatientDetail.getEmail()));
		return "PatientProfile";
	}
	
	@GetMapping("/logout")
	public String logout() {
		session.removeAttribute("user");
		return "PatientSignIn";
	}
	
}

