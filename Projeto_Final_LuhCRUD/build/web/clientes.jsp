<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="modelo.Cliente"%>
<%@page import="java.util.List"%>
<%@page import="java.util.List"%>
<%@page import="dao.ClienteDAO"%>
<%@include file="cabecalho.jsp"%>
<%
    ClienteDAO dao = new ClienteDAO();

    List<Cliente> lista;

    if (request.getParameter("txtFiltro") != null && request.getParameter("txtFiltro") != "")
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
    <h1 class="centro">Clientes</h1>

    <div>
        <a href="clientes_cadastrar.jsp">+ Novo Cliente</a><br />


        <form action="clientes.jsp" method="post">
            <input type="text" name="txtFiltro" />
            <input type="submit"  value="Pesquisar"/><br />
        </form>




        <table>
            <tr>
                <th>Nome</th>
                <th>Data Nasc.</th>
                <th>CPF</th>
                <th>Email</th>
                <th>Código do Cliente</th>

                <th>Ações</th>
            </tr>
            <%                            
                SimpleDateFormat sf = new SimpleDateFormat("dd/MM/yyyy");
                for (Cliente item : lista)
                {
            %>
            <tr>
                <td><%=item.getNome()%></td>
                <td><%=sf.format(item.getDataNasc())%></td>
                <td><%=item.getCpf()%></td>
                <td><%=item.getEmail()%></td>
                <td><%=item.getCCodigo()%></td>
                <td><a href="clientes_atualizar.jsp?codigo=<%=item.getCCodigo()%>">Editar</a>
                    <a href="clientes_excluindo.jsp?codigo=<%=item.getCCodigo()%>">Excluir</a>
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
