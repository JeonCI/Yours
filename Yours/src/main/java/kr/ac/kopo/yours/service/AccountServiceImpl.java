package kr.ac.kopo.yours.service;

import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.ac.kopo.yours.dao.AccountDao;
import kr.ac.kopo.yours.dao.DiaryDao;
import kr.ac.kopo.yours.model.Account;

@Service
public class AccountServiceImpl implements AccountService {
	
	@Autowired
	JavaMailSender mailSender;
	 
	@Autowired
	AccountDao dao;
	
	@Override
	public boolean loginAction(Account account) {
		Account item = dao.loginAction(account);
		
		if(item == null) {
			return false;
		} else {
			account = item;
			
			account.setPasswd("");
			
			return true;
		}
	}

	@Override
	public void signup(Account item) {
		dao.signup(item);
	}

	@Override
	public Account item(String id) {
		Account item = new Account();
		
		item.setId(id);
		
		return dao.item(item);
	}

	@Override
	public void delete(Account item) {
		dao.delete(item);
	}

	@Override
	public boolean checkId(Account item) {
		int result = dao.checkId(item);
		
		if(result > 0)
			return false;
		else
			return true;
	}

	@Override
	public Account idFind(Account item) {
		Account vo = dao.idFind(item);
		
		if(vo == null) {
			vo = new Account();
		}
		
		return vo;
	}
	
	@Transactional
	@Override
	public boolean passwdFine(Account item) {
		if(dao.accountCheck(item) == null) {
			return false;
		} else {
			char[] charSet = new char[] { '0', '1', '2', '3', '4', '5', '6', '7', '8', '9', 'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z' };
			Account vo = dao.item(item);
			String pw = "";
			
			for(int i = 0 ; i < 6 ; i++) {
				int idx = (int) (charSet.length * Math.random());
				
				pw += charSet[idx];
			}
			
			vo.setPasswd(pw);
			
			dao.passwdUpdate(vo);
			
			sendEmailJavaxEmail(vo);
			
			return true;
		}
	}
	
	private void sendEmailJavaxEmail(Account vo) {
		String subject = "[Yours] 안녕하십니까," + vo.getName() + "님!";
		
		String msg = vo.getName() + "님, 임시비밀번호가 발급되었습니다.";
		msg += "\n 변경된 임시비밀번호는 <" + vo.getPasswd() + "> 입니다.";
		msg += "\n 비밀번호 변경후 이용해주시기 바랍니다!";
		
		String from = "cjsdlr2060@gmail.com";
		String to = vo.getEmail();
		
		
		
		try {
			MimeMessage mail = mailSender.createMimeMessage();
			MimeMessageHelper mailHelper = new MimeMessageHelper(mail, "UTF-8");
			
			mailHelper.setFrom(from);
			mailHelper.setTo(to);
			mailHelper.setSubject(subject);
			mailHelper.setText(msg);
			
			mailSender.send(mail);
		} catch (Exception e) {
			System.out.println(e);
		}
	}

	@Override
	public void accountUpdate(Account item) {
		dao.accountUpdate(item);
	}

	@Override
	public void passwdUpdate(Account item) {
		dao.passwdUpdate(item);
	}
}
