package com.karpagam.hospital.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.karpagam.hospital.model.Department;

public interface DepartmentRepo extends JpaRepository<Department, Integer>{
	
	@Query("SELECT department from Department")
	public List<String> findAllByDepartment();
	
	@Query("SELECT d FROM Department d WHERE d.department = ?1")
	public Department findByDepartment(String department);
	
	
}
