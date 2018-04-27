package com.test.member;

public class Member {
	private Long id;
	private String name;
	private String password;

	public Member() {
		super();
	}

	public Member(Long id, String name, String password) {
		super();
		this.id = id;
		this.name = name;
		this.password = password;
	}

	public Member(String name, String password) {
		super();
		this.name = name;
		this.password = password;
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	@Override
	public String toString() {
		return String.format("Member [id=%s, name=%s, password=%s]", id, name, password);
	}

}
