<%-- 
    Document   : visLivro
    Created on : 10 de mai. de 2023, 22:20:29
    Author     : vilar
--%>

<%@ include file="../../referencias.jsp" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <%@ include file="../../css/style.jsp" %>
        <title>Livro</title>
    </head>
    <body>

        <%@ include file="../header.jsp" %>
        <br>
        <div class="container text-center">
            <div class="row">
                <div class="col">
                    <%                        String codLivro = request.getParameter("visualizar");
                        String livro = null;
                        String autor = null;
                        String genero = null;
                        String ano = null;
                        String edicao = null;
                        String descricao = null;

                        try {
                            st = new Conexao().conectar().createStatement();
                            rs = st.executeQuery("Select l.nomeLivro, a.nomeAutor, g.genero, l.anoLancamento, l.EdicaoLivro, l.descricaoLivro from tblivro l inner join tbautor a on l.codAutor = a.codAutor inner join tbgenero g on l.codGenero = g.codGenero where codLivro='" + codLivro + "'");
                            while (rs.next()) {
                                livro = rs.getString(1);
                                autor = rs.getString(2);
                                genero = rs.getString(3);
                                ano = rs.getString(4);
                                edicao = rs.getString(5);
                                descricao = rs.getString(6);
                            }

                        } catch (Exception e) {
                            out.println(e);
                        }
                    %>
                    <div class="card mb-3">
                        <div class="row g-0">
                            <div class="col-md-4">
                                <img src="./capas/00.png" class="img-fluid rounded-start" alt="...">
                            </div>
                            <div class="col-md-8">
                                <div class="card-body" style="text-align: justify">
                                    <h5 class="card-title"><%=livro%></h5>
                                    <p class="card-text"><b>Autor: </b><%=autor%></p>
                                    <p class="card-text"><b>Gênero: </b><%=genero%></p>
                                    <p class="card-text"><b>Ano: </b><%=ano%></p>
                                    <p class="card-text"><b>Edição: </b><%=edicao%></p>
                                    <p class="card-text"><b>Descrição: </b><%=descricao%></p>
                                    <p class="card-text"><small class="text-body-secondary"></small></p>
                                </div>
                            </div>
                        </div>
                    </div>

                </div>
            </div>
        </div>
        <%@ include file="../footer.jsp" %>
    </body>
</html>
