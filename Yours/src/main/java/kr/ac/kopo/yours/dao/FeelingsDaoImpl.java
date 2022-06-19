package kr.ac.kopo.yours.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.ac.kopo.yours.model.DailyFeelings;

@Repository
public class FeelingsDaoImpl implements FeelingsDao {
	
	@Autowired
	SqlSession sql;
	
	@Override
	public void addFeeling(DailyFeelings feeling) {
		sql.insert("feelings.addFeeling", feeling);
	}

	@Override
	public void addDailyFeelings(DailyFeelings feeling) {
		sql.insert("feelings.addDailyFeelings", feeling);
	}

	@Override
	public void delete(DailyFeelings vo) {
		sql.delete("feelings.deleteDailyFeelings", vo);
	}

	@Override
	public DailyFeelings checkFeeling(DailyFeelings feeling) {
		return sql.selectOne("feelings.checkFeeling", feeling);
	}

}
