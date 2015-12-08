<%@include file="cabecalho.jsp"%>

<div>
    <h1 class="centro">Cadastro de Clientes</h1>

    <div>

        <form action="clientes_cadastrados.jsp" method="post">
            <label>Nome: </label><input type="text" name="txtNome" /><br 
            <label>Data de Nascimento: </label><input type="date" name="txtDataNasc" /><br />
            <label>CPF: </label><input type="text" name="txtCpf" /><br />
            <label>Email: </label><input type="text" name="txtEmail" /><br />
            <label>Código do Cliente: </label><input type="text" name="txtC_codigo" /><br />
            <input type="reset" value="Limpar" />
            <input type="submit" value="Cadastrar" />
        </form>
    </div>
</div>



</body>
</html>
