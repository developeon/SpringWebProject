package com.example.project.model.dao;

import com.example.project.model.dto.MemberVO;

public interface LoginDAO {
   public boolean loginCheck(MemberVO vo);
   public MemberVO viewMember(MemberVO vo);
}
