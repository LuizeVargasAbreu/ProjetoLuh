<%@page import="java.util.Date"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="modelo.Cliente"%>
<%@page import="dao.ClienteDAO"%>
<%@include file="cabecalho.jsp"%>
<%
    if (request.getParameter("txtNome") == null || request.getParameter("txtDataNasc") == null || request.getParameter("txtCpf") == null|| request.getParameter("txtEmail") == null|| request.getParameter("txtC_codigo") == null)
    {
        response.sendRedirect("clientes.jsp");
        return;
    }

    String nome = request.getParameter("txtNome");
    String data = request.getParameter("txtDataNasc");
    
    SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd");
    Date d = sf.parse(data); 
        
    String cpf = request.getParameter("txtCpf");
    String email = request.getParameter("txtEmail");
    Long codigo = Long.parseLong(request.getParameter("txtC_codigo"));

    ClienteDAO dao = new ClienteDAO();
    Cliente cli = dao.buscarPorChavePrimaria(codigo);

    if (cli == null)
    {
        response.sendRedirect("clientes.jsp");
        return;
    }
    cli.setNome(nome);
    cli.setDataNasc(d);
    cli.setCpf(cpf);
    cli.setEmail(email);
   

    dao.alterar(cli);



%>

<h1 class="centro">Atualização de Clientes</h1>

<div>
    Registro de Clientes alterado com sucesso.<br />
    <a href="clientes.jsp">Voltar para Listagem</a>
</div>
</body>
</html>
