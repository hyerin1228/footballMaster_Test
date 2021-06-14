package com.newdeal.footballMaster.service.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.newdeal.footballMaster.model.User;
import com.newdeal.footballMaster.service.UserService;

@Service
public class UserServiceImpl implements UserService{
	
	/** MyBatis 세션 객체 주입 설정 */
	@Autowired
	SqlSession sqlSession;

	// user의 정보를 가져온다
	@Override
	public User getUser(String email) {
		User input = new User();
		User result = new User();
        input.setEmail(email);
        result = sqlSession.selectOne("UserMapper.selectUser", input);
        
        //TODO 추후 쿼리문 수정해서 해당 유저의 다른 정보도 가져올수 있도록해야함 user_info
        
        return result;
	}

	// user 회원 가입
	@Override
	public void signInUser(User input) {
		sqlSession.insert("UserMapper.createUser", input);
	}

	@Override
	public boolean checkUser(String email) {
		
		User input = new User();		
		User result = new User();
		input.setEmail(email);
		result = sqlSession.selectOne("UserMapper.selectUser", input);
		
		if (result == null) {
			return false;
		} else {
			return true;
		}
		
	}
	
	// user 가입 

}
