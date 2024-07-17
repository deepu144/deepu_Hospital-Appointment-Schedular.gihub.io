package com.karpagam.hospital.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.karpagam.hospital.model.Department;
import com.karpagam.hospital.model.Doctor;

public interface DoctorRepo extends JpaRepository<Doctor, Integer> {
	
	public List<Doctor> findByDepartment(Department department);
	
	public Doctor findByEmail(String email);
	
}
