package com.portfolio.project.user.service;

import javax.servlet.http.HttpSession;

import com.portfolio.project.user.vo.UserVO;

public interface UserService {
	//로그인 확인
	public boolean loginCheck(UserVO vo, HttpSession session);

	//
	public UserVO viewMember(UserVO vo);
	//로그아웃
	public void logout(HttpSession session);
	
	
	// 내 정보 상세 보기
	public UserVO viewUSer();

	UserVO viewUser(String uname) throws Exception;
	// 내 정보 수정 처리
	void updateUser(UserVO vo) throws Exception;

}