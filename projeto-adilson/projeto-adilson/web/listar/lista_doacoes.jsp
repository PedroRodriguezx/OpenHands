<%@page import="java.util.List"%>
<%@ page import="domain.model.Doacao" %>
<%@ page import="domain.dao.DoacaoDAO" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Lista de Doações</title>
    </head>
    <body>
        <h1>Lista de Doações</h1>

        <%
            String cpf = request.getParameter("cpf"); // Obter o CPF da primeira página

            DoacaoDAO doacaoDAO = new DoacaoDAO();

            List<Doacao> doacoes = doacaoDAO.buscarPorCPF(cpf);
            
            String nome = doacoes.get(0).getNomeDoador();
        %>

        <h2>Doações do doador <%= nome%> :</h2>

        <table border="1">
            <tr>
                <th>Valor</th>
                <th>Data da Doação</th>
                <th>Cancelar</th>
            </tr>
            <%
                for (Doacao doacao : doacoes) {
            %>
            <tr>
                <td><%= doacao.getValor()%></td>
                <td><%= doacao.getData()%></td>
                <td>
                    <a href="http://localhost:8080/projeto-adilson/excluir/alterar.jsp?id=<%= doacao.getId()%>">Alterar</a>
                    <a href="http://localhost:8080/projeto-adilson/excluir/excluir.jsp?id=<%= doacao.getId()%>">Cancelar</a>
                </td>
            </tr>
            <%
                }
            %>
        </table>
    </body>
</html>
