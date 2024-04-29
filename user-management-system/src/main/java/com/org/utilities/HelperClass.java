package com.org.utilities;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class HelperClass 
{
	private static Connection con ;
	
	static 
	{
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/user_mgmt","root","root");
		}
		catch (SQLException | ClassNotFoundException e) {
			e.printStackTrace();
		}
		
	}
	public static Connection getDBConnection() 
	{
		return con;
	}
}
