package kr.ac.kopo.yours.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.ac.kopo.yours.dao.DiaryDao;
import kr.ac.kopo.yours.dao.FeelingsDao;
import kr.ac.kopo.yours.model.Account;
import kr.ac.kopo.yours.model.DailyFeelings;
import kr.ac.kopo.yours.model.Diary;
import kr.ac.kopo.yours.model.Empathy;
import kr.ac.kopo.yours.utill.Pager;

@Service
public class DiaryServiceImpl implements DiaryService {

	@Autowired
	DiaryDao dao;
	
	@Autowired
	FeelingsDao feelingsDao;
	
	@Override
	public List<Diary> list(Pager pager) {
		int total = dao.total();
		
		pager.setCategory1(dao.getCategory1(pager));
		pager.setCategory2(dao.getCategory2(pager));
		pager.setCategory3(dao.getCategory3(pager));
		pager.setCategory4(dao.getCategory4(pager));
		pager.setCategory5(dao.getCategory5(pager));
		
		pager.setTotal(total);
		
		return dao.list(pager);
	}
	
	@Transactional
	@Override
	public void add(Diary item) {
		dao.add(item);
		
		List<DailyFeelings> feelings = item.getFeels();
		
		for(DailyFeelings feeling : feelings) {
			feeling.setId(item.getId());
			
			DailyFeelings vo = feelingsDao.checkFeeling(feeling);
			
			if(vo == null) {
				feelingsDao.addFeeling(feeling);
			} else {
				feeling.setFeelingCode(vo.getCode());
			}
			
			feeling.setDiaryCode(item.getCode());
			
			feelingsDao.addDailyFeelings(feeling);
		}
		
	}

	@Override
	public Diary item(int code) {
		Diary item = new Diary();
		item.setCode(code);
		
		return dao.item(item);
	}
	
	@Transactional
	@Override
	public void update(Diary item) {
		dao.update(item);
		
		DailyFeelings vo = new DailyFeelings();
		
		vo.setDiaryCode(item.getCode());
		
		feelingsDao.delete(vo);
		
		List<DailyFeelings> feelings = item.getFeels();
		
		for(DailyFeelings feeling : feelings) {
			feeling.setId(item.getId());
			
			vo = null;
			
			vo = feelingsDao.checkFeeling(feeling);
			
			if(vo == null) {
				feelingsDao.addFeeling(feeling);
			} else {
				feeling.setFeelingCode(vo.getCode());
			}
			
			feeling.setDiaryCode(item.getCode());
			
			feelingsDao.addDailyFeelings(feeling);
		}
	}
	
	@Transactional
	@Override
	public void delete(Diary item) {
		DailyFeelings vo = new DailyFeelings();
		
		vo.setDiaryCode(item.getCode());
		
		feelingsDao.delete(vo);
		
		dao.deleteEmpathy(item);
		
		dao.delete(item.getCode());
	}

	@Override
	public List<Diary> timelineList(Pager pager, Account user) {
		int total = dao.total();
		
		pager.setTotal(total);
		pager.setPerPage(10);
		pager.setGroupPage(10);
		
		List<Diary> diaryList = dao.dummyList(pager);
		
		List<Empathy> empathyList = new ArrayList<Empathy>();
		List<Diary> timelineList = new ArrayList<Diary>();
		
		for(Diary vo : diaryList) {
			Empathy dummy = new Empathy();
			Empathy empathy = new Empathy();
			
			dummy.setDiaryCode(vo.getCode());
			dummy.setId(user.getId());
			
			empathy = dao.itemEmpathy(dummy);
			
			if(empathy == null) {
				empathy = new Empathy();
			}
			
			empathyList.add(empathy);
		}
		
		for(Diary vo : diaryList) {
			Diary diary = new Diary();
			
			diary = dao.item(vo);
			
			diary.setEmpathyList(empathyList);
			
			timelineList.add(diary);
		}
		
		return timelineList;
	}

	@Override
	public void addEmpathy(Diary item) {
		dao.addEmpathy(item);
	}

	@Override
	public void deleteEmpathy(Diary item) {
		dao.deleteEmpathy(item);
	}
	
}
