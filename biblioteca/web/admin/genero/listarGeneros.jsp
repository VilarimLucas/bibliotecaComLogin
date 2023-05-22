<%-- 
    Document   : listarGeneros
    Created on : 10 de mai. de 2023, 00:52:08
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
        <%@ include file="../testaSessao.jsp" %>
        <div class="container text-center">
            <div class="row">
                <div class="col">
                    <br>
                    <div class="row">
                        <div class="col-sm-5 col-md-6">
                            <div style="float:left" id="btnCadGen">
                                <button type="button" class="btn btn-success" data-bs-toggle="modal" data-bs-target="#exampleModal">
                                    <i class="bi bi-plus-circle"></i>
                                </button>
                            </div>
                        </div>

                        <div class="col-sm-5 offset-sm-2 col-md-6 offset-md-0">
                            <div class="input-group mb-3">
                                <input type="text" class="form-control" placeholder="Digite o nome do Gênero" aria-label="Recipient's username" aria-describedby="button-addon2" id="txtBuscarGenero" required>
                                <button class="btn btn-outline-secondary" onClick="redirecionarBusca()" id="button-addon2"><i class="bi bi-search"></i></button>
                            </div>
                            <script>
                                function redirecionarBusca() {
                                    var buscaGenero = document.getElementById('txtBuscarGenero').value;
                                    window.location.href = 'http://localhost:8080/biblioteca/admin/genero/buscarGenero.jsp?buscar=' + encodeURIComponent(buscaGenero);
                                }
                            </script>
                        </div>
                    </div>

                    <table class="table">
                        <thead>
                            <tr>
                                <th>Código</th>
                                <th>Gênero</th>
                                <!--                                <th>Editar</th>
                                                                <th>Excluir</th>-->
                            </tr>
                        </thead>
                        <tbody>
                            <%                                try {

                                    st = new Conexao().conectar().createStatement();

                                    rs = st.executeQuery("Select * from tbgenero ORDER BY codGenero DESC;");

                                    while (rs.next()) {
                                        out.println("<tr><td>" + rs.getString(1) + "</td>");
                                        out.println("<td>" + rs.getString(2) + "</td>");
//                                        out.println("<td><a href='./editarExcluirGenero.jsp?funcao=editar&id=" + rs.getString(1) + "' class='btn btn-primary disabled'><i class='bi bi-pencil-square'></i></a></td>");
//                                        out.println("<td><a href='./editarExcluirGenero.jsp?funcao=excluir&id=" + rs.getString(1) + "' class='btn btn-danger disabled'><i class='bi bi-trash'></i></a></td>"); 
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



        <!-- Modal Cadastrar Genero-->
        <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <%@ include file="./cadGenero.jsp" %>
                </div>
            </div>
        </div>


        <%@ include file="../footer.jsp" %>

    </body>
</html>
