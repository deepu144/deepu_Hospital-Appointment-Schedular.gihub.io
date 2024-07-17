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
public class DoctorLogin {
	@Id
	private String email;
	private String password;
}
