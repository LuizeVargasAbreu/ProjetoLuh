<%@page import="dao.OperadoraDAO"%>
<%@page import="modelo.Operadora"%>
<%@include file="cabecalho.jsp"%>
<%
    if (request.getParameter("o_codigo") == null)
    {
        response.sendRedirect("operadoras.jsp");
        return;
    }

    Long o_codigo = Long.parseLong(request.getParameter("o_codigo"));
    OperadoraDAO dao = new OperadoraDAO();
    Operadora op = dao.buscarPorChavePrimaria(o_codigo);

    if (op == null)
    {
        response.sendRedirect("operadoras.jsp");
        return;

    }

%>
<div>
    <h1 class="centro">Atualização de Operadoras</h1>

    <div>

        <form action="operadoras_atualizados.jsp" method="post">
            <label>Nome: </label><input type="text" name="txtNome" value="<%=op.getNome()%>" /><br />
            <label>Código: </label><input type="text" name="txtO_codigo" value="<%=op.getOCodigo()%>" readonly="readonly" /><br />
            
            <input type="submit" value="Atualizar" />
        </form>
    </div>
</div>



</body>
</html>
