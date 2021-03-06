package com.example.project.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.example.project.model.dto.MemberVO;
import com.example.project.service.LoginService;
 
 
@Controller 
@RequestMapping("/login/*") 
public class LoginController {
   
    @Inject
    LoginService loginService;
    
    // 01. 로그인 화면 
    @RequestMapping("login.do")
    public String login(){
        return "login/login";    // views/member/login.jsp로 포워드
    }
    
    // 02. 로그인 처리
    @RequestMapping("loginCheck.do")
    public String loginCheck(@ModelAttribute MemberVO vo, HttpSession session){
        boolean result = loginService.loginCheck(vo, session);
        ModelAndView mav = new ModelAndView();
        if (result == true) { // 로그인 성공
        	return "redirect:../";
        } else {    // 로그인 실패
            // login.jsp로 이동
        	session.setAttribute("msg", "failure");
        	return "redirect:login.do";
        }
       
    }
    
    // 03. 로그아웃 처리
    @RequestMapping("logout.do")
    public String logout(HttpSession session){
        loginService.logout(session);
        return "redirect:../";
    }
}