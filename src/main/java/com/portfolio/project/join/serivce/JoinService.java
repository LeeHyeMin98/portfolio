package com.portfolio.project.join.serivce;

import javax.servlet.http.HttpServletResponse;

import com.portfolio.project.join.vo.JoinVO;

public interface JoinService {
	// 회원가입 처리
	void insertUser(JoinVO vo);
		
	public JoinVO getUSer(JoinVO vo);
		
	
}
