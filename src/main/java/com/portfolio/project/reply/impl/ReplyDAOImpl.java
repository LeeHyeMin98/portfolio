package com.portfolio.project.reply.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.portfolio.project.reply.vo.ReplyVO;

@Repository
public class ReplyDAOImpl implements ReplyDAO{
	
	@Inject
	SqlSession sqlSession;

//	@Override
//	public List<ReplyVO> list(Integer seq) {
//		return sqlSession.selectList("reply.listReply",seq);
//	}

	@Override
	public void create(ReplyVO vo) {
		sqlSession.insert("reply.insertReply",vo);
	}

	@Override
	public void update(ReplyVO vo) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void delete(Integer rno) {
		// TODO Auto-generated method stub
		
	}
	
	@Override
	public List<ReplyVO> list(Integer seq,int start,int end) {
		Map<String,Object> map= new HashMap<String, Object>();
		map.put("seq",seq);
		map.put("start",start);
		map.put("end",end);
		return sqlSession.selectList("reply.listReply",map);
		//return sqlSession.selectList("reply.listReply",seq);
	}
	//댓글 갯수
	@Override
	public int count(int seq) {
		return sqlSession.selectOne("reply.countReply",seq);
	}
	

}
