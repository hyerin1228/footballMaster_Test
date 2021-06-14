package com.newdeal.footballMaster.model;

import lombok.Data;

@Data
public class Field {
	private int id;						// 구장 프라이머리 키
	private String name;				// 구장 이름
	private String place;				// 구장 장소
	private int participation_fee;		// 참가비
	private String man_to_man_rule;		// 인원수 룰
	private String floor;				// 바닥 재질
	private String shose_rule;			// 신발 룰
	private int min_people;				// 최소 인원
	private int max_people;				// 최대 인원
	private String size;				// 구장 크기
	private String shower_room;			// 샤워장 유무
	private String park;				// 주차장 유무
	private String shose_rent;			// 신발 대여 가능 여부
	private String cloth_rent;			// 운동복 대여 가능 여부
	private String special_thing;		// 특이사항
	private String area;				// 구장 지역

}
