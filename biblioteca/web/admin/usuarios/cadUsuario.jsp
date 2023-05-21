<%-- 
    Document   : cadUsuario
    Created on : 20 de mai. de 2023, 20:39:55
    Author     : vilar
--%>


<%@ include file="../../referencias.jsp" %>

<div class="modal-header">
    <h1 class="modal-title fs-5" id="exampleModalLabel">Cadastrar Usuário</h1>
    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
</div>
<form>
    <div class="modal-body">
        <div class="input-group input-group-lg">
            <span class="input-group-text" id="inputGroup-sizing-lg"><i class="bi bi-person"></i></span>
            <input type="text" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-lg" placeholder="Digite o nome de Usuário" name="txtUsuario" required>
        </div>
        <br>
        <div class="input-group input-group-lg">
            <span class="input-group-text" id="inputGroup-sizing-lg"><i class="bi bi-key"></i></span>
            <input type="password" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-lg" placeholder="Digite a senha" name="txtSenha" required>
        </div>
        <br>
        <div class="input-group input-group-lg">
            <span class="input-group-text" id="inputGroup-sizing-lg"><i class="bi bi-incognito"></i></span>
            <select class="form-control form-select" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-lg" name="txtNivel" required>
                <option>Qual o nível de acesso?</option><!-- comment -->
                <option value="1">Admin (Acesso Total)</option><!-- comment -->
                <option value="2">Intermediário (Não pode cadastrar ou consultar)</option><!-- comment -->
                <option value="3">Limitado (Só pode consultar e buscar)</option><!-- comment -->
            </select>
        </div>
    </div>
    <div class="modal-footer">
        <button type="button" class="btn btn-danger" data-bs-dismiss="modal">Cancelar</button>
        <button type="submit" class="btn btn-primary" name="btnSalvarUsuario">Salvar Autor</button>
    </div>
</form>


<%

    if (request.getParameter("btnSalvarUsuario") != null) {
        String usuario = request.getParameter("txtUsuario");
        String senha = request.getParameter("txtSenha");
        String status = request.getParameter("txtNivel");
        try {
            int cont = 0;
            rs = st.executeQuery("Select * from tbusuario");
            while (rs.next()) {
                if (usuario.equals(rs.getString(1)) == true) {
                    cont++;
                }
            }
            out.println("<meta http-equiv='refresh' content='0;URL=http://localhost:8080/biblioteca/admin/index.jsp'>");
            out.println("<script type=\"text/javascript\">");
            if (cont == 0) {
                st = new Conexao().conectar().createStatement();
                st.executeUpdate("insert into tbusuario(usuario, senha, nivel) values('" + usuario + "', '" + senha + "', " + status + ")");

                out.println("alert('Cadastro de Usuário " + usuario + " feito com sucesso!!');");

            } else {
                out.println("alert('Usuário já EXISTE! Por Gentileza, cadastre um usuário diferente!');");
            }
            out.println("</script>");

        } catch (Exception e) {
            out.println(e);
        }
    }
%>