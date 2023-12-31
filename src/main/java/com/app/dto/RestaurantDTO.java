package com.app.dto;

public class RestaurantDTO {
	int res_id;
	String res_name;
	String res_addr;
	String res_image;
	String res_content;
	String distance;
	String category;
	String team_code;
	String rating;

	public String getRating() {
		return rating;
	}

	public void setRating(String rating) {
		this.rating = rating;
	}

	public RestaurantDTO() {

	}


	public int getRes_id() {
		return res_id;
	}

	public void setRes_id(int res_id) {
		this.res_id = res_id;
	}

	public RestaurantDTO(int res_id, String res_name, String res_addr, String res_image, String res_content,
			String distance, String category, String team_code, String rating) {
		super();
		this.res_id = res_id;
		this.res_name = res_name;
		this.res_addr = res_addr;
		this.res_image = res_image;
		this.res_content = res_content;
		this.distance = distance;
		this.category = category;
		this.team_code = team_code;
		this.rating = rating;
	}

	public String getRes_name() {
		return res_name;
	}

	public void setRes_name(String res_name) {
		this.res_name = res_name;
	}

	public String getRes_addr() {
		return res_addr;
	}

	public void setRes_addr(String res_addr) {
		this.res_addr = res_addr;
	}

	public String getRes_image() {
		return res_image;
	}

	public void setRes_image(String res_image) {
		this.res_image = res_image;
	}

	public String getRes_content() {
		return res_content;
	}

	public void setRes_content(String res_content) {
		this.res_content = res_content;
	}

	public String getDistance() {
		return distance;
	}

	public void setDistance(String distance) {
		this.distance = distance;
	}

	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}

	public String getTeam_code() {
		return team_code;
	}

	public void setTeam_code(String team_code) {
		this.team_code = team_code;
	}

	@Override
	public String toString() {
		return "RestaurantDTO [res_id=" + res_id + ", res_name=" + res_name + ", res_addr=" + res_addr + ", res_image="
				+ res_image + ", res_content=" + res_content + ", distance=" + distance + ", category=" + category
				+ ", team_code=" + team_code + ", rating=" + rating + "]";
	}


	

}
