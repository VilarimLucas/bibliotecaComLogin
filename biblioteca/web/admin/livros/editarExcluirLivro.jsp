<%-- 
    Document   : editarExcluirLivro
    Created on : 14 de mai. de 2023, 22:30:34
    Author     : vilar
--%>

<%@ include file="../../referencias.jsp" %>

<%
    Statement st = null;

    String valorID = request.getParameter("id");

    if (request.getParameter("funcao") != null && request.getParameter("funcao").equals("excluir")) {

        try {
            st = new Conexao().conectar().createStatement();
            st.executeUpdate("Update tblivro set statusLivro=0 where codLivro='" + valorID + "'");

            out.println("<meta http-equiv='refresh' content='0;URL=http://localhost:8080/biblioteca/admin/index.jsp'>");
            out.println("<script type=\"text/javascript\">");
            out.println("alert('Livro Exluído com sucesso');");
            out.println("</script>");

        } catch (Exception e) {
            out.println(e);
        }
    }
%>

