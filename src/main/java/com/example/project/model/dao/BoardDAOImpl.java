package com.example.project.model.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.example.project.model.dto.BoardVO;

@Repository    // ���� Ŭ������ dao bean���� ���
public class BoardDAOImpl implements BoardDAO {
    @Inject
    SqlSession sqlSession;
    // 01. �Խñ� �ۼ�
    @Override
    public void create(BoardVO vo) {
        sqlSession.insert("board.insert",vo);
     }
    // 02. �Խñ� �󼼺���
    @Override
    public BoardVO read(int bno)  {
        return sqlSession.selectOne("board.view", bno);
    }
    // 03. �Խñ� ����
    @Override
    public void update(BoardVO vo) {
        sqlSession.update("board.updateArticle", vo);
 
    }
    // 04. �Խñ� ����
    @Override
    public void delete(int bno){
        sqlSession.delete("board.deleteArticle",bno);
 
    }
    // 05. �Խñ� ��ü ���
    @Override
    public List<BoardVO> listAll(int start, int end,String searchOption, String keyword)  {
    	Map<String, Object> map=new HashMap<String,Object>();
		map.put("searchOption", searchOption);
		map.put("keyword", keyword);
		map.put("start", start);
		map.put("end", end);
		return sqlSession.selectList("board.listAll",map);
    }
    // �Խñ� ��ȸ�� ����
    @Override
    public void increaseViewcnt(int bno)  {
        sqlSession.update("board.increaseViewcnt", bno);
    }
	
	@Override
	public int countArticle(String searchOption, String keyword) {
		// TODO Auto-generated method stub
		Map<String, String> map=new HashMap<String,String>();
		map.put("searchOption", searchOption);
		map.put("keyword", keyword);
		return sqlSession.selectOne("board.countArticle",map);
	}
 
}
