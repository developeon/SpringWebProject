package com.example.project.service;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;

import com.example.project.model.dao.BoardDAO;
import com.example.project.model.dto.BoardVO;

@Service
public class BoardServiceImpl implements BoardService {
	@Inject
	BoardDAO boardDao;
// 1. 글쓰기
	@Override
	public void create(BoardVO vo) {
		// TODO Auto-generated method stub
		String title=vo.getTitle();
		String content=vo.getContent();
		String writer=vo.getWriter();
		
		vo.setTitle(title);
		vo.setContent(content);
		vo.setWriter(writer);
		System.out.println(writer);
		boardDao.create(vo);
				
	}
	
//2. 상세보기
	@Override
	public BoardVO read(int bno) {
		// TODO Auto-generated method stub
		return boardDao.read(bno);
	}
 //3. 수정
	@Override
	public void update(BoardVO vo) {
		// TODO Auto-generated method stub
		boardDao.update(vo);
	}

	@Override
	public void delete(int bno) {
		// TODO Auto-generated method stub
		boardDao.delete(bno);
	}

	@Override
	public List<BoardVO> listAll(int start,int end,String searchOption, String keyword) {
		// TODO Auto-generated method stub
		return boardDao.listAll(start,end,searchOption, keyword);
	}

	@Override
	public void increaseViewcnt(int bno) {
		// TODO Auto-generated method stub
		boardDao.increaseViewcnt(bno);
		
	}

	

	@Override
	public int countArticle(String searchOption, String keyword) {
		// TODO Auto-generated method stub
		return boardDao.countArticle(searchOption, keyword);
	}
	


}
