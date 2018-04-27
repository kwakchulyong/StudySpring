package com.test.controller;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.test.member.Member;
import com.test.member.MemberJdbcRepository;

@Controller
public class MemberController {
	
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired
	MemberJdbcRepository repository;
	
	@RequestMapping(value="/")
	public String index() {
		return "index";
	}
	
	@RequestMapping(value="/insertForm")
	public String insertForm() {
		return "insertForm";
	}
	
	
	@RequestMapping(value="/list")
	public String list(Model model) {
		logger.info("MemberController.list :: start");
		
		List<Member> memberList = repository.findAll();
	    logger.info("Student : ", memberList);
	    model.addAttribute("memberList", memberList);
		
	    
	    logger.info("MemberController.list :: list");
	    
		return "list";
	}
	
	@RequestMapping("/write")
	public String write(Member member) {
		logger.info("MemberController.write :: start");
		logger.info( member.getName());
		logger.info( member.getPassword());
		
		repository.insert(member);

		logger.info("MemberController.write :: end");
		
		return "redirect:/list";
	}
	
	
	/*
	 * input : name
	 * output : 
	 * True : not already registered
	 * False : already registered
	 * */
	
	@ResponseBody
    @RequestMapping("/checkId")
    public String checkId(Member member){
		logger.info("MemberController.checkId :: start");
		
		String result = repository.findByName(member.getName());

		logger.info("MemberController.checkId :: end");
        return result;
    }
	
}
