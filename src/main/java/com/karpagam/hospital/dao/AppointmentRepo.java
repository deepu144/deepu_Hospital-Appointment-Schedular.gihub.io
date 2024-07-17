package com.karpagam.hospital.dao;

import java.sql.Date;
import java.sql.Time;
import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.transaction.annotation.Transactional;

import com.karpagam.hospital.model.Appointment;


public interface AppointmentRepo extends JpaRepository<Appointment, Integer>{
	
	public int countByDoctorNameAndDate(String doctorName, Date date);
	
	List<Appointment> findByStatusInAndEmail(List<String> statuses, String email);
	
	List<Appointment> findByStatusInAndDoctorId(List<String> status, int doctorId);
	
	public List<Appointment> findByStatusAndEmail(String status, String email);
	
	@Transactional
    @Modifying
    @Query("UPDATE Appointment a SET a.status = 'Cancelled' WHERE a.id = ?1")
    void cancelAppointmentById(int id);
	
	@Transactional
    @Modifying
    @Query("UPDATE Appointment a SET a.status = 'Completed' WHERE a.id = ?1")
    void completeAppointmentById(int id);
	
	@Transactional
    @Modifying
    @Query("UPDATE Appointment a SET a.status = 'Scheduled',a.date=?1 ,a.fromTime=?2 ,a.toTime=?3 WHERE a.id = ?4")
    void postponeAppointmentById(Date date , Time fromTime , Time toTime , int id);
	
	public List<Appointment> findByDoctorIdAndStatus(int doctorId, String status);
	
}
