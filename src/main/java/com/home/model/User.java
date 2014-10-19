package com.home.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

import org.springframework.context.annotation.Lazy;

@Entity
@Table(name = "USER1", schema = "scott")
public class User {

	@Id
	@Column(name = "id")
	@GeneratedValue
	private int id;

	@Column(name = "USER_NAME")
	private String username;

	@Column(name = "ADDRESS")
	private String address;

	@Column(name = "EMAIL")
	private String email;

	@Column(name = "PINCODE")
	private int pincode;
	private String msg;
	private String showRst;

	public int getId() {
		return id;
	}

	public void setId(int userid) {
		this.id = userid;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public int getPincode() {
		return pincode;
	}

	public void setPincode(int pincode) {
		this.pincode = pincode;
	}

	public String getMsg() {
		return msg;
	}

	public void setMsg(String msg) {
		this.msg = msg;
	}

	public String getShowRst() {
		return showRst;
	}

	public void setShowRst(String showRst) {
		this.showRst = showRst;
	}

}