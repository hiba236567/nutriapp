package com.essai.nun.model;

public class Client extends User {
	 private int age;
	 private String gender;
	    private double height;
	    private double weight;
	    private String activity_level;
	    private String health_goals ;
	    public int getAge() {
			return age;
		}
		public void setAge(int age) {
			this.age = age;
		}
		public String getGender() {
			return gender;
		}
		public void setGender(String gender) {
			this.gender = gender;
		}
		public double getHeight() {
			return height;
		}
		public void setHeight(double height) {
			this.height = height;
		}
		public double getWeight() {
			return weight;
		}
		public void setWeight(double weight) {
			this.weight = weight;
		}
		public String getActivity_level() {
			return activity_level;
		}
		public void setActivity_level(String activity_level) {
			this.activity_level = activity_level;
		}
		public String getHealth_goals() {
			return health_goals;
		}
		public void setHealth_goals(String health_goals) {
			this.health_goals = health_goals;
		}
		public String getDietary_preferences() {
			return dietary_preferences;
		}
		public void setDietary_preferences(String dietary_preferences) {
			this.dietary_preferences = dietary_preferences;
		}
		public double getBmi() {
			return bmi;
		}
		public void setBmi(double bmi) {
			this.bmi = bmi;
		}
		private String dietary_preferences ;
	    private double bmi;
	    

}
