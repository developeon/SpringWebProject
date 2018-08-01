package com.example.project.model.dao;

import java.util.List;

import com.example.project.model.dto.BoardVO;

public interface BoardDAO {
	
	//1. 게시글 작성
	public void create(BoardVO vo);
	
	//2. 게시글 상세 보기
	public BoardVO read(int bno);
	
	//3. 게시글 수정
	public void update(BoardVO vo);
	
	//4. 게시글 삭제
	public void delete(int bno);
	
	//5. 게시글 전체 목록보기
	public List<BoardVO> listAll(int start, int end, String searchOption,String keyword); 
	
	//6. 게시글 조회수 증가
	public void increaseViewcnt(int bno);
	
	public int countArticle(String searchOption, String keyword);

}
