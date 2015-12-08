<%@page import="dao.TelefoneDAO"%>
<%@page import="modelo.Telefone"%>
<%@include file="cabecalho.jsp"%>
<%
    if (request.getParameter("codigo") == null)
    {
        response.sendRedirect("telefones.jsp");
        return;
    }

    Long tcodigo = Long.parseLong(request.getParameter("codigo"));
    TelefoneDAO dao = new TelefoneDAO();
    Telefone tel = dao.buscarPorChavePrimaria(tcodigo);

    if (tel == null)
    {
        response.sendRedirect("telefones.jsp");
        return;

    }

%>
<div>
    <h1 class="centro">Atualização de Telefones</h1>

    <div>

        <form action="telefones_atualizados.jsp" method="post">
            <label>Número: </label><input type="text" name="txtNumero" value="<%=tel.getNumero()%>" /><br />
            <label>Tipo: </label><input type="text" name="txtTipo" value="<%=tel.getTipo()%>" /><br />
            <label>Código do Telefone: </label><input type="text" name="txtT_codigo" value="<%=tel.getTCodigo()%>" readonly="readonly" /><br />
            
            <input type="submit" value="Atualizar" />
        </form>
    </div>
</div>



</body>
</html>
