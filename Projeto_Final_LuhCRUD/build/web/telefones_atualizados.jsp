<%@page import="java.util.Date"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="modelo.Telefone"%>
<%@page import="dao.TelefoneDAO"%>
<%@include file="cabecalho.jsp"%>
<%
    if (request.getParameter("txtNome") == null || request.getParameter("txtTipo") == null|| request.getParameter("txtT_codigo") == null)
    {
        response.sendRedirect("telefones.jsp");
        return;
    }

    String numero = request.getParameter("txtNumero");
    String tipo = request.getParameter("txtTipo");
    Long tcodigo = Long.parseLong(request.getParameter("txtT_codigo"));

    TelefoneDAO dao = new TelefoneDAO();
    Telefone tel = dao.buscarPorChavePrimaria(tcodigo);

    if (tel == null)
    {
        response.sendRedirect("telefones.jsp");
        return;
    }
    tel.setNumero(numero);
    tel.setTipo(tipo);

    dao.alterar(tel);



%>

<h1 class="centro">Atualização de Telefones</h1>

<div>
    Registro de Telefones alterado com sucesso.<br />
    <a href="telefones.jsp">Voltar para Listagem</a>
</div>
</body>
</html>
