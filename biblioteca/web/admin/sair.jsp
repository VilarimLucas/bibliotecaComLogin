<%-- 
    Document   : sair
    Created on : 6 de mai. de 2023, 13:55:17
    Author     : vilar
--%>
<%
    session.invalidate();
    response.sendRedirect("http://localhost:8080/biblioteca/index.jsp");
%>
