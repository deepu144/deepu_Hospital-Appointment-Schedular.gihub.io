package com.karpagam.hospital.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import com.karpagam.hospital.model.PatientLogin;

public interface PatientLoginRepo extends JpaRepository<PatientLogin, String>{
	
	public boolean existsByEmail(String email);
		
	@Query("SELECT pl.password FROM PatientLogin pl WHERE pl.email = ?1")
    public String findPasswordByEmail(String email);
	
	public   PatientLogin findByEmail(String email); 
		
	
	
}
