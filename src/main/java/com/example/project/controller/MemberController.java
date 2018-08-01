package com.example.project.controller;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.project.model.dto.MemberVO;
import com.example.project.service.MemberService;

@Controller
public class MemberController {
	@Inject
	MemberService memberService;
	
	//01. 회원 목록
	@RequestMapping("member/list.do")
	public String memberList(Model model){
		//controller -> service -> dao 요청
		List<MemberVO> list=memberService.memberList();
		model.addAttribute("list",list);
		return "member/member_list";
	}
	
	//02. 회원 등록(화면) 페이지 
	@RequestMapping("member/write.do")
	public String memberWrite() {
		return "member/member_write";		
	}
	
	//02-01. 회원 등록 한 뒤 처리하는 방법
	@RequestMapping("member/insert.do")
	public String memberInsert(@ModelAttribute MemberVO vo ) {
		memberService.insertMember(vo);
		return "redirect:/member/list.do";
	}
	
	
	//03. 회원 정보 상세 보기
	@RequestMapping("member/view.do")
	public String memberView(String userId, Model model) {
		model.addAttribute("dto", memberService.viewMember(userId));
		return "member/member_view";
	}
	
	// 04. 회원 정보 수정 처리
   @RequestMapping("member/update.do")
   public String memberUpdate(@ModelAttribute MemberVO vo, Model model)
   {
	   boolean result=memberService.checkPw(vo.getUserId(), vo.getUserPw());
	   if(result) {
		   memberService.updateMember(vo);
		   return "redirect:/member/list.do";
	   }
	   else {
		   // 날짜..표시 안됨
		   model.addAttribute("dto",vo);
		   model.addAttribute("message","비밀번호불일치");
		   return "member/member_view";
	   }
   }
   
   //05. 회원 삭제 처리
   
   @RequestMapping("member/delete.do")
   
   public String memberDelete(@ModelAttribute MemberVO vo, Model model) {
 //  public String memberDelete(@RequestParam String userId, @RequestParam String userPw, Model model) {
	 //  boolean result=memberService.checkPw(userId, userPw);
	   boolean result=memberService.checkPw(vo.getUserId(), vo.getUserPw());
	   if(result) {
		  // memberService.deleteMember(userId);
		   memberService.deleteMember(vo.getUserId());
		   return "redirect:/member/list.do";
	   }else {
		   model.addAttribute("message","비번 불일치");
		  // model.addAttribute("dto",memberService.viewMember(userId));
		   model.addAttribute("dto",memberService.viewMember(vo.getUserId()));
		   return "member/member_view"; 
	   }
   }

	

}
