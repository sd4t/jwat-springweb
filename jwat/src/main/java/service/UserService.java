package service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dao.UserDao;

@Service
public class UserService {
	@Autowired
	UserDao userDao;
	
	public boolean checkLogin(String email, String password) {
		try {
			return userDao.checkLogin(email, password);
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
	}
}
