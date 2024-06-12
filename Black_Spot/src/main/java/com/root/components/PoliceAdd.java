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
 * Servlet implementation class PoliceAdd
 */
public class PoliceAdd extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PoliceAdd() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
		String name=request.getParameter("name");
		String address=request.getParameter("address");
		String mobile=request.getParameter("mobile");
		String email=request.getParameter("email");
		String password=request.getParameter("password");
		
		try {
			Connection con=ConnectDB.getConnect();
			PreparedStatement ps1=con.prepareStatement("insert into addpolice values(?,?,?,?,?,?)");
			ps1.setInt(1,0);
			ps1.setString(2,name);
			ps1.setString(3, address);
			ps1.setString(4,mobile);
			ps1.setString(5,email);
			ps1.setString(6,password);
			int i=ps1.executeUpdate();
			if(i>0)
			{
				response.sendRedirect("LoginSpot.html");
			}
			else {
				response.sendRedirect("AddPloce.html");
			}
			
		}
		catch(Exception e) {
			e.printStackTrace();
		}
	}

}
