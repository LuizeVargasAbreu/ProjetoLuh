<%@page import="modelo.Telefone"%>
<%@page import="java.util.List"%>
<%@page import="java.util.List"%>
<%@page import="dao.TelefoneDAO"%>
<%@include file="cabecalho.jsp"%>
<%
TelefoneDAO dao = new TelefoneDAO();

List<Telefone> lista;

if(request.getParameter("txtFiltro")!=null && request.getParameter("txtFiltro")!="")
{
    String txtFiltro = request.getParameter("txtFiltro");
    lista = dao.listar(txtFiltro);
}
else
{
    lista = dao.listar();
}

%>
        <div>
            <h1 class="centro">Telefones</h1>
            
            <div>
                <a href="telefones_cadastrar.jsp">+ Novo Telefone</a><br />
                
                 
                <form action="telefones.jsp" method="post">
                    <input type="text" name="txtFiltro" />
                    <input type="submit"  value="Pesquisar"/><br />
                </form>
               
                 
                
                
                    <table>
                        <tr>
                            <th>Número</th>
                            <th>Tipo</th>
                            <th>Código</th>
                            <th>Cliente</th>
                            <th>Operadora</th>
                            
                            <th>Ações</th>
                        </tr>
                        <%
                        for(Telefone item:lista)
                        {
                        %>
                        <tr>
                            <td><%=item.getNumero()%></td>
                            <td><%=item.getTipo()%></td>
                            <td><%=item.getTCodigo()%></td>
                            <td><%=item.getCliente()%></td>
                            <td><%=item.getOperadora()%></td>
                            <td><a href="telefones_atualizar.jsp?codigo=<%=item.getTCodigo()%>">Editar</a>
                                <a href="telefones_excluindo.jsp?codigo=<%=item.getTCodigo()%>">Excluir</a>
                            </td>
                            
                        </tr>
                       <%
                        }
                       %>
                    </table>
                    
                
            </div>
        </div>
    </body>
</html>
