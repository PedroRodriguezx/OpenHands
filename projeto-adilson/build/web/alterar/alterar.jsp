<%@page import="domain.dao.DoacaoDAO"%>
<%@page import="domain.model.Doacao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
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
            background-color: #f9f9f9;
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

        form {
            background-color: #fff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            width: 300px;
            margin-top: 20px;
        }

        label {
            display: block;
            margin: 10px 0 5px;
            color: #555;
        }

        input {
            width: 100%;
            padding: 10px;
            margin-bottom: 15px;
            box-sizing: border-box;
            border: 1px solid #ccc;
            border-radius: 4px;
            font-size: 14px;
        }

        input[type="submit"] {
            background-color: #4CAF50;
            color: white;
            padding: 10px 15px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-size: 16px;
        }

        input[type="submit"]:hover {
            background-color: #45a049;
        }
    </style>
</head>
<body>
    <div>
        <h1>Cadastro de Doação</h1>

        <%
            // Obtém o id da doação da URL
            String idParam = request.getParameter("id");

            // Verifica se o id é fornecido
            if (idParam != null && !idParam.isEmpty()) {
                try {
                    Long id = Long.parseLong(idParam);

                    // Cria uma instância de DoacaoDAO para buscar a doação por ID
                    DoacaoDAO doacaoDAO = new DoacaoDAO();

                    // Chama o método para buscar a doação por ID
                    Doacao doacao = doacaoDAO.buscarPorID(id);

        %>

        <form action="realizar_alteracao.jsp" method="post">
            <!-- Adicione um campo oculto para armazenar o ID -->
            <input type="hidden" id="id" name="id" value="<%= doacao.getId()%>">

            <label for="cpf">CPF:</label>
            <input type="text" id="cpf" name="cpf" value="<%= doacao.getCpf()%>" required>

            <label for="nome">Nome do Doador:</label>
            <input type="text" id="nome" name="nome" value="<%= doacao.getNomeDoador()%>" required>

            <label for="valor">Valor:</label>
            <input type="number" id="valor" name="valor" value="<%= doacao.getValor()%>" required>

            <label for="data">Data da Doação:</label>
            <input type="date" id="data" name="data" value="<%= doacao.getData()%>" required>

            <input type="submit" value="Atualizar Doação">
        </form>

        <%
                } catch (NumberFormatException e) {
                    out.println("<p>ID inválido.</p>");
                }
            } else {
                out.println("<p>ID não especificado.</p>");
            }
        %>

        <a href="http://localhost:8080/projeto-adilson/">Voltar para a Página Inicial</a>
    </div>
</body>
</html>
