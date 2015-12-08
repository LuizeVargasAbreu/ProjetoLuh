<%@page import="modelo.Operadora"%>
<%@page import="dao.OperadoraDAO"%>
<%@page import="modelo.Cliente"%>
<%@page import="dao.ClienteDAO"%>
<%@page import="java.util.List"%>
<%@include file="cabecalho.jsp"%>
<%
ClienteDAO cDAO = new ClienteDAO();
List<Cliente> cLista = cDAO.listar();

OperadoraDAO oDAO = new OperadoraDAO();
List<Operadora> oLista = oDAO.listar(); 

%>
<div>
    <h1 class="centro">Cadastro de Telefones</h1>

    <div>

        <form action="telefones_cadastrados.jsp" method="post">
            <label>Número: </label><input type="text" name="txtNumero" /><br>
            <label>Tipo: </label><input type="text" name="txtTipo" /><br>
            <label>Código: </label><input type="text" name="txtT_codigo" /><br />
            <label>Cliente: </label>
            <select name="selCliente">
                <option value="">Selecione</option>
                <%
                  for (Cliente citem : cLista)
                  {
                %>
                <option value="<%=citem.getCCodigo()%>"><%=citem%></option>
                <%
                    }
                %>
            </select>
            <br />
            <label>Operadora: </label>
            <select name="selOperadora">
                <option value="">Selecione</option>
                <%
                    for (Operadora oitem : oLista)
                    {
                %>
                <option value="<%=oitem.getOCodigo()%>"><%=oitem%></option>
                <%
                    }
                %>
            </select>
            <br />
            <input type="reset" value="Limpar" />
            <input type="submit" value="Cadastrar" />
        </form>
    </div>
</div>



</body>
</html>
