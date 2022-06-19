package kr.ac.kopo.yours.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.ac.kopo.yours.model.Account;
import kr.ac.kopo.yours.model.Diary;
import kr.ac.kopo.yours.service.DiaryService;
import kr.ac.kopo.yours.utill.Pager;


@Controller
public class RootController {
	
	@Autowired
	DiaryService diaryService;
	
	@RequestMapping("/")
	public String index() {
		return "index";
	}
	
	@RequestMapping("/timeline")
	public String timeline(Pager pager, Model model, HttpSession session) {
		if(session.getAttribute("account") == null) {
			return "account/login";
		}
		Account user = (Account) session.getAttribute("account");
		
		List<Diary> list = diaryService.timelineList(pager, user);
		
		model.addAttribute("list", list);
		
		return "timeline";
	}
	
	@ResponseBody
	@PostMapping("/addEmpathy")
	public Boolean addEmpathy(Diary item) {
		diaryService.addEmpathy(item);
		
		return true;
	}
	
	@ResponseBody
	@PostMapping("/deleteEmpathy")
	public Boolean deleteEmpathy(Diary item) {
		diaryService.deleteEmpathy(item);
		
		return true;
	}
	
	@RequestMapping("/logout")
	public String logout(HttpSession session) {
		session.invalidate();
		
		return "redirect:.";
	}
}