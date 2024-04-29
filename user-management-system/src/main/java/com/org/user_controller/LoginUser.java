package com.org.user_controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.org.dao.UserDao;
import com.org.dto.User;

@WebServlet("/login_user")
public class LoginUser extends HttpServlet{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
			
			HttpSession session = req.getSession();
			session.setMaxInactiveInterval(20);
		
			String email = req.getParameter("email");
			String password = req.getParameter("password");
			
			UserDao dao = new UserDao();
			User user = dao.fetchUserByEmailAndPassword(email, password);
			
			if (user != null)
			{
				session.setAttribute("userObj", user);
				resp.sendRedirect("home.jsp");
			}
			else 
			{
				session.setAttribute("fail", "Invalid email or password");
				resp.sendRedirect("login.jsp");
			}
	}
}
