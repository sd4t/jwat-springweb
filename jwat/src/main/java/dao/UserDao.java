package dao;

import javax.persistence.Query;
import javax.transaction.Transactional;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.context.annotation.ScopedProxyMode;
import org.springframework.stereotype.Repository;

import entity.Users;


@Repository
@Scope(proxyMode = ScopedProxyMode.TARGET_CLASS)
public class UserDao {
	@Autowired
	SessionFactory sessionFactory;
	
	@Transactional
	public boolean checkLogin(String email, String password) throws Exception{
		Session session = sessionFactory.getCurrentSession();
		String sql = "from users where email = :email and password = :password";
		Query query = session.createQuery(sql);
		query.setParameter("email", email);
		query.setParameter("password", password);
		Users user = (Users) query.getSingleResult();
		if(user != null) return true;
		return false;
	}
}
