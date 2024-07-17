package com.karpagam.hospital.controller;

import java.sql.Date;
import java.sql.Time;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.karpagam.hospital.model.Appointment;
import com.karpagam.hospital.model.Department;
import com.karpagam.hospital.model.Doctor;
import com.karpagam.hospital.model.DoctorLogin;
import com.karpagam.hospital.service.Administator;

import jakarta.servlet.http.HttpSession;

@Controller
@RequestMapping("/doctor")
public class DoctorController {
	
	@Autowired
	Administator administator;
	
	@Autowired
	HttpSession session;

	@GetMapping("/home")
	public String home() {
		return "DoctorHome";
	}
	
	@GetMapping("/viewAppoinment")
	public ModelAndView doctorViewAppoinment() {
		ModelAndView mv = new ModelAndView("DoctorViewAppoinment");
		Doctor doctor = (Doctor) session.getAttribute("doctor");
		mv.addObject("upcomingAppoinment", administator.getDoctorUpcomingAppoinment(doctor.getId()));
		mv.addObject("historyAppoinment", administator.getDoctorHistoryAppoinment(doctor.getId()));
		return mv;
	}

	@GetMapping("/signin")
	public String signin() {
		return "DoctorLogin";
	}

	@PostMapping("/validateSignIn")
	public String validateSignIn(DoctorLogin doctorLogin) {

		if (administator.validateDoctorLogIn(doctorLogin)) {
			Doctor doc = administator.getDoctor(doctorLogin.getEmail());
			session.setAttribute("doctor", doc);
			session.setAttribute("departmentList", administator.getAllDepartments());
			return "DoctorHome";
		} else {
			session.setAttribute("invalid", "passwordWrong");
			return "DoctorLogin";
		}

	}
	
	@GetMapping("/ViewDepartment")
	public ModelAndView HospitalService(String department) {
		ModelAndView mv = new ModelAndView("DoctorViewDepartment");
		Department dept = administator.getDepartment(department);
		mv.addObject("overView", dept);
		mv.addObject("DoctorList", administator.getDoctorList(dept));
		return mv;
	}
	
	@PostMapping("/statusUpdate")
	public ModelAndView updateStatus(String status,Integer appoinmentId) {
		ModelAndView mv = new ModelAndView("DoctorViewAppoinment");
		if(status.equalsIgnoreCase("Postpone")) {
			ModelAndView mv1 = new ModelAndView("DoctorPostpone");
			mv1.addObject("status", status);
			mv1.addObject("id",appoinmentId);
			return mv1;
		}else {
			administator.updateStatus(status,appoinmentId);			
		}
		Doctor doctor = (Doctor) session.getAttribute("doctor");
		mv.addObject("upcomingAppoinment", administator.getDoctorUpcomingAppoinment(doctor.getId()));
		mv.addObject("historyAppoinment", administator.getDoctorHistoryAppoinment(doctor.getId()));
		return mv;
	}
	
	@PostMapping("/postpone")
	public ModelAndView postpone(String date,String time,int id) {
		ModelAndView mv = new ModelAndView("DoctorViewAppoinment");
		//parsing date
		SimpleDateFormat sdfDate = new SimpleDateFormat("yyyy-MM-dd");
		java.util.Date date1=null;
		try {
			date1 = sdfDate.parse(date);
		} catch (ParseException e) {}
		Date date2 = new Date(date1.getTime()); 
		//parsing time
		SimpleDateFormat sdTime = new SimpleDateFormat("HH:mm");
		java.util.Date time1 = null;
		try {
			time1=sdTime.parse(time);
		} catch (ParseException e) {}
		
		Time fromTime1 = new Time(time1.getTime());
		Time toTime1 = new Time(fromTime1.getTime());
		toTime1.setTime(toTime1.getTime() + (30 * 60 * 1000));
		administator.postponeAppointment(date2,fromTime1,toTime1,id);
		Doctor doctor = (Doctor) session.getAttribute("doctor");
		mv.addObject("upcomingAppoinment", administator.getDoctorUpcomingAppoinment(doctor.getId()));
		mv.addObject("historyAppoinment", administator.getDoctorHistoryAppoinment(doctor.getId()));
		return mv;
	}
	
	@GetMapping("/logout")
	public String logout() {
		session.removeAttribute("doctor");
		return "DoctorLogin";
	}

}
