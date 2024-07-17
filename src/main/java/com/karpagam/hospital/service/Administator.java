package com.karpagam.hospital.service;

import java.sql.Date;
import java.sql.Time;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Optional;
import java.util.Random;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.karpagam.hospital.dao.AppointmentRepo;
import com.karpagam.hospital.dao.DepartmentRepo;
import com.karpagam.hospital.dao.DoctorLoginRepo;
import com.karpagam.hospital.dao.DoctorRepo;
import com.karpagam.hospital.dao.PatientDetailRepo;
import com.karpagam.hospital.dao.PatientLoginRepo;
import com.karpagam.hospital.model.Appointment;
import com.karpagam.hospital.model.Department;
import com.karpagam.hospital.model.Doctor;
import com.karpagam.hospital.model.DoctorLogin;
import com.karpagam.hospital.model.PatientDetail;
import com.karpagam.hospital.model.PatientLogin;

@Service
public class Administator {
	@Autowired
	PatientDetailRepo patientDetailRepo;
	@Autowired
	PatientLoginRepo patientLoginRepo;
	@Autowired
	DepartmentRepo departmentRepo;
	@Autowired
	DoctorRepo doctorRepo;
	@Autowired
	AppointmentRepo appointmentRepo;
	@Autowired
	DoctorLoginRepo doctorLoginRepo;
	
	public void savePDetail(PatientDetail pd) {
		patientDetailRepo.save(pd);
	}
	
	public void savePLogin(PatientLogin pl) {
		patientLoginRepo.save(pl);
	}
	
	public boolean isExistingPatient(PatientLogin pl) {
		if(patientLoginRepo.existsByEmail(pl.getEmail())) {
			return true;
		}else {
			return false;
		}
	}
	
	public boolean isEqualPassword(PatientLogin pl) {
		if(patientLoginRepo.findPasswordByEmail(pl.getEmail()).equals(pl.getPassword())) {
			return true;
		}else {
			return false;
		}
		
	}
	
	public PatientDetail getPatient(String email) {
		return patientDetailRepo.findByEmail(email);
	}
	
	public List<String> getAllDepartments(){
		return departmentRepo.findAllByDepartment();
	}
	
	public Department getDepartment(String department) {
		return departmentRepo.findByDepartment(department);
	}
	
	public List<Doctor> getDoctorList(Department dept){
		return doctorRepo.findByDepartment(dept);
	}
	
	public boolean bookAppoinment(Appointment appointment) {
		
		Random random = new Random();
        int rand = random.nextInt(4-1)+1; 
        Department dept = departmentRepo.findByDepartment(appointment.getDepartment());
		List<Doctor> li = doctorRepo.findByDepartment(dept);
		
		Doctor doc = li.get(rand-1);
		
		int count = appointmentRepo.countByDoctorNameAndDate(doc.getName(),appointment.getDate());
		Time time = Time.valueOf("10:00:00");
        long millisecondsIn30Minutes = (30*count) * 60 * 1000;
        long millisecondsInAfter30Minutes = millisecondsIn30Minutes + (30*60*1000);
        Time fromTime = new Time(time.getTime() + millisecondsIn30Minutes);
		Time toTime = new Time(time.getTime()+millisecondsInAfter30Minutes);
		
		if(count <= 10 ) {
			appointment.setFromTime(fromTime);
			appointment.setToTime(toTime);
			appointment.setDoctorName(doc.getName());
			appointment.setDoctorId(doc.getId());
			appointment.setStatus("Scheduled");
			appointmentRepo.save(appointment);
			return true;
		}else {
			this.bookAppoinment(appointment);
		}
        return false;
	}
	
	public boolean bookDoctor(Appointment appointment) {
		Optional<Doctor> li =  doctorRepo.findById(appointment.getDoctorId());
		Doctor doc = li.orElse(null);
		
		int count = appointmentRepo.countByDoctorNameAndDate(doc.getName(),appointment.getDate());
		Time time = Time.valueOf("10:00:00");
        long millisecondsIn30Minutes = (30*count) * 60 * 1000;
        long millisecondsInAfter30Minutes = millisecondsIn30Minutes + (30*60*1000);
        Time fromTime = new Time(time.getTime() + millisecondsIn30Minutes);
		Time toTime = new Time(time.getTime()+millisecondsInAfter30Minutes);
		
		if(count <= 10 ) {
			appointment.setFromTime(fromTime);
			appointment.setToTime(toTime);
			appointment.setDoctorName(doc.getName());
			appointment.setDoctorId(doc.getId());
			appointment.setStatus("Scheduled");
			appointmentRepo.save(appointment);
			return true;
		}else {
			this.bookAppoinment(appointment);
		}
		
		return false;
	}
	
	
	
	public List<Appointment> getAppointmentsByStatusAndEmail(String status, String email) {
        return appointmentRepo.findByStatusAndEmail(status, email);
    }
	
	
	public void cancelAppoinment(int id) {
		appointmentRepo.cancelAppointmentById(id);
	}
	
	public List<Appointment> getAppointmentsByStatusInAndEmail(List<String> statuses , String email){
		return appointmentRepo.findByStatusInAndEmail(statuses,email);
	}
	
	public Doctor getDoctorById(Integer id) {
		Optional<Doctor> li =  doctorRepo.findById(id);
		return li.orElse(null);
	}
	
	public boolean validateDoctorLogIn(DoctorLogin doctorLogin) {
//		DoctorLogin dl = doctorLoginRepo.findByEmail(doctorLogin.getEmail());
		Doctor dl = doctorRepo.findByEmail(doctorLogin.getEmail());
		if(dl.getPassword().equals(doctorLogin.getPassword())) {
			return true;
		}else {
			return false;
		}
	}
	
	public Doctor getDoctor(String email) {
		return doctorRepo.findByEmail(email);
	}
	
	public List<Appointment> getDoctorUpcomingAppoinment(int id){
		return appointmentRepo.findByDoctorIdAndStatus(id,"Scheduled");
	}
	
	public List<Appointment> getDoctorHistoryAppoinment(int id){
		List<String> statuses = Arrays.asList("Completed", "Cancelled");
		return appointmentRepo.findByStatusInAndDoctorId(statuses,id);
	}
	
	public void updateStatus(String status,int id) {
		if(status.equalsIgnoreCase("Cancel")) {
			appointmentRepo.cancelAppointmentById(id);
		}else if(status.equalsIgnoreCase("Completed")){
			appointmentRepo.completeAppointmentById(id);
		}
	}
	
	public void postponeAppointment(Date date , Time fromTime ,Time toTime, int id) {
		appointmentRepo.postponeAppointmentById(date,fromTime,toTime,id);
	}
	
	public void updatePatientProfile(PatientDetail pdPatientDetail,String password) {
		 
		PatientDetail exisitingDetail = patientDetailRepo.findByEmail(pdPatientDetail.getEmail());
		if(exisitingDetail!=null)
		{
			exisitingDetail.setFname(pdPatientDetail.getFname());
			exisitingDetail.setLname(pdPatientDetail.getLname());
			exisitingDetail.setAge(pdPatientDetail.getAge());
			exisitingDetail.setNumber(pdPatientDetail.getNumber());
			exisitingDetail.setGender(pdPatientDetail.getGender());
			exisitingDetail.setCountry(pdPatientDetail.getCountry());
			exisitingDetail.setState(pdPatientDetail.getState());
			exisitingDetail.setCity(pdPatientDetail.getCity());
			exisitingDetail.setPincode(pdPatientDetail.getPincode());
			patientDetailRepo.save(exisitingDetail);
			
		}
		
		PatientLogin exisitingPassword=patientLoginRepo.findByEmail(pdPatientDetail.getEmail());
		
		if(exisitingPassword!=null)
		{
			exisitingPassword.setPassword(password);
		}
	 
		 
		
	}
	
	
	
	
	
//	public void save() {
//		Department department = new Department();
//		department.setDepartment("Opthalmology");
//		department.setOverView("Diabetology is a specialized field of medicine focused on the study, diagnosis, and management of diabetes mellitus. Diabetologists work to control blood sugar levels, prevent complications, and improve the overall health of individuals with diabetes through medication, lifestyle modifications, and education.");
//		department.setTreatments("Insulin therapy for blood sugar@"
//				+ "Oral medications to manage glucose@"
//				+ "Lifestyle changes: diet, exercise@"
//				+ "Blood sugar monitoring and management@"
//				+ "Diabetic education: self-care, prevention@");
//		departmentRepo.save(department);
//		
//		Doctor doctor1 = new Doctor();
//		doctor1.setName("Dr.R.Srinivasan");
//		doctor1.setDegeree("MBBS,MD,MRCP -UK,CCST -UK");
//		doctor1.setDepartment(department);
//		
//		Doctor doctor2 = new Doctor();
//		doctor2.setName("Dr.Vengojayaprassad");
//		doctor2.setDegeree("MBBS.,MD.,Dip in Diabetology");
//		doctor2.setDepartment(department);
//		
//		Doctor doctor3 = new Doctor();
//		doctor3.setName("Dr.M.S.Seshadri");
//		doctor3.setDegeree("MBBS,MD,PHd,FRCP");
//		doctor3.setDepartment(department);
//		
//		doctorRepo.save(doctor1);
//		doctorRepo.save(doctor2);
//		doctorRepo.save(doctor3);
//		
//		List<Doctor> li = new ArrayList<>();
//		li.add(doctor1);
//		li.add(doctor2);
//		li.add(doctor3);
//		
//		department.setDoctors(li);
//	}
}
