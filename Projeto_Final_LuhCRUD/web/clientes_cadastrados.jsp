<%@page import="java.util.Date"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="dao.ClienteDAO"%>
<%@page import="modelo.Cliente"%>
<%@include file="cabecalho.jsp"%>
<%
    String msg="";
    
    if(request.getParameter("txtNome") == null || request.getParameter("txtDataNasc") == null || request.getParameter("txtCpf")== null || request.getParameter("txtEmail")== null || request.getParameter("txtC_codigo")== null)
    {
        response.sendRedirect("clientes.jsp");
    }
    else
    {
             
        String nome = request.getParameter("txtNome");
        String data = request.getParameter("txtDataNasc");

        SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd");
        Date d = sf.parse(data);

                  
        String cpf = request.getParameter("txtCpf");
        String email = request.getParameter("txtEmail");
        Long codigo = Long.parseLong(request.getParameter("txtC_codigo"));
        
        ClienteDAO dao = new ClienteDAO();
        Cliente obj = new Cliente();

        obj.setNome(nome);
        obj.setDataNasc(d);
        obj.setCpf(cpf);
        obj.setEmail(email);
        obj.setCCodigo(codigo);
        
       try
        {
            dao.incluir(obj);
            msg = "Registro cadastrado com sucesso";
            
        }
        catch(Exception ex)
        {
            msg = "Erro ao cadastrar registro";
        }
        
    }
    String nome = request.getParameter("txtNome");
    String codigo = request.getParameter("txtC_codigo");

%>

         <h1 class="centro">Cadastro de Clientes</h1>
            
         <div>
             <%=msg%>.<br />
             Nome: <%=nome%><br />
             Código do Cliente: <%=codigo%><br />
             <a href="clientes.jsp">Voltar para Listagem</a>
             
         </div>
    </body>
</html>
