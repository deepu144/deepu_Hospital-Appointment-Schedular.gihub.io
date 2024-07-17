package com.karpagam.hospital.model;

import java.sql.Date;
import java.sql.Time;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import lombok.Data;
import lombok.Getter;
import lombok.Setter;

@Data
@Getter
@Setter
@Entity
public class Appointment {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	private String patientName;
	private String email;
	private long number;
	private String department;
	private int doctorId;
	private String doctorName;
	private Date date;
	private Time fromTime;
	private Time toTime;
	private String status;
	private String comment;
}
