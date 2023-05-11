<%-- 
    Document   : cadGenero
    Created on : 10 de mai. de 2023, 00:29:50
    Author     : vilar
--%>

<%@ include file="../../referencias.jsp" %>

<div class="modal-header">
    <h1 class="modal-title fs-5" id="exampleModalLabel">Cadastrar Gênero</h1>
    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
</div>
<form>
    <div class="modal-body">
        <div class="input-group input-group-lg">
            <span class="input-group-text" id="inputGroup-sizing-lg"><i class="bi bi-hash"></i></span>
            <input type="text" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-lg" placeholder="Digite um Gênero" name="txtGenero" required>
        </div>
    </div>
    <div class="modal-footer">
        <button type="button" class="btn btn-danger" data-bs-dismiss="modal">Cancelar</button>
        <button type="submit" class="btn btn-primary" name="btnSalvarGenero">Salvar Autor</button>
    </div>
</form>

<%

    if (request.getParameter("btnSalvarGenero") != null) {
        String genero = request.getParameter("txtGenero");
        try {
            int cont = 0;
            rs = st.executeQuery("Select * from tbgenero");
            while (rs.next()) {
                if (genero.equals(rs.getString(2)) == true) {
                    cont++;
                }
            }
            if (cont==0) {
                st = new Conexao().conectar().createStatement();
                st.executeUpdate("insert into tbgenero(genero) values('" + genero + "')");
            }
            out.println("<meta http-equiv='refresh' content='0;URL=http://localhost:8080/biblioteca/admin/genero/listarGeneros.jsp'>");
            out.println("<script type=\"text/javascript\">");
            out.println("alert('Cadastro de Gênero feito com sucesso!!');");
            out.println("</script>");

        } catch (Exception e) {
            out.println(e);
        }
    }
%>