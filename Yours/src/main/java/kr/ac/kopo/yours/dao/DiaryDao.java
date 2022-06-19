package kr.ac.kopo.yours.dao;

import java.util.List;

import kr.ac.kopo.yours.model.Diary;
import kr.ac.kopo.yours.model.Empathy;
import kr.ac.kopo.yours.utill.Pager;

public interface DiaryDao {

	int total();

	List<Diary> list(Pager pager);

	void add(Diary item);

	void update(Diary item);

	void delete(int code);

	Diary item(Diary item);

	void addEmpathy(Diary item);

	void deleteEmpathy(Diary item);

	List<Diary> timelineList(Pager pager);

	Empathy itemEmpathy(Empathy vo);

	List<Diary> dummyList(Pager pager);

	int getCategory1(Pager pager);
	
	int getCategory2(Pager pager);
	
	int getCategory3(Pager pager);
	
	int getCategory4(Pager pager);
	
	int getCategory5(Pager pager);

}
