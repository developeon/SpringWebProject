package com.example.project.service;

import javax.servlet.http.HttpSession;

import com.example.project.model.dto.MemberVO;

public interface LoginService {
	public boolean loginCheck(MemberVO vo, HttpSession session);
    public MemberVO viewMember(MemberVO vo);
    public void logout(HttpSession session);
}
