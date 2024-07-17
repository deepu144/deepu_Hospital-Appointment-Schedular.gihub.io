package com.karpagam.hospital.model;

import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import lombok.Data;
import lombok.Getter;
import lombok.Setter;

@Data
@Getter
@Setter
@Entity
public class PatientDetail {
	private String fname;
	private String lname;
	@Id
	private String email;
	private long number;
	private int age;
	private String gender;
	private String country;
	private String state;
	private String city;
	private long pincode;
}
