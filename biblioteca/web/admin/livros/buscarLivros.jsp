<%-- 
    Document   : buscarLivros
    Created on : 11 de mai. de 2023, 13:51:02
    Author     : vilar
--%>

<%@ include file="../../referencias.jsp" %>
<!DOCTYPE html>
<html>
    <head>
        <%@ include file="../../css/style.jsp" %>
        <title>Buscar Autores</title>
    </head>
    <body>
        <%@ include file="../header.jsp" %>

        <div class="container text-center">
            <div class="row">
                <div class="col">
                    <br>

                    <div class="card border-secondary mb-3">
                        <div class="card-header">
                            Resultado de Pesquisa de Livros
                        </div>
                        <div class="card-body text-secondary">

                            <%                                        String busca = request.getParameter("buscar");
                                String filtro = request.getParameter("filtro");
                                String coluna = null;

                                String codLivro = null;
                                String nomeLivro = null;

                                switch (filtro) {
                                    case "Autor":
                                        coluna = "a.nomeAutor";
                                        break;
                                    case "Gênero":
                                        coluna = "g.genero";
                                        break;
                                    case "Nome do Livro":
                                        coluna = "l.nomeLivro";
                                        break;
                                }

                                int contador = 0;
                                try {
                                    rs = st.executeQuery("Select l.codLivro, l.nomeLivro, g.genero, a.nomeAutor from tblivro l inner join tbgenero g on g.codGenero = l.codGenero inner join tbautor a on a.codAutor = l.codAutor where statusLivro = 1 and " + coluna + " like '%" + busca + "%'");
                                    out.println("<div class='container text-center'>");
                                    out.println("<div class='row row-cols-1 row-cols-sm-2 row-cols-md-4'>");
                                    while (rs.next()) {
                                        out.println("<div class='col' style='margin-bottom: 1%'>");
                                        out.println("<div class='card'>");
                                        out.println("<div class='card-body'>");
                                        out.println("<h5 class='card-title'><a href='./visLivro.jsp?visualizar=" + rs.getString(1) + "' class='text-secondary titulo-livro'>" + rs.getString(2) + "</a></h5>");

                                        out.println("</div>");
                                        out.println("<img src='./capas/00.png' class='card-img-bottom' alt='...'>");
                                        out.println("</div>");
                                        out.println("<p class='card-text'><small class='text-body-secondary'><b>Gênero: </b>" + rs.getString(3) + "</small><br>");
                                        out.println("<small class='text-body-secondary'><b>Autor: </b>" + rs.getString(4) + "</small></p>");
                                        out.println("</div>");

                                        contador++;
                                    }
                                    out.println("</div>");
                                    out.println("</div>");
                                    out.println("<br><p class='card-text'><small class='text-body-secondary'><b>Resultado da Pesquisa: </b>" + contador + " livro(s) encontrado(s)</small></p>");
                                } catch (Exception e) {
                                    out.println(e);
                                }

                            %>

                        </div>
                    </div>
                </div>
            </div>
        </div>

        <%@ include file="../footer.jsp" %>
    </body>
</html>
