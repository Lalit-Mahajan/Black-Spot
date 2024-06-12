package com.root.components;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

import com.root.dbConnect.ConnectDB;

/**
 * Servlet implementation class RegisterUser
 */
public class RegisterUser extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public RegisterUser() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);

		String name = request.getParameter("name");
		String email = request.getParameter("email");
		String mobile = request.getParameter("mobile");
		String password = request.getParameter("password");
		String city = request.getParameter("city");
		try {
			Connection con = ConnectDB.getConnect();
			PreparedStatement ps1 = con.prepareStatement("insert into user values(?,?,?,?,?,?)");
			ps1.setInt(1, 0);
			ps1.setString(2, name);
			ps1.setString(3, email);
			ps1.setString(4, mobile);
			ps1.setString(5, password);
			ps1.setString(6, city);
			int i = ps1.executeUpdate();
			if (i > 0) {
				UserData.getCity();
				response.sendRedirect("UserLogin.html");
			} else {
				response.sendRedirect("Fail.html");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
