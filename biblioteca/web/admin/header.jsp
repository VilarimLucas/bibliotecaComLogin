<%-- 
    Document   : header
    Created on : 6 de mai. de 2023, 14:39:29
    Author     : vilar
--%>

<%
    Statement st = null;
    ResultSet rs = null;
%>

<style>
    .dropdown-submenu {
        position: relative;
    }
    .dropdown-submenu .dropdown-menu {
        top: 0;
        left: 100%;
        margin-top: -1px;
    }
</style>

<nav class="navbar navbar-expand-lg bg-body-tertiary">
    <div class="container-fluid">
        <a class="navbar-brand" href="http://localhost:8080/biblioteca/admin/index.jsp"><i class="bi bi-book-half"></i> Biblioteca</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav me-auto mb-2 mb-lg-0">

                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                        Livros
                    </a>
                    <ul class="dropdown-menu">
                        <li>
                            <button type="button" class="btn btn-primary dropdown-item" data-bs-toggle="modal" data-bs-target="#CadastrarLivro">
                                Cadastrar Livros
                            </button>
                        </li>
                        <li><a href="http://localhost:8080/biblioteca/admin/index.jsp" class="dropdown-item">Listar Livros</a></li>

                        <!--li class="dropdown-submenu">
                            <a class="dropdown-item test" tabindex="-1">Editar Livros<span class="caret"></span></a>
                            <ul class="dropdown-menu">
                                <li class="dropdown-submenu">
                                    <a class="test" href="#">Another dropdown <span class="caret"></span></a>
                                    <ul class="dropdown-menu">
                                        <li><a href="#">3rd level dropdown</a></li>
                                        <li><a href="#">3rd level dropdown</a></li>
                                    </ul>
                                </li>
                                <li class="text-primary">Qual Autor deseja alterar?</li>
                        <%
                            /*
                            try {
                                st = new Conexao().conectar().createStatement();
                                rs = st.executeQuery("Select * from tbautor order by nomeAutor ASC");

                                while (rs.next()) {
                                    out.println("<li><hr class='dropdown-divider'></li>");
                                    out.println("<li><a tabindex='-1' class='dropdown-item' href='http://localhost:8080/biblioteca/admin/autores/editarExcluirAutor.jsp?funcao=editar&id=" + rs.getString(1) + "'>" + rs.getString(2) + "</a></li>");

                                }
                            } catch (Exception e) {
                                out.println(e);
                            }
                             */
                        %>
                </ul>
            </li-->

                        <li><hr class="dropdown-divider"></li>
                        <li><a class="dropdown-item">Excluir Livro</a></li>
                    </ul>
                </li>

                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                        Autores
                    </a>
                    <ul class="dropdown-menu">
                        <li>
                            <button name="btnAutores" type="button" class="btn btn-primary dropdown-item" data-bs-toggle="modal" data-bs-target="#CadastrarAutor">
                                Cadastrar Autor
                            </button>
                        </li>
                        <li><a href="http://localhost:8080/biblioteca/admin/autores/listarAutores.jsp" class="dropdown-item">Listar Autor</a></li>

                        <li class="dropdown-submenu">
                            <a class="dropdown-item test" tabindex="-1">Editar Autor<span class="caret"></span></a>
                            <ul class="dropdown-menu">
                                <!--li class="dropdown-submenu">
                                    <a class="test" href="#">Another dropdown <span class="caret"></span></a>
                                    <ul class="dropdown-menu">
                                        <li><a href="#">3rd level dropdown</a></li>
                                        <li><a href="#">3rd level dropdown</a></li>
                                    </ul>
                                </li-->
                                <li class="text-primary">Qual Autor deseja alterar?</li>
                                    <%                                        try {
                                            st = new Conexao().conectar().createStatement();
                                            rs = st.executeQuery("Select * from tbautor order by nomeAutor ASC");

                                            while (rs.next()) {
                                                out.println("<li><hr class='dropdown-divider'></li>");
                                                out.println("<li><a tabindex='-1' class='dropdown-item' href='http://localhost:8080/biblioteca/admin/autores/editarExcluirAutor.jsp?funcao=editar&id=" + rs.getString(1) + "'>" + rs.getString(2) + "</a></li>");

                                            }
                                        } catch (Exception e) {
                                            out.println(e);
                                        }

                                    %>
                            </ul>
                        </li>

                        <!--li><hr class="dropdown-divider"></li>
                        <li><a class="dropdown-item disabled">Excluir Autor</a></li-->
                    </ul>
                </li>

                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle"  name="btnGeneros" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                        Gêneros
                    </a>
                    <ul class="dropdown-menu">
                        <li>
                            <button type="button" class="btn btn-primary dropdown-item" data-bs-toggle="modal" data-bs-target="#CadastrarGenero">
                                Cadastrar Autor
                            </button>
                        </li>
                        <li><a href="http://localhost:8080/biblioteca/admin/genero/listarGeneros.jsp" class="dropdown-item">Listar Gêneros</a></li>
                    </ul>
                </li>
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                        Usuários
                    </a>
                    <ul class="dropdown-menu">
                        <li>
                            <button name="btnAutores" type="button" class="btn btn-primary dropdown-item" data-bs-toggle="modal" data-bs-target="#CadastrarAutor">
                                Cadastrar Usuário
                            </button>
                        </li>
                        <li><a href="http://localhost:8080/biblioteca/admin/autores/listarAutores.jsp" class="dropdown-item">Listar Usuários</a></li>

                        <li class="dropdown-submenu">
                            <a class="dropdown-item test" tabindex="-1">Editar Usuário<span class="caret"></span></a>
                            <ul class="dropdown-menu">
                                <!--li class="dropdown-submenu">
                                    <a class="test" href="#">Another dropdown <span class="caret"></span></a>
                                    <ul class="dropdown-menu">
                                        <li><a href="#">3rd level dropdown</a></li>
                                        <li><a href="#">3rd level dropdown</a></li>
                                    </ul>
                                </li-->
                                <li class="text-primary">Qual Autor deseja alterar?</li>
                                    <%                                        try {
                                            st = new Conexao().conectar().createStatement();
                                            rs = st.executeQuery("Select * from tbautor order by nomeAutor ASC");

                                            while (rs.next()) {
                                                out.println("<li><hr class='dropdown-divider'></li>");
                                                out.println("<li><a tabindex='-1' class='dropdown-item' href='http://localhost:8080/biblioteca/admin/autores/editarExcluirAutor.jsp?funcao=editar&id=" + rs.getString(1) + "'>" + rs.getString(2) + "</a></li>");

                                            }
                                        } catch (Exception e) {
                                            out.println(e);
                                        }

                                    %>
                            </ul>
                        </li>

                        <li><hr class="dropdown-divider"></li>
                        <li><a class="dropdown-item disabled">Excluir Usuário</a></li>
                    </ul>
                </li>
            </ul>
            <!--form class="d-flex" role="search">
                <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search">
                <button class="btn btn-outline-success" type="submit">Search</button>
            </form-->
            <a href="http://localhost:8080/biblioteca/admin/sair.jsp"><i class="bi bi-box-arrow-right"></i></a>
        </div>
    </div>
</nav>



<!-- Modal Cadastrar Autor -->
<div class="modal fade" id="CadastrarAutor" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <%@include file="./autores/cadAutor.jsp" %>
        </div>
    </div>
</div>

<!-- Modal Cadastrar Gênero -->
<div class="modal fade" id="CadastrarGenero" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <%@include file="./genero/cadGenero.jsp" %>
        </div>
    </div>
</div>

<!-- Modal Cadastrar Livro -->
<div class="modal fade" id="CadastrarLivro" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <%@include file="./livros/cadLivro.jsp" %>
        </div>
    </div>
</div>

<script>
    $(document).ready(function () {
        $('.dropdown-submenu a.test').on("click", function (e) {
            $(this).next('ul').toggle();
            e.stopPropagation();
            e.preventDefault();
        });
    });
</script>


