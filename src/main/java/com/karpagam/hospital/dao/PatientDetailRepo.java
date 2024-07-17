package com.karpagam.hospital.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.karpagam.hospital.model.PatientDetail;
import java.util.List;


public interface PatientDetailRepo extends JpaRepository<PatientDetail, String> {
	
	public PatientDetail findByEmail(String email);

	 
}
