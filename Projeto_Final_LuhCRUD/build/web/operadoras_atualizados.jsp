<%@page import="modelo.Operadora"%>
<%@page import="dao.OperadoraDAO"%>
<%@include file="cabecalho.jsp"%>
<%
    if (request.getParameter("txtNome") == null || request.getParameter("txtO_codigo") == null)
    {
        response.sendRedirect("operadoras.jsp");
        return;
    }

    String nome = request.getParameter("txtNome");
    Long o_codigo = Long.parseLong(request.getParameter("txtO_codigo"));

    OperadoraDAO dao = new OperadoraDAO();
    Operadora op = dao.buscarPorChavePrimaria(o_codigo);

    if (op == null)
    {
        response.sendRedirect("operadoras.jsp");
        return;
    }
    op.setNome(nome);

    dao.alterar(op);



%>

<h1 class="centro">Atualização de Operadoras</h1>

<div>
    Registro de Operadoras alterado com sucesso.<br />
    <a href="operadoras.jsp">Voltar para Listagem</a>
</div>
</body>
</html>
