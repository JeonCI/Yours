package kr.ac.kopo.yours.service;

import java.util.List;

import kr.ac.kopo.yours.model.Account;
import kr.ac.kopo.yours.model.Diary;
import kr.ac.kopo.yours.utill.Pager;

public interface DiaryService {

	List<Diary> list(Pager pager);

	void add(Diary item);

	Diary item(int code);

	void update(Diary item);

	void delete(Diary item);

	List<Diary> timelineList(Pager pager, Account user);

	void addEmpathy(Diary item);

	void deleteEmpathy(Diary item);
}
