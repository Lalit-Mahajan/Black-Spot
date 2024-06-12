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
 * Servlet implementation class SpotBlack
 */
public class SpotBlack extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public SpotBlack() {
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
		String address = request.getParameter("address");
		String reason = request.getParameter("reason");
		int latitude = Integer.parseInt(request.getParameter("latitude"));
		int longitude = Integer.parseInt(request.getParameter("longitude"));
		String level = request.getParameter("level");

		String z = null;
		if (level.equals("level 0")) {
			z = "Yellow";
		} else if (level.equals("level 1")) {
			z = "Orange";
		} else if (level.equals("level 2")) {
			z = "Red";
		}
		try {
			System.out.println(UserData.getCity());
			Connection con = ConnectDB.getConnect();
			PreparedStatement ps1 = con.prepareStatement("insert into addspot values(?,?,?,?,?,?,?,?,?,?)");
			ps1.setInt(1, 0);
			ps1.setString(2, name);
			ps1.setString(3, address);
			ps1.setString(4, reason);
			ps1.setInt(5, latitude);
			ps1.setInt(6, longitude);
			ps1.setString(7, level);
			ps1.setString(8, z);
			ps1.setString(9, UserData.getCity());
			ps1.setInt(10, UserData.getPsid());
			int i = ps1.executeUpdate();
			if (i > 0) {
				response.sendRedirect("Success.html");
			} else {
				response.sendRedirect("LoginSpot.html");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
