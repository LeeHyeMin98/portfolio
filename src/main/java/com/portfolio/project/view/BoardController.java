package com.portfolio.project.view;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

/*import org.apache.catalina.connector.Request;*/
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.portfolio.project.board.service.BoardService;
import com.portfolio.project.board.vo.BoardListVO;
import com.portfolio.project.board.vo.BoardPager;
import com.portfolio.project.board.vo.BoardVO;

@Controller
@SessionAttributes("board")
public class BoardController {
	@Autowired
	private BoardService boardService;

	@RequestMapping("/dataTransform.do")
	@ResponseBody
	public BoardListVO dataTransform(BoardVO vo) {
		vo.setSearchCondition("TITLE");
		vo.setSearchKeyword("");
		List<BoardVO> boardList = boardService.getBoardList();
		BoardListVO boardListVO = new BoardListVO();
		boardListVO.setBoardList(boardList);
		return boardListVO;
	}

	//게시글 목록
	@RequestMapping("/list.do")
	public ModelAndView list(@RequestParam(defaultValue="title") String searchOption, @RequestParam(defaultValue="") String keyword, @RequestParam(defaultValue="1")int curPage) throws Exception{
		//List<BoardVO> list = boardService.listAll( searchOption,keyword);
		
		//레코드의 갯수 계산
		int count = boardService.countArticle(searchOption,keyword);
		
		//페이징
		BoardPager boardPager = new BoardPager(count,curPage);
		int start = boardPager.getPageBegin();
		int end =boardPager.getPageEnd();
		
		List<BoardVO> list = boardService.listAll(start, end, searchOption,keyword);
		
		//데이터를 맵에 저장
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("list", list); //list
		map.put("count", count); //레코드의 갯수
		map.put("searchOption", searchOption); //검색 옵션
		map.put("keyword", keyword); //검색 키워드
		map.put("boardPager", boardPager);
		
	
		//ModelAndView
		ModelAndView mav = new ModelAndView();
		
		mav.addObject("map",map); //맵에 저장된 데이터를 mav에 저장
		
		mav.setViewName("list.jsp");//뷰를 list.jsp로 설정
		//mav.addObject("list",list);

		return mav;
		

		
	}
	
	
	//글 작성 작성자를 로그인 사용자로 설정
	@RequestMapping(value="insertBoard.do", method=RequestMethod.POST)
	public String insert(@ModelAttribute BoardVO vo, HttpSession session) throws Exception{
		//session에 저장된 username을 writer에 저장
		
		String writer =(String) session.getAttribute("uname");
		
		//vo에 writer를 세팅
		vo.setWriter(writer);
		
		boardService.insertBoard(vo);
	
		return "redirect:list.do";
	}
	

	// 글 수정
	@RequestMapping("/updateBoard.do")
	public String updateBoard(@ModelAttribute("board") BoardVO vo) {
		boardService.updateBoard(vo);
		return "list.do";
	}

	// 글 삭제
	@RequestMapping("/deleteBoard.do")
	public String deleteBoard(@RequestParam int seq) {
		boardService.deleteBoard(seq);
		return "list.do";
	}
	
	//게시글 상세 내용 조회, 게시글 조회수 증가 처리
	@RequestMapping(value="/view.do", method=RequestMethod.GET)
	public ModelAndView view(@RequestParam int seq, HttpSession session) throws Exception{
		//조회수 증가 처리
		boardService.increaseViewcnt(seq, session);
		//모델(데이터)+뷰(화면)를 함께 전달하는 객체
		ModelAndView mav = new ModelAndView();
		//뷰의 이름
		mav.setViewName("view.jsp");
		//뷰에 전달할 데이터
		mav.addObject("board",boardService.getBoard(seq));
		return mav;
	}
	

	// 검색 조건 목록 설정
	@ModelAttribute("conditionMap")
	public Map<String, String> searchConditionMap() {
		Map<String, String> conditionMap = new HashMap<String, String>();
		conditionMap.put("제목", "TITLE");
		conditionMap.put("내용", "CONTENT");
		return conditionMap;
	}

}
