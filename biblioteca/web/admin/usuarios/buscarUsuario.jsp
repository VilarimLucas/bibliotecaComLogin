<%-- 
    Document   : buscarUsuario
    Created on : 21 de mai. de 2023, 16:02:14
    Author     : vilar
--%>

<%@ include file="../../referencias.jsp" %>

<!DOCTYPE html>
<html>
    <head>
        <%@ include file="../../css/style.jsp" %>
        <title>Buscar Usuário</title>
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

                            Resultado de Pesquisa de Usuário
                        </div>
                        <div class="card-body text-secondary">

                            <table class="table">
                                <thead>
                                    <tr>
                                        <th>Usuário</th>
                                        <th>Nível</th>

                                    </tr>
                                </thead>
                                <tbody>

                                    <%                                        String busca = request.getParameter("buscar");
                                        int contador = 0;
                                        try {
                                            rs = st.executeQuery("Select * from tbusuario where usuario like '%" + busca + "%'");

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