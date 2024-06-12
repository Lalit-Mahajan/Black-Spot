<%@page import="java.sql.*"%>
<%@page import="com.root.dbConnect.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%-- <%@ taglib prefix="f"  uri="http://java.sun.com/jsf/core"%>
<%@ taglib prefix="h"  uri="http://java.sun.com/jsf/html"%> --%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<f:view>
		<%
		String city = request.getParameter("city");
		try {
			Connection con = ConnectDB.getConnect();
			PreparedStatement ps1 = con.prepareStatement("delete from addspot  where city=?");

			ps1.setString(1, city);

			int i = ps1.executeUpdate();
			if (i > 0) {

				response.sendRedirect("ViewBlack.jsp");
			} else {
				response.sendRedirect("Fail.html");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		%>
	</f:view>
</body>
</html>