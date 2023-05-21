<%-- 
    Document   : listarUsuarios
    Created on : 21 de mai. de 2023, 11:10:18
    Author     : vilar
--%>

<%@ include file="../../referencias.jsp" %>
<!DOCTYPE html>
<html>
    <head>
        <%@ include file="../../css/style.jsp" %>
        <title>Listar Generoes</title>
    </head>
    <body>
        <%@ include file="../header.jsp" %>

        <div class="container text-center">
            <div class="row">
                <div class="col">
                    <br>
                    <div class="row">
                        <div class="col-sm-5 col-md-6"></div>

                        <div class="col-sm-5 offset-sm-2 col-md-6 offset-md-0">
                            <div class="input-group mb-3">
                                <input type="text" class="form-control" placeholder="Digite o nome de usuário" aria-label="Recipient's username" aria-describedby="button-addon2" id="txtBuscarUsuario" required>
                                <button class="btn btn-outline-secondary" onClick="redirecionarBusca()" id="button-addon2"><i class="bi bi-search"></i></button>
                            </div>
                            <script>
                                function redirecionarBusca() {
                                    var busca = document.getElementById('txtBuscarUsuario').value;
                                    window.location.href = 'http://localhost:8080/biblioteca/admin/usuarios/buscarUsuario.jsp?buscar=' + encodeURIComponent(busca);
                                }
                            </script>
                        </div>
                    </div>

                    <table class="table">
                        <thead>
                            <tr>
                                <th>Usuário</th>
                                <th>Nível de acesso</th>
                            </tr>
                        </thead>
                        <tbody>
                            <%                                try {

                                    st = new Conexao().conectar().createStatement();

                                    rs = st.executeQuery("Select * from tbusuario");

                                    while (rs.next()) {
                                        out.println("<tr><td>" + rs.getString(1) + "</td>");
                                        switch (rs.getString(3)) {
                                            case "1":
                                                out.println("<td>Admin</td>");
                                                break;
                                            case "2":
                                                out.println("<td>Intermediário</td>");
                                                break;
                                            case "3":
                                                out.println("<td>Limitado</td>");
                                                break;
                                        }

                                        out.println("</tr>");
                                    }
                                } catch (Exception e) {
                                    out.println(e);
                                }

                            %>
                        </tbody>
                    </table>
                </div>
            </div><!-- comment -->
        </div>

        <%@ include file="../footer.jsp" %>

    </body>
</html>