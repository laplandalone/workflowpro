<% 
	String username=(String)session.getAttribute("username");
    if("".equals(username)||null==username)
    {
    	response.sendRedirect("login.jsp");
    }
%>