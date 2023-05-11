<%-- 
    Document   : cadLivro
    Created on : 10 de mai. de 2023, 11:30:25
    Author     : vilar
--%>

<%@ include file="../../referencias.jsp" %>

<div class="modal-header">
    <h1 class="modal-title fs-5" id="exampleModalLabel"><i class="bi bi-book"></i> Cadastrar Livro</h1>
    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
</div>
<form>
    <div class="modal-body">
        <div class="input-group input-group-lg">
            <input type="text" class="form-control form-control-lg" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-lg" placeholder="Digite o nome do Livro" name="txtNomeLivro" required>
        </div>

        <br>
        <div class="row ">
            <div class="col-sm-5 col-md-6 ">
                <select type="text" name="txtAutor" class="form-select form-select-lg mb-3" aria-label=".form-select-lg example" required>
                    <option class="text-secondary">Escolha um Autor</option>
                    <%
                        try {
                            st = new Conexao().conectar().createStatement();
                            rs = st.executeQuery("Select * from tbautor order by nomeAutor asc");
                            while (rs.next()) {
                                out.println("<option value='" + rs.getString(1) + "'>" + rs.getString(2) + "</option>");
                            }
                        } catch (Exception e) {
                            out.println(e);
                        }
                    %>
                </select>
            </div>
            <div class="col-sm-5 offset-sm-2 col-md-6 offset-md-0">
                <select type="text" name="txtGenero" class="form-select form-select-lg mb-3" aria-label=".form-select-lg example" required>
                    <option class="text-secondary">Escolha um Gênero</option>
                    <%
                        try {
                            st = new Conexao().conectar().createStatement();
                            rs = st.executeQuery("Select * from tbgenero order by genero asc");
                            while (rs.next()) {
                                out.println("<option value='" + rs.getString(1) + "'>" + rs.getString(2) + "</option>");
                            }
                        } catch (Exception e) {
                            out.println(e);
                        }
                    %>
                </select>
            </div>
        </div>
        <br>
        <div class="input-group">
            <div class="row">
                <div class="col-sm-5 col-md-6">
                    <input type="text" class="form-control form-control-lg" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-lg" placeholder="Ano de Lançamento" name="txtAnoLancamento" required>
                </div>
                <div class="col-sm-5 offset-sm-2 col-md-6 offset-md-0">
                    <input type="text" class="form-control form-control-lg" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-lg" placeholder="Edição do Livro" name="txtEdicao" required>
                </div>
            </div>
        </div>
        <br>
        <div class="form-floating">
            <textarea class="form-control" placeholder="Descreva aqui" id="floatingTextarea2" style="height: 10rem" name="txtDescricao" required></textarea>
            <label for="floatingTextarea2">Descrição do Livro</label>
        </div>
    </div>
    <div class="modal-footer">
        <button type="button" class="btn btn-danger" data-bs-dismiss="modal">Cancelar</button>
        <button type="submit" class="btn btn-primary" name="btnSalvarLivro">Salvar Autor</button>
    </div>
</form>

<%
    if (request.getParameter("btnSalvarLivro") != null) {
    
        String nomeLivro = request.getParameter("txtNomeLivro");
        String autor = request.getParameter("txtAutor");
        String genero = request.getParameter("txtGenero");
        String ano = request.getParameter("txtAnoLancamento");
        String edicao = request.getParameter("txtEdicao");
        String descricao = request.getParameter("txtDescricao");
        
        try {
            int cont = 0;
            rs = st.executeQuery("Select * from tblivro");
            while (rs.next()){
            
                if ((nomeLivro.equals(rs.getString(2)) && (autor.equals(rs.getString(3)))) == true) {
                    cont++;
                }
            }
            if (cont == 0) {
                st = new Conexao().conectar().createStatement();
                st.executeUpdate("insert into tblivro(nomeLivro, codAutor, codGenero, anoLancamento, edicaoLivro, descricaoLivro, statusLivro) values('" + nomeLivro + "', " + autor + ", " + genero + ", " + ano + ", '" + edicao + "', '" + descricao + "', 1)");
            }
            out.println("<meta http-equiv='refresh' content='0;URL=http://localhost:8080/biblioteca/admin/index.jsp'>");
            out.println("<script type=\"text/javascript\">");
            out.println("alert('Cadastro de Livro feito com sucesso!!');");
            out.println("</script>");

        } catch (Exception e) {
            out.println(e);
        }
    }
%>                