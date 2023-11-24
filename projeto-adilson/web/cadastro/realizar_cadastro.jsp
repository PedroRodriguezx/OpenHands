<%@page import="domain.dao.DoacaoDAO"%>
<%@page import="domain.model.Doacao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
<%@ page import="java.time.LocalDate" %>

<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Cadastro de Doação</title>
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

        p {
            color: #4CAF50;
            margin-top: 20px;
        }

        a {
            text-decoration: none;
            padding: 5px 10px;
            margin-top: 20px;
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
        <h1>Cadastro de Doação</h1>

        <%
            String cpf = request.getParameter("cpf");
            String nomeDoador = request.getParameter("nome");
            double valor = Double.parseDouble(request.getParameter("valor"));
            LocalDate data = LocalDate.parse(request.getParameter("data"));

            Doacao novaDoacao = new Doacao(cpf, nomeDoador, valor, data);
            DoacaoDAO doacaoDAO = new DoacaoDAO();

            doacaoDAO.inserirDoacao(novaDoacao);
        %>

        <p>Doação cadastrada com sucesso!</p>

        <a href="http://localhost:8080/projeto-adilson/">Voltar para a página inicial</a>
    </div>
</body>
</html>
