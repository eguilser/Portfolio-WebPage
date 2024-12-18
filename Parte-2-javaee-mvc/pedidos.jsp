<%@ page language="java" contentType="text/html;charset=UTF-8" import="tienda.*, java.util.List" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Ver Pedidos</title>
</head>
<body>
<%
    if (session == null || session.getAttribute("usuario") == null) {
        response.sendRedirect("login.jsp");
        return;
    }

    Usuario usuario = (Usuario) session.getAttribute("usuario");
    PedidoDAO pedidoDAO = new PedidoDAO();
    List<PedidoBD> pedidos = pedidoDAO.obtenerPedidos(usuario.getId());
%>
<h2>Mis Pedidos</h2>
<table>
    <tr>
        <th>ID</th>
        <th>Fecha</th>
        <th>Estado</th>
        <th>Acciones</th>
    </tr>
    <% for (PedidoBD pedido : pedidos) { %>
        <tr>
            <td><%= pedido.getId() %></td>
            <td><%= pedido.getFecha() %></td>
            <td><%= pedido.getEstado() %></td>
            <td>
                <% if ("Pendiente".equals(pedido.getEstado())) { %>
                    <form action="CancelarPedido" method="post">
                        <input type="hidden" name="idPedido" value="<%= pedido.getId() %>">
                        <button type="submit">Cancelar</button>
                    </form>
                <% } %>
            </td>
        </tr>
    <% } %>
</table>
<a href="verDatosPersonales.jsp">Ver mis datos</a>
<a href="logout.jsp">Cerrar Sesión</a>
</body>
</html>

