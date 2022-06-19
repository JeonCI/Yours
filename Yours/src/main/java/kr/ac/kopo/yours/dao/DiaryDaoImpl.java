package kr.ac.kopo.yours.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.ac.kopo.yours.model.Diary;
import kr.ac.kopo.yours.model.Empathy;
import kr.ac.kopo.yours.utill.Pager;

@Repository
public class DiaryDaoImpl implements DiaryDao {
	
	@Autowired
	SqlSession sql;
	
	@Override
	public int total() {
		return sql.selectOne("diary.total");
	}

	@Override
	public List<Diary> list(Pager pager) {
		return sql.selectList("diary.list", pager);
	}

	@Override
	public void add(Diary item) {
		sql.insert("diary.add", item);
	}

	@Override
	public Diary item(Diary item) {
		return sql.selectOne("diary.item", item);
	}

	@Override
	public void update(Diary item) {
		sql.update("diary.update", item);
	}

	@Override
	public void delete(int code) {
		sql.delete("diary.delete", code);
	}

	@Override
	public void addEmpathy(Diary item) {
		sql.insert("diary.addEmpathy", item);
	}

	@Override
	public void deleteEmpathy(Diary item) {
		sql.delete("diary.deleteEmpathy", item);
	}

	@Override
	public List<Diary> timelineList(Pager pager) {
		return sql.selectList("diary.timelineList", pager);
	}

	@Override
	public Empathy itemEmpathy(Empathy vo) {
		return sql.selectOne("diary.itemEmpathy", vo);
	}

	@Override
	public List<Diary> dummyList(Pager pager) {
		return sql.selectList("diary.dummyList", pager);
	}

	@Override
	public int getCategory1(Pager pager) {
		return sql.selectOne("diary.category1", pager);
	}

	@Override
	public int getCategory2(Pager pager) {
		return sql.selectOne("diary.category2", pager);
	}

	@Override
	public int getCategory3(Pager pager) {
		return sql.selectOne("diary.category3", pager);
	}

	@Override
	public int getCategory4(Pager pager) {
		return sql.selectOne("diary.category4", pager);
	}

	@Override
	public int getCategory5(Pager pager) {
		return sql.selectOne("diary.category5", pager);
	}

}
