<%-- 
    Document   : testaSessao
    Created on : 6 de mai. de 2023, 14:43:47
    Author     : vilar
--%>

<%
    String usu = (String) session.getAttribute("usuario");
    String nivel = (String) session.getAttribute("nivel");
    if (usu == null) {
        response.sendRedirect("../index.jsp");
    }
%>