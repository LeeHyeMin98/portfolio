package com.portfolio.project.join.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.portfolio.project.join.serivce.JoinService;
import com.portfolio.project.join.vo.JoinVO;

@Service("joinService")
public class JoinDAOImpl implements JoinService {
	//@Autowired
	//private JoinDAOJPA joinDAO;
	@Autowired
	private JoinDAO joinDAO;

	public void insertUser(JoinVO vo) {
		joinDAO.insertUser(vo);
	}
	public void setUserDAO(JoinDAO joinDAO) {
		this.joinDAO = joinDAO;
	}

	/*
	 * public JoinVO getUser(JoinVO vo) { return joinDAO.getUser(vo); }
	 */
	@Override
	public JoinVO getUSer(JoinVO vo) {
		// TODO Auto-generated method stub
		return joinDAO.getUser(vo);
	}
}
