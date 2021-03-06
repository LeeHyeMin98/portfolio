package com.portfolio.project.reply.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.portfolio.project.reply.impl.ReplyDAO;
import com.portfolio.project.reply.vo.ReplyVO;

@Service
public class ReplyServiceImpl implements ReplyService {
	
	@Inject
	ReplyDAO replyDAO;
	
	//댓글 작성
	@Override
	public void create(ReplyVO vo) {
		replyDAO.create(vo);
		
	}
	//댓글 수정
	@Override
	public void update(ReplyVO vo) {
		// TODO Auto-generated method stub
		
	}
	//댓글 삭제
	@Override
	public void delete(Integer rno) {
		// TODO Auto-generated method stub
		
	}

	//댓글 목록
	@Override
	public List<ReplyVO> list(Integer seq, int start, int end){
		return replyDAO.list(seq, start, end);
	}
	//댓글 갯수
	@Override
	public int count(int seq) {
		// TODO Auto-generated method stub
		return replyDAO.count(seq);
	}
}
