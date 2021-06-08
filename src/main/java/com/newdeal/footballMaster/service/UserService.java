package com.newdeal.footballMaster.service;

import java.util.List;

import com.newdeal.footballMaster.model.User;

public interface UserService {
	
	// user 정보 가져오기
	public List<User> getUser(String email);

}
