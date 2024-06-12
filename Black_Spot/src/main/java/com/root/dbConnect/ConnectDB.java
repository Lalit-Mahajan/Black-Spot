package com.root.dbConnect;

import java.sql.Connection;
import java.sql.DriverManager;

public class ConnectDB {

	static Connection con=null;
	public static Connection getConnect()
	{
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			con=DriverManager.getConnection("jdbc:mysql://localhost:3306/blackspot", "root","Lalit@123");
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return con;	
	}

}
