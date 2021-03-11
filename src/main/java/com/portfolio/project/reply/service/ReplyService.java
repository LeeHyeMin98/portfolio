package com.portfolio.project.reply.service;

import java.util.List;

import com.portfolio.project.reply.vo.ReplyVO;

public interface ReplyService {
	//댓글 목록
	//public List<ReplyVO> list(Integer seq);
	//댓글 입력
	public void create(ReplyVO vo);
	//댓글 수정
	public void update(ReplyVO vo);
	//댓글 삭제
	public void delete(Integer rno);
	
	
	//댓글 목록
	public List<ReplyVO> list(Integer seq, int start, int end);
	//댓글 갯수
	public int count(int seq);
}
