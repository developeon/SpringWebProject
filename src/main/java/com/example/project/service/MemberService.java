package com.example.project.service;

import java.util.List;

import com.example.project.model.dto.MemberVO;

public interface MemberService {
  //회원 목록
	public List<MemberVO> memberList();
	
 //회원 입력
	public void insertMember(MemberVO vo);
	
  //회원 정보 상세 보기
	public MemberVO viewMember(String userId);
	
  // 회원 삭제
	public void deleteMember(String userId);
	
  // 정보 수정
	public void updateMember(MemberVO vo);
	
	public boolean checkPw(String userId, String userPw);
}
