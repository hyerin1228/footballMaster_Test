package com.newdeal.footballMaster.model;

import lombok.Data;

@Data
public class UserBank {
	private int id;					// 유저의 은행정보 프라이머리 키
	private int account_no;			// 유저의 계좌번호
	private String account_holder;	// 입금자 명
	private int bank_id;			// 은행 프라이머리 키
	private int user_id;			// 유저 프라이머리 키
}
