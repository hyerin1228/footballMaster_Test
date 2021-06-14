package com.newdeal.footballMaster.service;

import com.newdeal.footballMaster.model.User;

public interface UserService {
	
	// user 정보 가져오기
	public User getUser(String email);
	
	// user 정보 유무 체크
	public boolean checkUser(String email);
	
	// user 회원 가입
	public void signInUser(User input);

}
