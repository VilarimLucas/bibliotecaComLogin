<%-- 
    Document   : cadUsuario
    Created on : 20 de mai. de 2023, 20:39:55
    Author     : vilar
--%>


<%@ include file="../../referencias.jsp" %>

<div class="modal-header">
    <h1 class="modal-title fs-5" id="exampleModalLabel">Cadastrar Usuário</h1>
    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
</div>
<form>
    <div class="modal-body">
        <div class="input-group input-group-lg">
            <span class="input-group-text" id="inputGroup-sizing-lg"><i class="bi bi-person"></i></span>
            <input type="text" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-lg" placeholder="Digite um autor" name="txtAutor" required>
        </div>
    </div>
    <div class="modal-footer">
        <button type="button" class="btn btn-danger" data-bs-dismiss="modal">Cancelar</button>
        <button type="submit" class="btn btn-primary" name="btnSalvarAutor">Salvar Autor</button>
    </div>
</form>