<%@page import="modelo.Operadora"%>
<%@page import="dao.OperadoraDAO"%>
<%@include file="cabecalho.jsp"%>
<%
    String msg = "";
    if(request.getParameter("o_codigo")==null)
    {
        response.sendRedirect("operadoras.jsp");
    }
    else
    {
        Long o_codigo = Long.parseLong(request.getParameter("o_codigo"));
        
        OperadoraDAO dao = new OperadoraDAO();

        Operadora op = dao.buscarPorChavePrimaria(o_codigo);
        if(op!=null)
        {
            dao.excluir(op);
            msg = "Registro de Operadora exclu�do com sucesso";
        }
        else
        {
            msg = "Registro de Operadora n�o encontrado. Verifique.";
        }
        
    }
%>
         <h1 class="centro">Exclus�o de Operadoras</h1>
            
         <div>
             <%=msg%><br />
             <a href="operadoras.jsp">Voltar para Listagem</a>
         </div>
    </body>
</html>
