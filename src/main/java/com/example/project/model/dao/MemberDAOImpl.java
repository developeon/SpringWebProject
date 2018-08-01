package com.example.project.model.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.example.project.model.dto.MemberVO;

// 현재 클래스를 DAO Bean으로 등록시켜주는 역할
@Repository
public class MemberDAOImpl implements MemberDAO {

	//외부에서 객체를 주입시켜 주게 된다.
	@Inject 
	SqlSession sqlSession;
	
	@Override
	public List<MemberVO> memberList() {
		// TODO Auto-generated method stub
		return sqlSession.selectList("member.memberList");
	}

	@Override
	public void insertMember(MemberVO vo) {
		// TODO Auto-generated method stub
		sqlSession.insert("member.insertMember",vo);
	}

	@Override
	public MemberVO viewMember(String userId) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("member.viewMember", userId);
	}

	@Override
	public void deleteMember(String userId) {
		// TODO Auto-generated method stub
		sqlSession.delete("member.deleteMember",userId);
	}

	@Override
	public void updateMember(MemberVO vo) {
		// TODO Auto-generated method stub
		sqlSession.update("member.updateMember",vo);
	}
	
	public boolean checkPw(String userId, String userPw) {
		boolean result=false;
		Map<String, String> map=new HashMap<String, String>();
		map.put("userId",userId);
		map.put("userPw",userPw);
		int count=sqlSession.selectOne("member.checkPw", map);
		if(count==1) result=true;
		return result;
	}
	
	
	//회원 목록
	

}
