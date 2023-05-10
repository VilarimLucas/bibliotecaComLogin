<%-- 
    Document   : cadAutor
    Created on : 6 de mai. de 2023, 14:58:58
    Author     : vilar
--%>

<%@ include file="../../referencias.jsp" %>

<div class="modal-header">
    <h1 class="modal-title fs-5" id="exampleModalLabel">Cadastrar Autor</h1>
    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
</div>
<form>
    <div class="modal-body">
        <div class="input-group input-group-lg">
            <span class="input-group-text" id="inputGroup-sizing-lg"><i class="bi bi-person"></i></span>
            <input type="text" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-lg" placeholder="Digite um autor" name="txtAutor" required>
        </div>
    </div>
    <div class="modal-footer">
        <button type="button" class="btn btn-danger" data-bs-dismiss="modal">Cancelar</button>
        <button type="submit" class="btn btn-primary" name="btnSalvar">Salvar Autor</button>
    </div>
</form>

<%

    if (request.getParameter("btnSalvar") != null) {
        String autor = request.getParameter("txtAutor");
        try {
            int cont = 0;
            rs = st.executeQuery("Select * from tbautor");
            while (rs.next()) {
                if (autor.equals(rs.getString(2)) == true) {
                    cont++;
                }
            }
            if (cont==0) {
                st = new Conexao().conectar().createStatement();
                st.executeUpdate("insert into tbautor(nomeAutor) values('" + autor + "')");
            }
            out.println("<meta http-equiv='refresh' content='0;URL=http://localhost:8080/biblioteca/admin/autores/listarAutores.jsp'>");
            out.println("<script type=\"text/javascript\">");
            out.println("alert('Cadastro de Autor feito com sucesso!!');");
            out.println("</script>");

        } catch (Exception e) {
            out.println(e);
        }
    }
%>