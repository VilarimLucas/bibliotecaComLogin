<%-- 
    Document   : editarExcluirAutor
    Created on : 6 de mai. de 2023, 16:17:58
    Author     : vilar
--%>
<%@ include file="../../referencias.jsp" %>
<!DOCTYPE html>
<html>
    <head>
        <%@ include file="../../css/style.jsp" %>
        <title>Editar Autores</title>
    </head>
    <body>

        <%@ include file="../header.jsp" %>
        <%@ include file="../testaSessao.jsp" %>

        <%            String autor = null;

            String valorID = request.getParameter("id");

            if (request.getParameter("funcao") != null && request.getParameter("funcao").equals("editar")) {

                try {
                    st = new Conexao().conectar().createStatement();
                    rs = st.executeQuery("Select * from tbautor where codAutor='" + valorID + "'");
                    while (rs.next()) {
                        autor = rs.getString(2);
                    }

                } catch (Exception e) {
                    out.println(e);
                }
            } else if (request.getParameter("funcao") != null && request.getParameter("funcao").equals("excluir")) {
//                st.executeUpdate("Delete from tbespecialidade where codespecialidade=" + valorID);
//                out.println("<meta http-equiv='refresh' content='0;URL=ViewMedico.jsp'>");
//                out.println("<script type=\"text/javascript\">");
//                out.println("alert('ESPECIALIDADE excluída com sucesso');");
            }

        %>


        <div class="container text-center">
            <div class="row">
                <div class="col-md-6 offset-md-3">
                    <br>
                    <form>
                        <div class="card border-secondary mb-3">
                            <div class="card-header">

                                Editar Autor
                            </div>
                            <div class="card-body text-secondary">
                                <h5 class="card-title" style="float:left">
                                    ID: <input value="<%=valorID%>" name="txtId" style="border: none">
                                </h5>
                                <div class="input-group input-group-lg">
                                    <span class="input-group-text" id="inputGroup-sizing-lg"><i class="bi bi-person"></i></span>
                                    <input type="text" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-lg" value="<%=autor%>" name="txtAutor" required>
                                </div>
                                <br>
                                <div class="mb-3">
                                    <a href="./listarAutores.jsp" class="btn btn-danger">Cancelar</a>
                                    <button type="submit" class="btn btn-primary" name="btnEditar">Editar Autor</button>
                                </div>

                            </div>
                        </div>

                    </form>        
                </div><!-- </div> -->
            </div>
        </div>
        <%@ include file="../footer.jsp" %>
    </body>
</html>

<%
    if (request.getParameter("btnEditar") != null) {
        String id = request.getParameter("txtId");
        String nomeAutor = request.getParameter("txtAutor");

        try {

            st = new Conexao().conectar().createStatement();
            st.executeUpdate("Update tbautor set nomeAutor='" + nomeAutor + "' where codAutor='" + id + "'");

            out.println("<meta http-equiv='refresh' content='0;URL=./listarAutores.jsp'>");
            out.println("<script type=\"text/javascript\">");
            out.println("alert('Autor atualizado com sucesso');");
            out.println("</script>");

        } catch (Exception e) {
            out.println(e);
        }
    }
%>