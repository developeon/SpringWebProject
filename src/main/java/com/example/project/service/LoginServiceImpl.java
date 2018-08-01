package com.example.project.service;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;

import com.example.project.model.dao.LoginDAO;
import com.example.project.model.dao.MemberDAO;
import com.example.project.model.dto.MemberVO;

@Service
public class LoginServiceImpl implements LoginService {
	@Inject
	LoginDAO loginDao; 

	@Override
	public boolean loginCheck(MemberVO vo, HttpSession session) {
		// TODO Auto-generated method stub
		
		boolean result=loginDao.loginCheck(vo);
		if(result)
		{
			MemberVO vo2=viewMember(vo);
			session.setAttribute("userId", vo2.getUserId());
			session.setAttribute("userName", vo2.getUserName());
		}
		
		
		return result;
	}

	@Override
	public MemberVO viewMember(MemberVO vo) {
		// TODO Auto-generated method stub
		return loginDao.viewMember(vo);
	}

	@Override
	public void logout(HttpSession session) {
		// TODO Auto-generated method stub
		session.removeAttribute("userId");
		session.invalidate();
		
	}
 
}
