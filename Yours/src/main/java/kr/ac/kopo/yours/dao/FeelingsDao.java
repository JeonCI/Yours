package kr.ac.kopo.yours.dao;

import kr.ac.kopo.yours.model.DailyFeelings;

public interface FeelingsDao {

	void addFeeling(DailyFeelings feeling);

	void addDailyFeelings(DailyFeelings feeling);

	void delete(DailyFeelings vo);

	DailyFeelings checkFeeling(DailyFeelings feeling);

}
