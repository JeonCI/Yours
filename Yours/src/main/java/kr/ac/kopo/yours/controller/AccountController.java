package kr.ac.kopo.yours.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.ac.kopo.yours.model.Account;
import kr.ac.kopo.yours.service.AccountService;

@Controller
@RequestMapping("/account")
public class AccountController {
	final String path = "account/";
	
	@Autowired
	AccountService service;
	
	@GetMapping({"/", "login"})
	public String login() {
		return path + "login";
	}
	
	@PostMapping("/loginaction")
	public String loginAction(Account account, HttpSession session, RedirectAttributes ra) {
		if(service.loginAction(account)) {
			account = service.item(account.getId());
			
			account.setPasswd("");
			
			session.setAttribute("account", account);
			
			return "redirect:../";
		} else {
			ra.addAttribute("msg", "아이디 또는 비밀번호를 확인해주세요.");
			
			return "redirect:./";
		}
	}
	
	
	@GetMapping("/signup")
	public String signup() {
		return path + "signup";
	}
	
	@PostMapping("/signup")
	public String signup(Account item) {
		service.signup(item);
		
		return "redirect:./";
	}
	
	@ResponseBody
	@PostMapping("/checkId")
	public Boolean checkId(Account item) {	
		if(service.checkId(item)) {
			return true;
		} else {
			return false;
		}
	}
	
	@GetMapping("/userfind")
	public String userFind() {
		return path + "userfind";
	}
	
	@ResponseBody
	@PostMapping("/idfind")
	public String idFind(Account item) {
		
		Account vo = service.idFind(item);
		
		System.out.println(vo.getId());
		
		if(vo.getId() != null) {
			return vo.getId();
		} else {
			return null;
		}
	}
	
	@ResponseBody
	@PostMapping("/passwdfind")
	public Boolean passwdFind(Account item) {
		if(service.passwdFine(item)) {
			return true;
		} else {
			return false;
		}
	}
	
	@GetMapping("/accountupdate")
	public String accountUpdate(Model model, HttpSession session) {
		Account item = (Account) session.getAttribute("account");
		
		model.addAttribute("item", item);
		
		return path + "accountupdate";
	}
	
	@PostMapping("/accountupdate")
	public String accountUpdate(Account item, HttpSession session) {
		Account vo = (Account) session.getAttribute("account");
		
		item.setId(vo.getId());
		
		service.accountUpdate(item);
		
		return "redirect:./";
	}
	
	@PostMapping("/passwdupdate")
	public String passwdtUpdate(Account item, HttpSession session) {
		Account vo = (Account) session.getAttribute("account");
		
		item.setId(vo.getId());
		
		service.passwdUpdate(item);
		
		return "redirect:../diary/";
	}
	
	@ResponseBody
	@RequestMapping("/deleteaccount")
	public String accountDelete(Account item) {
		
		service.delete(item);
		
		return "OK";
	}
	
}
