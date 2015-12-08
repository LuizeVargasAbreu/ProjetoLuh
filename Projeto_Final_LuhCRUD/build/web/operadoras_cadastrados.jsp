<%@page import="dao.OperadoraDAO"%>
<%@page import="modelo.Operadora"%>
<%@include file="cabecalho.jsp"%>
<%
    String msg="";
    
    if(request.getParameter("txtNome") == null || request.getParameter("txtO_codigo")== null)
    {
        response.sendRedirect("operadoras.jsp");
    }
    else
    {
             
       
        String nome = request.getParameter("txtNome");
        Long o_codigo = Long.parseLong(request.getParameter("txtO_codigo"));
        
        OperadoraDAO dao = new OperadoraDAO();
        Operadora op = new Operadora();

        op.setNome(nome);
        op.setOCodigo(o_codigo);
        
       try
        {
            dao.incluir(op);
            msg = "Registro cadastrado com sucesso";
            
        }
        catch(Exception ex)
        {
            msg = "Erro ao cadastrar registro";
        }
        
    }
    String nome = request.getParameter("txtNome");
    String o_codigo = request.getParameter("txtO_codigo");

%>

         <h1 class="centro">Cadastro de Operadoras</h1>
            
         <div>
             <%=msg%>.<br />
             Nome: <%=nome%><br />
             Código do Operadora: <%=o_codigo%><br />
             <a href="operadoras.jsp">Voltar para Listagem</a>
             
         </div>
    </body>
</html>
