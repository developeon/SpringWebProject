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
	
	//01. ȸ�� ���
	@RequestMapping("member/list.do")
	public String memberList(Model model){
		//controller -> service -> dao ��û
		List<MemberVO> list=memberService.memberList();
		model.addAttribute("list",list);
		return "member/member_list";
	}
	
	//02. ȸ�� ���(ȭ��) ������ 
	@RequestMapping("member/write.do")
	public String memberWrite() {
		return "member/member_write";		
	}
	
	//02-01. ȸ�� ��� �� �� ó���ϴ� ���
	@RequestMapping("member/insert.do")
	public String memberInsert(@ModelAttribute MemberVO vo ) {
		memberService.insertMember(vo);
		return "redirect:/member/list.do";
	}
	
	
	//03. ȸ�� ���� �� ����
	@RequestMapping("member/view.do")
	public String memberView(String userId, Model model) {
		model.addAttribute("dto", memberService.viewMember(userId));
		return "member/member_view";
	}
	
	// 04. ȸ�� ���� ���� ó��
   @RequestMapping("member/update.do")
   public String memberUpdate(@ModelAttribute MemberVO vo, Model model)
   {
	   boolean result=memberService.checkPw(vo.getUserId(), vo.getUserPw());
	   if(result) {
		   memberService.updateMember(vo);
		   return "redirect:/member/list.do";
	   }
	   else {
		   // ��¥..ǥ�� �ȵ�
		   model.addAttribute("dto",vo);
		   model.addAttribute("message","��й�ȣ����ġ");
		   return "member/member_view";
	   }
   }
   
   //05. ȸ�� ���� ó��
   
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
		   model.addAttribute("message","��� ����ġ");
		  // model.addAttribute("dto",memberService.viewMember(userId));
		   model.addAttribute("dto",memberService.viewMember(vo.getUserId()));
		   return "member/member_view"; 
	   }
   }

	

}
