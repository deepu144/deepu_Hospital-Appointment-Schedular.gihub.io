package com.karpagam.hospital.model;

import java.util.List;

import jakarta.persistence.CascadeType;
import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.FetchType;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.OneToMany;
import lombok.Data;
import lombok.Getter;
import lombok.Setter;

@Data
@Getter
@Setter
@Entity
public class Department {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;
	private String department;
	@Column(length = 1000)
	private String overView;
	@OneToMany(mappedBy = "department" , cascade = CascadeType.ALL , fetch = FetchType.EAGER)
	private List<Doctor> doctors; 
	
	@Override
    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append("Department{id=").append(id);
        sb.append(", department='").append(department).append('\'');
        sb.append(", overView='").append(overView).append('\'');
        sb.append('}');
        return sb.toString();
    }
}
