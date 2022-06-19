package kr.ac.kopo.yours.service;

import kr.ac.kopo.yours.model.Account;

public interface AccountService {

	boolean loginAction(Account account);

	void signup(Account item);

	Account item(String id);

	void delete(Account item);

	boolean checkId(Account item);

	Account idFind(Account item);

	boolean passwdFine(Account item);

	void accountUpdate(Account item);

	void passwdUpdate(Account item);
}
