package kr.ac.kopo.yours.dao;


import kr.ac.kopo.yours.model.Account;

public interface AccountDao {

	Account loginAction(Account account);

	void signup(Account item);

	void delete(Account item);

	Account item(Account item);

	int checkId(Account item);

	Account idFind(Account item);

	Object accountCheck(Account item);

	void accountUpdate(Account item);

	void passwdUpdate(Account item);

}
