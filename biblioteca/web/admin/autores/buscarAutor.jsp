<%-- 
    Document   : buscarAutor
    Created on : 9 de mai. de 2023, 20:46:34
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
                <div class="col-md-6 offset-md-3">
                    <br>
                    <div class="card border-secondary mb-3">
                        <div class="card-header">

                            Resultado de Pesquisa de Autores
                        </div>
                        <div class="card-body text-secondary">

                            <table class="table">
                                <thead>
                                    <tr>
                                        <th>Código</th>
                                        <th>Nome do Autor</th>
                                        <th>Editar</th>
<!--                                        <th>Excluir</th>-->
                                    </tr>
                                </thead>
                                <tbody>

                                    <%                                        String busca = request.getParameter("buscar");
                                        int contador = 0;
                                        try {
                                            rs = st.executeQuery("Select * from tbautor where nomeAutor like '%" + busca + "%'");

                                            while (rs.next()) {
                                                out.println("<tr><td>" + rs.getString(1) + "</td>");
                                                out.println("<td>" + rs.getString(2) + "</td>");
                                                out.println("<td><a href='./editarExcluirAutor.jsp?funcao=editar&id=" + rs.getString(1) + "' class='btn btn-primary'><i class='bi bi-pencil-square'></i></a></td>");
//                                                out.println("<td><a href='./editarExcluirAutor.jsp?funcao=excluir&id=" + rs.getString(1) + "' class='btn btn-danger disabled'><i class='bi bi-trash'></i></a></td>"); 
                                                out.println("</tr>");
                                                contador++;
                                            }
                                        } catch (Exception e) {
                                            out.println(e);
                                        }

                                    %>

                                </tbody>
                                <tfoot>
                                    <tr>
                                        <th scope="row">Total:</th>
                                        <td><%=contador%> pesquisa(s) encontrada(s)</td>
                                    </tr>
                                </tfoot>
                            </table>

                        </div>
                    </div>
                </div>
            </div>
        </div>

        <%@ include file="../footer.jsp" %>
    </body>
</html>
