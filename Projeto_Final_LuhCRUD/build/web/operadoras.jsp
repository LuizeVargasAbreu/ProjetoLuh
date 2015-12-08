<%@page import="modelo.Operadora"%>
<%@page import="java.util.List"%>
<%@page import="java.util.List"%>
<%@page import="dao.OperadoraDAO"%>
<%@include file="cabecalho.jsp"%>
<%
OperadoraDAO dao = new OperadoraDAO();

List<Operadora> lista;

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
            <h1 class="centro">Operadoras</h1>
            
            <div>
                <a href="operadoras_cadastrar.jsp">+ Novo Operadora</a><br />
                
                 
                <form action="operadoras.jsp" method="post">
                    <input type="text" name="txtFiltro" />
                    <input type="submit" value="Pesquisar"/><br />
                </form>
               
                 
                
                
                    <table>
                        <tr>
                            <th>Nome</th>
                            <th>Código</th>
                            
                            <th>Ações</th>
                        </tr>
                        <%
                        for(Operadora item:lista)
                        {
                        %>
                        <tr>
                            <td><%=item.getNome()%></td>
                            <td><%=item.getOCodigo()%></td>
                            <td><a href="operadoras_atualizar.jsp?o_codigo=<%=item.getOCodigo()%>">Editar</a>
                                <a href="operadoras_excluindo.jsp?o_codigo=<%=item.getOCodigo()%>">Excluir</a>
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
