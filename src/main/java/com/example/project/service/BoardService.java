package com.example.project.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import com.example.project.model.dto.BoardVO;
public interface BoardService {
    // 01. �Խñ� �ۼ�
    public void create(BoardVO vo) ;
    // 02. �Խñ� �󼼺���
    public BoardVO read(int bno) ;
    // 03. �Խñ� ����
    public void update(BoardVO vo) ;
    // 04. �Խñ� ����
    public void delete(int bno) ;
    // 05. �Խñ� ��ü ���
    public List<BoardVO> listAll(int start,int end,String searchOption, String keyword);
    // 06. �Խñ� ��ȸ
    public void increaseViewcnt(int bno) ;
    
    public int countArticle(String searchOption, String keyword);
}