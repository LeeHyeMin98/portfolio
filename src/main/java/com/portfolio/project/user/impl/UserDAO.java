package com.portfolio.project.user.impl;

import javax.servlet.http.HttpSession;

import com.portfolio.project.user.vo.UserVO;

public interface UserDAO {
	//로그인 체크
	public boolean loginCheck(UserVO vo);
	//로그인 정보
	public UserVO viewMember(UserVO vo);
	//로그아웃
	public void logout(HttpSession session);

	// 내 정보 상세보기
	public UserVO viewUser();

	UserVO viewUser(String uname) throws Exception;
	// 내 정보 수정하기
	void updateUser(UserVO vo) throws Exception;
}
