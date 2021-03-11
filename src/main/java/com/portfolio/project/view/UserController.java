package com.portfolio.project.view;
import org.slf4j.LoggerFactory;
import org.springframework.context.annotation.Bean;
import org.springframework.orm.hibernate3.LocalSessionFactoryBean;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.portfolio.project.user.service.UserService;
import com.portfolio.project.user.vo.UserVO;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;

@Controller
@RequestMapping("/*")
public class UserController {

	private static final Logger logger= LoggerFactory.getLogger(UserController.class);
	
	@Inject
	UserService userService;
	
	/*
	 * @Bean (name ="entityManagerFactory") public LocalSessionFactoryBean
	 * sessionFactory () { LocalSessionFactoryBean sessionFactory = new
	 * LocalSessionFactoryBean (); return sessionFactory; }
	 */
	
	//로그인
	@RequestMapping("/login.do")
	public String login() {
		return "/login.jsp";
	}
	
	//로그인 체크
	@RequestMapping("/loginCheck.do")
	public ModelAndView loginCheck(@ModelAttribute UserVO vo, HttpSession session) {
		boolean result = userService.loginCheck(vo,session);
		ModelAndView mav = new ModelAndView();
		if(result == true) {
			//list.jsp
			mav.setViewName("main.jsp");
			mav.addObject("msg","success");
		} else {
			mav.setViewName("login.jsp");
			mav.addObject("msg","failure");
		}

		return mav;
	}
	
	@RequestMapping("/logout.do")
	public ModelAndView logout(HttpSession session) {
		userService.logout(session);
		//session.invalidate();
		ModelAndView mav = new ModelAndView();
		mav.setViewName("login.jsp");
		mav.addObject("msg","logout");
		return mav;
	}
	// 내 정보 상세 조회, 수정 처리
	@RequestMapping("/userpage.do")
	public String userView(@ModelAttribute UserVO vo, Model model, HttpSession session) throws Exception{
		// 세션에 저장된 uname을 가져와서 String uname으로 넘김. 
		String uname = (String) session.getAttribute("uname");
		model.addAttribute("user", userService.viewUser(uname));
		userService.updateUser(vo);
		
		return "/userpage.jsp";
	}
	
	@RequestMapping("/userpage_update.do")
	public String userUpdate(String uname, Model model, HttpSession session) throws Exception{
		uname = (String) session.getAttribute("uname");
		System.out.println(uname);
		// 가져온 uname이 null 값일 경우
		if(uname == null) {
			session.setAttribute("miseon", uname);
			System.out.println("1");
			System.out.println(uname);
			logger.info(uname);
		}
		else {
			// 내 정보를 model에 저장하고 확인하기 위해 콘솔로 출력
		model.addAttribute("user", userService.viewUser(uname));
		logger.info(uname);
		// 내 정보 수정처리
		System.out.println("2");
		System.out.println(uname);
		}
		return "/userpage_update.jsp";
	}
}
