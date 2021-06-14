package com.newdeal.footballMaster.controllers;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.newdeal.footballMaster.model.User;
import com.newdeal.footballMaster.service.UserService;

//import lombok.extern.slf4j.Slf4j;

/**
 * Handles requests for the application home page.
 */
//@Slf4j
@Controller
public class HomeController {
	
	@Autowired
	UserService userService;
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		
		model.addAttribute("serverTime", formattedDate );
		
		return "home";
	}
	
	// 회원 가입
	@ResponseBody
	@RequestMapping(value = "signInUser.do", method = RequestMethod.POST)
	public String signInUser(HttpSession session,
			@RequestParam(value="email") String email,
			@RequestParam(value="type") String type) {
		
		// TODO 잘못된 정보 들어왔을때 대응 필요함 프론트에서 하던지 둘다 하던지 일단 작성해야함
		// TODO 같은 이메일정보의 구글, 네이버, 카카오톡 로그인시 병합하는 기능 추가 << 아마 impl 매퍼 죄다 수정
		// TODO 구글은 왜 바로불러오는가... 알아야함 ㅠㅠ
		// TODO 세션비교값을 토큰값으로 바꿔야함 email xxxx << 이거는 로그인에서 적용
		
		User input = new User();
		
		input.setEmail(email);
		input.setType(type);
		
		if (userService.checkUser(email)) {
			return "1";
		} else {
			userService.signInUser(input);
			return "2";
		}
		
		
		
		
	}
	
	/*매치필터 ajax*/
	@ResponseBody
	@RequestMapping(value="matchFilter.do", method=RequestMethod.POST)
	public String matchFilter(Model model, HttpServletResponse response, HttpSession session,
			@RequestParam(value="param") String[] param) {
		
		
		return null;
	}
	
}
