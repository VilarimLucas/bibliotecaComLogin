<%-- 
    Document   : testaSessao
    Created on : 6 de mai. de 2023, 14:43:47
    Author     : vilar
--%>
<%
    String usu = (String) session.getAttribute("usuario");
    String nivel = (String) session.getAttribute("nivel");
    if (usu == null) {
        response.sendRedirect("http://localhost:8080/biblioteca/index.jsp");
    } else if (usu != null && nivel.equals("2")) {
        out.println("<script type=\"text/javascript\">");
        out.println("const cad = document.getElementById('cadUsu');");
        out.println("const list = document.getElementById('listaUsu');");
        out.println("cad.className += 'd-none';");
        out.println("list.className += 'd-none';");
        
        out.println("</script>");
    } else if (usu != null && nivel.equals("3")) {
        out.println("<script type=\"text/javascript\">");
        
        // Campos em que o usuário não pode acessar em Ger usuário
        out.println("const cadUsu = document.getElementById('cadUsu');");
        out.println("const listUsu = document.getElementById('listaUsu');");
        out.println("cadUsu.className += 'd-none';");
        out.println("listUsu.className += 'd-none';");
        
        // campos que o usuário limitado não pode acessar no Gerenciamento de Gênero
        out.println("const btnCadGenero = document.getElementById('btnCadGen');");
        out.println("const navCadGenero = document.getElementById('navCadGen');");
        out.println("btnCadGenero.className += 'd-none';");
        out.println("navCadGenero.className += 'd-none';");
        out.println("</script>");
    }
%>