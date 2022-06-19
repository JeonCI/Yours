package kr.ac.kopo.yours.dao;


import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.ac.kopo.yours.model.Account;

@Repository
public class AccountDaoImpl implements AccountDao {
	
	@Autowired
	SqlSession sql;
	
	@Override
	public Account loginAction(Account account) {
		return sql.selectOne("account.login", account);
	}

	@Override
	public void signup(Account item) {
		sql.insert("account.add", item);
	}

	@Override
	public void delete(Account item) {		
		sql.delete("account.delete", item);
	}

	@Override
	public Account item(Account item) {
		return sql.selectOne("account.item", item);
	}

	@Override
	public int checkId(Account item) {
		return sql.selectOne("account.checkId", item);
	}

	@Override
	public Account idFind(Account item) {
		return sql.selectOne("account.idFind", item);
	}

	@Override
	public Object accountCheck(Account item) {
		return sql.selectOne("account.accountCheck", item);
	}

	@Override
	public void accountUpdate(Account item) {
		sql.update("account.accountUpdate", item);
	}

	@Override
	public void passwdUpdate(Account item) {
		sql.update("account.passwdUpdate", item);
	}

}
