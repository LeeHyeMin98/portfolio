package com.portfolio.project.view;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.portfolio.project.reply.service.ReplyService;
import com.portfolio.project.reply.vo.ReplyPager;
import com.portfolio.project.reply.vo.ReplyVO;


@RestController
@RequestMapping("/reply/*")
public class ReplyController {
	
	@Inject
	ReplyService replyService;
	
	//댓글 입력
	@RequestMapping("insert.do")
	public void insert(@ModelAttribute ReplyVO vo, HttpSession session) {
		String uname=(String) session.getAttribute("uname");
		vo.setReplyer(uname);
		replyService.create(vo);
	}
	
	//댓글 목록
	@RequestMapping("/list.do")
	public ModelAndView list(@RequestParam int seq,@RequestParam(defaultValue="1") int curPage, ModelAndView mav) {
		//페이징 처리
		int count=replyService.count(seq);
		ReplyPager replyPager = new ReplyPager(count, curPage);
		int start=replyPager.getPageBegin();
		int end= replyPager.getPageEnd();
		List<ReplyVO> list =replyService.list(seq,start,end);
		
		mav.setViewName("replyList.jsp");
		mav.addObject("list",list);
		mav.addObject("replyPager", replyPager);
		return mav;
	}
	
}
