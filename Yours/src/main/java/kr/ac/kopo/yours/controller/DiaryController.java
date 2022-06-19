package kr.ac.kopo.yours.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.ac.kopo.yours.model.Account;
import kr.ac.kopo.yours.model.DailyFeelings;
import kr.ac.kopo.yours.model.Diary;
import kr.ac.kopo.yours.service.AccountService;
import kr.ac.kopo.yours.service.DiaryService;
import kr.ac.kopo.yours.utill.Pager;

@Controller
@RequestMapping("/diary")
public class DiaryController {
	final String path = "diary/";
	
	@Autowired
	DiaryService service;
	
	@Autowired
	AccountService accountService;
	
	@RequestMapping({"/","diary"})
	public String diary(Model model, Pager pager, HttpSession session) {
		if(session.getAttribute("account") == null) {
			return "account/login";
		}
		
		Account accountVo = (Account) session.getAttribute("account");
		
		pager.setId(accountVo.getId());
		
		List<Diary> list = service.list(pager);
		
		model.addAttribute("list", list);
		
		return path + "diary";
	}
	
	@GetMapping("/add")
	public String add() {
		return path + "add";
	}
	
	@PostMapping("/add") //감정일기를 등록할 때 실행되는 메소드
	public String add(Diary item, @RequestParam("feeling") List<String> strFeels) { //Diary 자료형의 item 객체와 feeling이라는 이름의 파라미터를 String배열로 생성하여 가져옴
		List<DailyFeelings> feels = new ArrayList<DailyFeelings>(); //DailyFeelings 자료형으로 feels 배열을 생성
		
		for(String feel : strFeels) { //strFeels배열의 요소를 하나씩 꺼내서 DailyFeelings 자료형으로 바꾸어주고 feels 배열에 삽입
			DailyFeelings vo = new DailyFeelings();
			vo.setFeeling(feel);
			
			feels.add(vo);
		}
		
		item.setFeels(feels); //item객체에 생성된 feels배열을 저장해줌
		
		service.add(item); //item객체를 담아서 service에 add메소드를 요청
		
		return "redirect:./";
	}
	
	@GetMapping("/diaryupdate/{code}")
	public String diaryUpdate(Model model, @PathVariable int code) {
		Diary item = service.item(code);
		
		model.addAttribute("item", item);
		
		return path + "diaryupdate";
	}
	
	@PostMapping("/diaryupdate/{code}")
	public String diaryUpdate(Diary item, @PathVariable int code, @RequestParam("feeling") List<String> strFeels) {
		List<DailyFeelings> feels = new ArrayList<DailyFeelings>();
		
		for(String feel : strFeels) {
			DailyFeelings vo = new DailyFeelings();
			vo.setFeeling(feel);
			
			feels.add(vo);
		}
		
		item.setFeels(feels);	
		
		service.update(item);
		
		return "redirect:.././";
	}
	
	@RequestMapping("/diarydelete/{code}")
	public String delete(@PathVariable int code, HttpSession session) {
		Account accountVo = (Account) session.getAttribute("account");
		
		Diary item = new Diary();
		
		item.setId(accountVo.getId());
		item.setCode(code);
		
		service.delete(item);
		
		return "redirect:.././";
	}
	
	@RequestMapping("/view/{code}")
	public String view(@PathVariable int code, Model model) {
		Diary item = service.item(code);
		
		model.addAttribute("item", item);
		
		return path + "view";
	}

}
