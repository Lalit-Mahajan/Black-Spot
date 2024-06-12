<%@page import="java.sql.*" %>
<%@page import="com.root.dbConnect.*" %>
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
		int psid = Integer.parseInt(request.getParameter("id"));
		try {
			Connection con = ConnectDB.getConnect();
			PreparedStatement ps1 = con.prepareStatement("delete from addpolice  where id=?");

			ps1.setInt(1, psid);

			int i = ps1.executeUpdate();
			if (i > 0) {
				PreparedStatement ps2 = con.prepareStatement("delete from addspot where psid=?");
				ps2.setInt(1, psid);

				int j = ps2.executeUpdate();
				response.sendRedirect("ViewPolice.jsp");
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