<%@include file="cabecalho.jsp"%>

<div>
    <h1 class="centro">Cadastro de Operadoras</h1>

    <div>

        <form action="operadoras_cadastrados.jsp" method="post">
            <label>Nome: </label><input type="text" name="txtNome" /><br />
            <label>Código: </label><input type="text" name="txtO_codigo" /><br />
            <input type="reset" value="Limpar" />
            <input type="submit" value="Cadastrar" />
        </form>
    </div>
</div>



</body>
</html>
