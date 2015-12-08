<%@page import="modelo.Operadora"%>
<%@page import="modelo.Cliente"%>
<%@page import="dao.TelefoneDAO"%>
<%@page import="modelo.Telefone"%>
<%@include file="cabecalho.jsp"%>
<%
    String msg="";
    
    if(request.getParameter("txtNumero") == null || request.getParameter("txtTipo") == null || request.getParameter("txtT_codigo")== null)
    {
        response.sendRedirect("telefones.jsp");
    }
    else
    {
             
        String numero = request.getParameter("txtNumero");
        String tipo = request.getParameter("txtTipo");
        Long tcodigo = Long.parseLong(request.getParameter("txtT_codigo"));
        String cliente = request.getParameter("selCliente");
        String operadora = request.getParameter("selOperadora");

        TelefoneDAO dao = new TelefoneDAO();
        Telefone tel = new Telefone();
            
        Cliente cli1 = new Cliente();
        cli1.setCCodigo(Long.parseLong(cliente));
                      
        Operadora op1 = new Operadora();
        op1.setOCodigo(Long.parseLong(operadora));
        
        tel.setNumero(numero);
        tel.setTipo(tipo);
        tel.setTCodigo(tcodigo);
        tel.setCliente(cli1);
        tel.setOperadora(op1);
        
       try
        {
            dao.incluir(tel);
            msg = "Registro cadastrado com sucesso";
            
        }
        catch(Exception ex)
        {
            msg = "Erro ao cadastrar registro";
        }
        
    }
    String numero = request.getParameter("txtNumero");
    String tcodigo = request.getParameter("txtT_codigo");

%>

         <h1 class="centro">Cadastro de Telefones</h1>
            
         <div>
             <%=msg%>.<br />
             Número: <%=numero%><br />
             Código do Telefone: <%=tcodigo%><br />
             <a href="telefones.jsp">Voltar para Listagem</a>
             
         </div>
    </body>
</html>
