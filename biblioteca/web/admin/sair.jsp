<%-- 
    Document   : sair
    Created on : 6 de mai. de 2023, 13:55:17
    Author     : vilar
--%>
<%@ include file="../referencias.jsp" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
    <head>
        <%@ include file="../css/style.jsp" %>
        <%@ include file="testaSessao.jsp" %>
        <title>sair</title>
    </head>
    <body>
        <%
            session.invalidate();
            response.sendRedirect("../index.jsp");
        %>
    </body>
</html>
