package com.essai.nun.model;

public class Dietitian extends User {
	private String license_number;
	private String specialization;
	private int years_experience;
	private String bio;
	public String getLicense_number() {
		return license_number;
	}
	public void setLicense_number(String license_number) {
		this.license_number = license_number;
	}
	public String getSpecialization() {
		return specialization;
	}
	public void setSpecialization(String specialization) {
		this.specialization = specialization;
	}
	public int getYears_experience() {
		return years_experience;
	}
	public void setYears_experience(int years_experience) {
		this.years_experience = years_experience;
	}
	public String getBio() {
		return bio;
	}
	public void setBio(String bio) {
		this.bio = bio;
	}
}
