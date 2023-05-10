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
                            rs = st.executeQuery("Select * from tbautor");
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
                            rs = st.executeQuery("Select * from tbgenero");
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
        <button type="submit" class="btn btn-primary" name="btnSalvar">Salvar Autor</button>
    </div>
</form>
