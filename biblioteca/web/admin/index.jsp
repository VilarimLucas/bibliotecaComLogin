<%-- 
    Document   : index
    Created on : 6 de mai. de 2023, 14:24:23
    Author     : vilar
--%>

<%@ include file="../referencias.jsp" %>

<!DOCTYPE html>
<html>
    <head>
        <%@ include file="../css/style.jsp" %>
        <title>Biblioteca</title>
    </head>
    <body>
        
        <%@ include file="header.jsp" %>
        <%@ include file="testaSessao.jsp" %>
        <br>
        <div class="container text-center">
            <div class="row">
                <div class="col">
                    <div class="row">
                        <div class="col-sm-5 col-md-6">
                            <div style="float:left">
                                <button type="button" class="btn btn-success" data-bs-toggle="modal" data-bs-target="#cadastrarLivro">
                                    <i class="bi bi-plus-circle"></i>
                                </button>
                            </div>
                        </div>

                        <div class="col-sm-5 offset-sm-2 col-md-6 offset-md-0">

                            <div class="input-group">
                                <select class="btn btn-outline-secondary dropdown-toggle" name="txtBuscaFiltro" data-bs-toggle="dropdown" aria-expanded="false">Filtro: 
                                    <option><a class="dropdown-item" value="nomeLivro">Nome do Livro</a></option>
                                    <option><a class="dropdown-item" value="genero">Gênero</a></option>
                                    <option><a class="dropdown-item" value="nomeAutor">Autor</a></option>
                                </select>
                                <input type="text" class="form-control" aria-label="Text input with 2 dropdown buttons" id="txtBuscaLivros" placeholder="Digite o Livro/autor/gênero aqui" required>
                                <button class="btn btn-outline-secondary" onClick="redirecionarBuscaLivros()"><i class="bi bi-search"></i></button>
                            </div>

                            <script>
                                function redirecionarBuscaLivros() {
                                    var busca = document.getElementById('txtBuscaLivros').value;
                                    var selectElement = document.querySelector('select[name="txtBuscaFiltro"]');
                                    var filtro = selectElement.value;
                                    window.location.href = 'http://localhost:8080/biblioteca/admin/livros/buscarLivros.jsp?buscar=' + encodeURIComponent(busca) + '&filtro=' + encodeURIComponent(filtro);
                                }
                            </script>





                        </div>
                    </div>
                    <br>
                    <div class="container text-center">
                        <div class="row row-cols-1 row-cols-sm-2 row-cols-md-4">

                            <%                                try {

                                    st = new Conexao().conectar().createStatement();

                                    rs = st.executeQuery("Select * from tblivro where statusLivro = 1");

                                    while (rs.next()) {
                                        out.println("<div class='col' style='margin-bottom: 1%'>");
                                        out.println("<div class='card'>");
                                        out.println("<div class='card-body'>");
                                        out.println("<h5 class='card-title'><a href='./livros/visLivro.jsp?visualizar=" + rs.getString(1) + "' class='text-secondary titulo-livro'>" + rs.getString(2) + "</a></h5>");
                                        out.println("</div>");
                                        out.println("<img src='./livros/capas/00.png' class='card-img-bottom' alt='...'>");
                                        out.println("</div>");
                                        out.println("</div>");
                                    }
                                } catch (Exception e) {
                                    out.println(e);
                                }

                            %>
                            <script>
                                var anchors = document.getElementsByClassName("titulo-livro");

                                for (var i = 0; i < anchors.length; i++) {
                                    var anchor = anchors[i];
                                    var maxLength = 20; // Define o comprimento máximo desejado

                                    if (anchor.textContent.length > maxLength) {
                                        var truncatedText = anchor.textContent.substring(0, maxLength) + " ...";
                                        anchor.textContent = truncatedText;
                                    }
                                }

                            </script>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Modal Cadastrar Livro-->
        <div class="modal fade" id="cadastrarLivro" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <%@ include file="./livros/cadLivro.jsp" %>
                </div>
            </div>
        </div>

        <%@ include file="footer.jsp" %>
    </body>
</html>


