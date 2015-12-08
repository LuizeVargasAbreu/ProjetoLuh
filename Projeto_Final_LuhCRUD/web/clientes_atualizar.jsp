<%@page import="dao.ClienteDAO"%>
<%@page import="modelo.Cliente"%>
<%@include file="cabecalho.jsp"%>
<%
    if (request.getParameter("codigo") == null)
    {
        response.sendRedirect("clientes.jsp");
        return;
    }

    Long codigo = Long.parseLong(request.getParameter("codigo"));
    ClienteDAO dao = new ClienteDAO();
    Cliente cli = dao.buscarPorChavePrimaria(codigo);

    if (cli == null)
    {
        response.sendRedirect("clientes.jsp");
        return;

    }

%>
<div>
    <h1 class="centro">Atualização de Clientes</h1>

    <div>

        <form action="clientes_atualizados.jsp" method="post">
            <label>Nome: </label><input type="text" name="txtNome" value="<%=cli.getNome()%>" /><br />
            <label>Data de Nascimento: </label><input type="date" name="txtDataNasc" value="<%=cli.getDataNasc()%>" /><br />
            <label>CPF: </label><input type="text" name="txtCpf" value="<%=cli.getCpf()%>" readonly="readonly"/><br />
            <label>Email: </label><input type="text" name="txtEmail" value="<%=cli.getEmail()%>" /><br />
            <label>Código do Cliente: </label><input type="text" name="txtC_codigo" value="<%=cli.getCCodigo()%>" /><br />
            
            <input type="submit" value="Atualizar" />
        </form>
    </div>
</div>



</body>
</html>
