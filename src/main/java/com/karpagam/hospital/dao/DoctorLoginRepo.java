package com.karpagam.hospital.dao;

import org.springframework.data.jpa.repository.JpaRepository;

import com.karpagam.hospital.model.DoctorLogin;
import java.util.List;


public interface DoctorLoginRepo extends JpaRepository<DoctorLogin, String>{
	
	public DoctorLogin findByEmail(String email);
	
}
