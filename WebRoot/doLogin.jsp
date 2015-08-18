<%
	String username=request.getParameter("username");
	session.setAttribute("username", username);
	response.sendRedirect("index.jsp");
%>