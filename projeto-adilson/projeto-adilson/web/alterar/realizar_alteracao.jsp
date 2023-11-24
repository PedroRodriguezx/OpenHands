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
</head>
<body>
    <h1>Alterar Doação</h1>

    <%
        
        String cpf = request.getParameter("cpf");
        String nomeDoador = request.getParameter("nome");
        double valor = Double.parseDouble(request.getParameter("valor"));
        LocalDate data = LocalDate.parse(request.getParameter("data"));

        Doacao doacao = new Doacao(cpf, nomeDoador, valor, data);
        DoacaoDAO doacaoDAO = new DoacaoDAO();

        doacaoDAO.atualizarDoacao(doacao);
    %>

    <p>Doação alterada com sucesso!</p>

    <a href="http://localhost:8080/projeto-adilson/">Voltar para a página inicial</a>
</body>
</html>