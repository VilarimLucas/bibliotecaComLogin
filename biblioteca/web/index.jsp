<%-- 
    Document   : index
    Created on : 29 de abr. de 2023, 14:42:00
    Author     : vilar
--%>

<%@ include file="referencias.jsp" %>

<!DOCTYPE html>

<html>
    <head>
        <%@ include file="./css/style.jsp" %>
        <title>Biblioteca</title>
    </head>
    <body>
        <%
            Statement st = null;
            ResultSet rs = null;
        %>

        <div class="container mt-4 col-lg-4">
            <div class="row">
                <div class="col align-self-center">
                    <div class="card login">
                        <div class="card-body">

                            <form class="form-control">
                                <div class="form-group text-center">
                                    <h3><i class="bi bi-door-open-fill"></i> LOGIN</h3>
                                    <!--<img src="img/logo.png" alt="70" width="170"/>-->                            
                                    <label>Bem vindos ao Sistema de Bibliotecas <br> FA�A SIL�NCIO!</label>
                                </div>

                                <div class="mb-3">
                                    <label for="exampleFormControlInput1" class="form-label">Usu�rio</label>
                                    <input type="text" class="form-control" id="exampleFormControlInput1" name="txtuser" placeholder="Digite o usu�rio" required>
                                </div>

                                <div class="mb-3">
                                    <label for="exampleFormControlInput1" class="form-label">Senha</label>
                                    <input type="password" class="form-control" id="exampleFormControlInput1" name="txtpass" placeholder="Digite a senha" required>
                                    <%
                                        if ((request.getParameter("txtuser") != null) && (request.getParameter("txtpass") != null)) {
                                            String login, pass;
                                            login = request.getParameter("txtuser");
                                            pass = request.getParameter("txtpass");
                                            st = new Conexao().conectar().createStatement();
                                            rs = st.executeQuery("select * from tbusuario where usuario ='" + login + "' and senha='" + pass + "'");
                                            if (rs.next()) {

                                                response.sendRedirect("./admin/index.jsp");
                                                session.setAttribute("usuario", login);
                                                session.setAttribute("nivel", rs.getString(3));
                                            } else {
                                                out.println("<script>alert('Verifique o usu�rio ou senha')</script>");
                                            }
                                        }

                                    %>
                                </div>
                                <input type="submit" name="btnLog" value="Logar" id="btnLog" class="btn btn-block">
                            </form>

                        </div>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>