<%@page import="modelo.Cliente"%>
<%@page import="dao.ClienteDAO"%>
<%@include file="cabecalho.jsp"%>
<%
    String msg = "";
    if(request.getParameter("codigo")==null)
    {
        response.sendRedirect("clientes.jsp");
    }
    else
    {
        Long codigo = Long.parseLong(request.getParameter("codigo"));
        
        ClienteDAO dao = new ClienteDAO();

        Cliente cli = dao.buscarPorChavePrimaria(codigo);
        if(cli!=null)
        {
            dao.excluir(cli);
            msg = "Registro de Cliente exclu�do com sucesso";
        }
        else
        {
            msg = "Registro de Cliente n�o encontrado. Verifique.";
        }
        
    }
%>
         <h1 class="centro">Exclus�o de Clientes</h1>
            
         <div>
             <%=msg%><br />
             <a href="clientes.jsp">Voltar para Listagem</a>
         </div>
    </body>
</html>
