<%-- 
    Document   : buscarGenero
    Created on : 10 de mai. de 2023, 01:12:22
    Author     : vilar
--%>


<%@ include file="../../referencias.jsp" %>
<!DOCTYPE html>
<html>
    <head>
        <%@ include file="../../css/style.jsp" %>
        <title>Buscar Gêneros</title>
    </head>
    <body>
        <%@ include file="../header.jsp" %>
        <%@ include file="../testaSessao.jsp" %>
        <div class="container text-center">
            <div class="row">
                <div class="col-md-6 offset-md-3">
                    <br>
                    <div class="card border-secondary mb-3">
                        <div class="card-header">

                            Resultado de Pesquisa de Gênero
                        </div>
                        <div class="card-body text-secondary">

                            <table class="table">
                                <thead>
                                    <tr>
                                        <th>Código</th>
                                        <th>Gênero</th>
<!--                                        <th>Editar</th>
                                        <th>Excluir</th>-->
                                    </tr>
                                </thead>
                                <tbody>

                                    <%
                                        String busca = request.getParameter("buscar");
                                        int contador = 0;
                                        try {
                                            rs = st.executeQuery("Select * from tbgenero where genero like '%" + busca + "%'");

                                            while (rs.next()) {
                                                out.println("<tr><td>" + rs.getString(1) + "</td>");
                                                out.println("<td>" + rs.getString(2) + "</td>");
//                                                out.println("<td><a href='./editarExcluirGenero.jsp?funcao=editar&id=" + rs.getString(1) + "' class='btn btn-primary disabled'><i class='bi bi-pencil-square'></i></a></td>");
//                                                out.println("<td><a href='./editarExcluirGenero.jsp?funcao=excluir&id=" + rs.getString(1) + "' class='btn btn-danger disabled'><i class='bi bi-trash'></i></a></td>"); 
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
