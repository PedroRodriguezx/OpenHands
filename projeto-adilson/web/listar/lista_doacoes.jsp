<%@page import="java.util.List"%>
<%@ page import="domain.model.Doacao" %>
<%@ page import="domain.dao.DoacaoDAO" %>
<%@ page import="controller.CpfController" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Lista de Doações</title>
    <style>
        body {
            font-family: 'Arial', sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            height: 100vh;
        }

        h1 {
            color: #333;
        }

        h2 {
            color: #555;
        }

        table {
            border-collapse: collapse;
            width: 80%;
            margin-top: 20px;
        }

        th, td {
            border: 1px solid #ddd;
            padding: 8px;
            text-align: left;
        }

        th {
            background-color: #4CAF50;
            color: white;
        }

        tr:nth-child(even) {
            background-color: #f2f2f2;
        }

        a {
            text-decoration: none;
            padding: 5px 10px;
            margin: 2px;
            border-radius: 3px;
            background-color: #4CAF50;
            color: white;
        }

        a:hover {
            background-color: #45a049;
        }
    </style>
</head>

<body>
    <div>
        <h1>Lista de Doações</h1>

        <%
            String cpf = request.getParameter("cpf");
            CpfController cpfController = new CpfController();
            DoacaoDAO doacaoDAO = new DoacaoDAO();
            
            if (cpfController.existsCpf(cpf)) {
                List<Doacao> doacoes = doacaoDAO.buscarPorCPF(cpf);
                String nome = doacoes.get(0).getNomeDoador();
        %>

        <h2>Doações do doador <%= nome%>:</h2>

        <table>
            <tr>
                <th>Valor</th>
                <th>Data da Doação</th>
                <th>Ações</th>
            </tr>
            <%
                for (Doacao doacao : doacoes) {
            %>
            <tr>
                <td><%= doacao.getCpf()%></td>
                <td><%= doacao.getValor()%></td>
                <td><%= doacao.getData()%></td>
                <td>
                    <a href="http://localhost:8080/projeto-adilson/alterar/alterar.jsp?id=<%= doacao.getId()%>">Alterar</a>                 
                </td>
                <td>
                     <a href="http://localhost:8080/projeto-adilson/excluir/excluir.jsp?id=<%= doacao.getId()%>">Cancelar</a>
                </td>
            </tr>
            <%
                }
            %>
        </table>

        <%
            } else {
        %>

        <p>CPF não encontrado. Não há doações para listar.</p>

        <%
            }
        %>
    </div>
</body>

</html>
