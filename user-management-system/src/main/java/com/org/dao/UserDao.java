package com.org.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import com.org.dto.User;
import com.org.utilities.HelperClass;

public class UserDao
{
	
	public void SaveUser(User user) {
		Connection con = HelperClass.getDBConnection();
		try {
			PreparedStatement pst = con
					.prepareStatement("insert into user(name,age,mobile,email,password) values (?,?,?,?,?)");

			pst.setString(1, user.getName());
			pst.setInt(2, user.getAge());
			pst.setLong(3, user.getMobile());
			pst.setString(4, user.getEmail());
			pst.setString(5, user.getPassword());

			pst.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	public List<User> fetchAllUsers() 
	{
		Connection con = HelperClass.getDBConnection();
		User user = new User();
		List<User> list = new ArrayList<User>();
		try {

			PreparedStatement pst = con.prepareStatement("select* from user");
			ResultSet rst = pst.executeQuery();
			while (rst.next()) {
				user = new User();
				user.setId(rst.getInt("id"));
				user.setName(rst.getString("name"));
				user.setAge(rst.getInt("age"));
				user.setMobile(rst.getLong("mobile"));
				user.setEmail(rst.getString("email"));
				user.setPassword(rst.getString("password"));

				list.add(user);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}

	public User fetchUserById(int id) 
	{
		Connection con = HelperClass.getDBConnection();
		User user = new User();
		
		try 
		{
			PreparedStatement pst = con.prepareStatement("select* from user where id ="+id);
			ResultSet rst = pst.executeQuery();
			if(rst.next()) {
				user = new User();
				user.setId(rst.getInt("id"));
				user.setName(rst.getString("name"));
				user.setAge(rst.getInt("age"));
				user.setMobile(rst.getLong("mobile"));
				user.setEmail(rst.getString("email"));
				user.setPassword(rst.getString("password"));
				
				return user;
				}

			} 
		catch (Exception e) 
		{
		e.printStackTrace();
		}
	return user;
  }
	
	public void UpdateUserById(User user) {

		Connection con = HelperClass.getDBConnection();

		try {
			PreparedStatement pst = con.prepareStatement("update user set name=?,age=?,mobile=?,email=? where id=?");
			pst.setString(1, user.getName());
			pst.setInt(2, user.getAge());
			pst.setLong(3, user.getMobile());
			pst.setString(4, user.getEmail());
			pst.setInt(5, user.getId());

			pst.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public void deleteUserById(int id) 
	{
		Connection connection = HelperClass.getDBConnection();
		try 
		{
			PreparedStatement pst= connection.prepareStatement("delete from user where id="+id);
			pst.executeUpdate();
		}
		catch (Exception e)
		{
				e.printStackTrace();
		}
	}

	public User fetchUserByEmailAndPassword(String email, String password) {
		Connection con = HelperClass.getDBConnection();

		try {
			PreparedStatement pst = con.prepareStatement("select * from user where email = ? and password = ?");

			pst.setString(1, email);
			pst.setString(2, password);

			ResultSet rst = pst.executeQuery();

			User user = null;
			if (rst.next()) {
				int id = rst.getInt("id");
				String name = rst.getString("name");
				int age = rst.getInt("age");
				long mobile = rst.getLong("mobile");
				String email1 = rst.getString("email");
				String password1 = rst.getString("password");

				user = new User();
				user.setId(id);
				user.setName(name);
				user.setAge(age);
				user.setMobile(mobile);
				user.setEmail(email1);
				user.setPassword(password1);

			}
			return user;

		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

}
