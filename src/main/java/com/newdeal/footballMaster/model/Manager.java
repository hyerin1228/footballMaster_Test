package com.newdeal.footballMaster.model;

import lombok.Data;

@Data
public class Manager {
	private int id;					// 매니저 프라이머리 키
	private String name;			// 매니저 이름
	private int phone_number;		// 매니저 핸드폰 번호
	private String birthdate;		// 매니저 생일
	private String greetings;		// 한마디
}
