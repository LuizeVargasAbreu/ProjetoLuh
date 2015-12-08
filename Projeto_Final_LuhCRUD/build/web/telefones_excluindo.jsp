<%@page import="modelo.Telefone"%>
<%@page import="dao.TelefoneDAO"%>
<%@include file="cabecalho.jsp"%>
<%
    String msg = "";
    if(request.getParameter("codigo")==null)
    {
        response.sendRedirect("telefones.jsp");
    }
    else
    {
        Long tcodigo = Long.parseLong(request.getParameter("codigo"));
        
        TelefoneDAO dao = new TelefoneDAO();

        Telefone tel = dao.buscarPorChavePrimaria(tcodigo);
        if(tel!=null)
        {
            dao.excluir(tel);
            msg = "Registro de Telefone excluído com sucesso";
        }
        else
        {
            msg = "Registro de Telefone não encontrado. Verifique.";
        }
        
    }
%>
         <h1 class="centro">Exclusão de Telefones</h1>
            
         <div>
             <%=msg%><br />
             <a href="telefones.jsp">Voltar para Listagem</a>
         </div>
    </body>
</html>
