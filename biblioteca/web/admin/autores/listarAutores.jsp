<%-- 
    Document   : listarAutores
    Created on : 6 de mai. de 2023, 15:19:28
    Author     : vilar
--%>


<%@ include file="../../referencias.jsp" %>
<!DOCTYPE html>
<html>
    <head>
        <%@ include file="../../css/style.jsp" %>
        <title>Listar Autores</title>
    </head>
    <body>
        <%@ include file="../header.jsp" %>

        <div class="container text-center">
            <div class="row">
                <div class="col">
                    <br>
                    <div class="row">
                        <div class="col-sm-5 col-md-6">
                            <div style="float:left">
                                <button type="button" class="btn btn-success" data-bs-toggle="modal" data-bs-target="#exampleModal">
                                    <i class="bi bi-person-plus"></i>
                                </button>
                            </div>
                        </div>

                        <div class="col-sm-5 offset-sm-2 col-md-6 offset-md-0">
                                <div class="input-group mb-3">
                                    <input type="text" class="form-control" placeholder="Digite o nome do Autor" aria-label="Recipient's username" aria-describedby="button-addon2" id="txtBuscarAutor" required>
                                    <button class="btn btn-outline-secondary" onClick="redirecionarBusca()" id="button-addon2"><i class="bi bi-search"></i></button>
                                </div>
                            <script>
                                function redirecionarBusca() {
                                    var buscaAutor = document.getElementById('txtBuscarAutor').value;
                                    window.location.href = 'http://localhost:8080/biblioteca/admin/autores/buscarAutor.jsp?buscar=' + encodeURIComponent(buscaAutor);
                                }
                            </script>
                        </div>
                    </div>

                    <table class="table">
                        <thead>
                            <tr>
                                <th>Código</th>
                                <th>Nome do Autor</th>
                                <th>Editar</th>
                                <th>Excluir</th>
                            </tr>
                        </thead>
                        <tbody>
                            <%
                                try {

                                    st = new Conexao().conectar().createStatement();

                                    rs = st.executeQuery("Select * from tbautor ORDER BY codAutor DESC;");

                                    while (rs.next()) {
                                        out.println("<tr><td>" + rs.getString(1) + "</td>");
                                        out.println("<td>" + rs.getString(2) + "</td>");
                                        out.println("<td><a href='./editarExcluirAutor.jsp?funcao=editar&id=" + rs.getString(1) + "' class='btn btn-primary'><i class='bi bi-pencil-square'></i></a></td>");
                                        out.println("<td><a href='./editarExcluirAutor.jsp?funcao=excluir&id=" + rs.getString(1) + "' class='btn btn-danger disabled'><i class='bi bi-trash'></i></a></td> </tr>");
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



        <!-- Modal Cadastrar Autor-->
        <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <%@ include file="./cadAutor.jsp" %>
                </div>
            </div>
        </div>




    </body>
</html>
