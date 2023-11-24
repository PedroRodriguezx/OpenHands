<%@page import="domain.dao.DoacaoDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Exclusão de Doação</title>
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
            color: #555;
            margin-top: 20px;
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
        <h1>Exclusão de Doação</h1>

        <%
            // Obtém o id da doação da URL
            String idParam = request.getParameter("id");

            if (idParam != null && !idParam.isEmpty()) {
                try {
                    int id = Integer.parseInt(idParam);

                    DoacaoDAO doacaoDAO = new DoacaoDAO();

                    doacaoDAO.excluirDoacao(id);

                    out.println("<p>Doação excluída com sucesso.</p>");
                } catch (NumberFormatException e) {
                    out.println("<p>ID inválido.</p>");
                }
            } else {
                out.println("<p>ID não especificado.</p>");
            }
        %>

        <a href="http://localhost:8080/projeto-adilson/index.html">Voltar para a Página Inicial</a>
    </div>
</body>

</html>
