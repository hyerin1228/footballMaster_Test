package com.newdeal.footballMaster.controllers;

import java.io.BufferedReader;
import java.text.DateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.google.gson.Gson;
import com.newdeal.footballMaster.model.MainBanner;

//import lombok.extern.slf4j.Slf4j;

/**
 * Handles requests for the application home page.
 */
//@Slf4j
@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	// ---------------------
	// 캐시 
	
	// 캐시 충전 페이지 조회
	@RequestMapping(value = "mypage/cash/charge", method = RequestMethod.GET)
	public String cashCharge() {
		logger.info("Welcome cashCharge 조회!");
		return "cash_charge";
	}
	
	// ---------------------
	// 마이페이지
	
	// *. 마이페이지조회(GET)-(/mypage)
	@RequestMapping(value = "/mypage", method = RequestMethod.GET)
	public String myPage() {
		logger.info("Welcome myPage 조회!");
		return "myPage";
	}
	
	@RequestMapping(value = "/naver_callback", method = RequestMethod.GET)
	public String naverLogin() {
		logger.info("네이버 로그인");
		return "naver_callback";
	}
	
	
	// *. 마이페이지 -> 회원수정페이지조회(GET)-(/mypage/change) 
	@RequestMapping(value = "/mypage/change", method = RequestMethod.GET)
	public String mypageChange() {
		logger.info("Welcome mypageChange 조회!");
		return "mypage_change";
	}

	
	// ----------------------------------
	// match 페이지
	
	
	// json으로 받는지 test - 혜린
	// 필요한 util이라고...
	private String readJSONStringFromRequestBody(HttpServletRequest request){
	    StringBuffer json = new StringBuffer();
	    String line = null;
	 
	    try {
	        BufferedReader reader = request.getReader();
	        while((line = reader.readLine()) != null) {
	            json.append(line);
	        }
	 
	    }catch(Exception e) {
	        System.out.println("Error reading JSON string: " + e.toString());
	    }
	    return json.toString();
	}
	
	// test 회원수정페이지 -혜린
	@RequestMapping(value = "/mypageChangeTest", method = RequestMethod.POST)
	public String mypageChangeTest(HttpServletRequest request, HttpServletResponse response, HttpSession session) {
		logger.info("Welcome mypageChangeTest!");
		
		Gson gson = new Gson();
	    //DataSet set = new DataSet();
	    String json = readJSONStringFromRequestBody(request); 
	    JSONObject jObj = new JSONObject(json);
	    return gson.toJson(jObj);
	    
	}
	
	

	
	
	// test 매치상세페이지 이동 -혜린
	@RequestMapping(value = "/matches/{matchId}", method = RequestMethod.GET)
	public String matchDetail(@PathVariable String matchId) {
		logger.info("Welcome matchDetail!");
		logger.info("matchId ["+matchId+"]");

		return "matchDetail2";
	}
	
	// test 매치신청페이지로 이동 -혜린
	@RequestMapping(value = "/matches/{matchId}/apply", method = RequestMethod.GET)
	public String matchApply(@PathVariable String matchId) {
		logger.info("Welcome matchApply!");
		logger.info("matchId ["+matchId+"]");
		
		return "matchApply";
	}
	
	
	// test -혜린
	@RequestMapping(value = "/matches", method = RequestMethod.GET)
	public String matches() {
		logger.info("Welcome matches!");

		return "matches";
	}
	
	//@CrossOrigin(origins = "http://127.0.0.1:5500")
	@ResponseBody
	@GetMapping("/banner")
	public List<Map<String,Object>> fetchMainBannerJsonArray()
    {	
		System.out.println("GET fetchMainBanner");
		logger.error("Test fetchMainBanner");
		
		MainBanner mb1 = MainBanner
				.builder()
				.id("id1")
				.link("#")
				.image_m("http://localhost:8080/footballMaster/assets/img/img1.gif")
				.image("http://localhost:8080/footballMaster/assets/img/img1.gif").build();
				
		MainBanner mb2 = MainBanner
				.builder()
				.id("id2")
				.link("#")
				.image_m("http://localhost:8080/footballMaster/assets/img/img2.gif")
				.image("http://localhost:8080/footballMaster/assets/img/img2.gif").build();
		
		MainBanner mb3 = MainBanner
				.builder()
				.id("id3")
				.link("#")
				.image_m("http://localhost:8080/footballMaster/assets/img/img3.gif")
				.image("http://localhost:8080/footballMaster/assets/img/img3.gif").build();
		
		// MainBanner 객체 -> Map 으로 변환
		ObjectMapper objectMapper = new ObjectMapper();
		
		Map<String, Object> map1 = objectMapper.convertValue(mb1, Map.class);
		Map<String, Object> map2 = objectMapper.convertValue(mb2, Map.class);
		Map<String, Object> map3 = objectMapper.convertValue(mb3, Map.class);
		
		
		System.out.println(mb1);
		System.out.println(mb2);
		System.out.println(mb3);
		
		System.out.println("----------변환");
		
		System.out.println(map1);
		System.out.println(map2);
		System.out.println(map3);
		
		List<Map<String, Object>> list = new ArrayList<Map<String, Object>>();
		list.add(map1);
		list.add(map2);
		list.add(map3);
		
        return list;
    }
	
	
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
	
	
}
	
