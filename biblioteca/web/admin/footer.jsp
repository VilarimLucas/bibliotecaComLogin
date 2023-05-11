<%-- 
    Document   : footer
    Created on : 11 de mai. de 2023, 12:55:41
    Author     : vilar
--%>


<!-- Footer -->
<footer class="text-center text-md-start">
    <!-- Grid container -->
    <div class="container p-4">
        <!--Grid row-->
        <div class="row">
            <!--Grid column-->
            <div class="col-lg-6 col-md-12 mb-4 mb-md-0">
                <h5 class="text-uppercase">Livros</h5>

                <div class="row row-cols-2">

                    <%
                        try {

                            st = new Conexao().conectar().createStatement();

                            rs = st.executeQuery("Select * from tblivro ORDER BY nomeLivro asc;");

                            while (rs.next()) {
                                out.println("<div class='col list-group'><a class='list-group-item list-group-item-action' href='http://localhost:8080/biblioteca/admin/livros/visLivro.jsp?visualizar=" + rs.getString(1) + "'>" + rs.getString(2) + "</a></div>");
                            }
                        } catch (Exception e) {
                            out.println(e);
                        }

                    %>

                </div>


            </div>
            <!--Grid column-->

            <!--Grid column-->
            <div class="col-lg-3 col-md-6 mb-4 mb-md-0">
                <h5 class="text-uppercase">Autores</h5>

                <div class="row row-cols-2">

                    <%
                        try {

                            st = new Conexao().conectar().createStatement();

                            rs = st.executeQuery("Select * from tbautor ORDER BY nomeAutor asc;");

                            while (rs.next()) {
                                out.println("<div class='col list-group'><a class='list-group-item list-group-item-action' href='http://localhost:8080/biblioteca/admin/livros/buscarLivros.jsp?buscar="+rs.getString(2)+"&filtro=Autor'>" + rs.getString(2) + "</a></div>");
                            }
                        } catch (Exception e) {
                            out.println(e);
                        }

                    %>

                </div>
            </div>
            <!--Grid column-->

            <!--Grid column-->
            <div class="col-lg-3 col-md-6 mb-4 mb-md-0">
                <h5 class="text-uppercase mb-0">Gêneros</h5>

                <div class="row row-cols-1">

                    <%
                        try {

                            st = new Conexao().conectar().createStatement();

                            rs = st.executeQuery("Select * from tbgenero ORDER BY genero asc;");

                            while (rs.next()) {
                                out.println("<div class='col list-group'><a class='list-group-item list-group-item-action' href='http://localhost:8080/biblioteca/admin/livros/buscarLivros.jsp?buscar="+rs.getString(2)+"&filtro=Gênero'>" + rs.getString(2) + "</a></div>");
                            }
                        } catch (Exception e) {
                            out.println(e);
                        }

                    %>

                </div>
            </div>
            <!--Grid column-->
        </div>
        <!--Grid row-->
    </div>
    <!-- Grid container -->

    <!-- Copyright -->
    <div class="text-center p-3" style="background-color: rgba(0, 0, 0, 0.2);">
        © 2023 Copyright:
        <a class="text-white" href="#">devwebIII.com</a>
    </div>
    <!-- Copyright -->
</footer>
<!-- Footer -->