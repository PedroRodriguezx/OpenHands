<%@page import="domain.dao.DoacaoDAO"%>
<%@page import="domain.model.Doacao"%>
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      <!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Atualiza��o de Doa��o</title>
</head>
<body>
    <h1>Atualiza��o de Doa��o</h1>

    <%-- Recuperando os dados da doa��o para preencher o formul�rio --%>
    <%
        Long id = Long.parseLong(request.getParameter("id"));
        DoacaoDAO dao = new DoacaoDAO();
        
        Doacao doacao = dao.buscarPorID(id);
    %>

    <form action="realizar_alteracao.jsp" method="post">
        <input type="hidden" name="id" value="<%= doacao.getId() %>">

        <label for="cpf">CPF:</label>
        <input type="text" id="cpf" name="cpf" value="<%= doacao.getCpf() %>" required><br><br>

        <label for="nome">Nome do Doador:</label>
        <input type="text" id="nome" name="nome" value="<%= doacao.getNomeDoador() %>" required><br><br>

        <label for="valor">Valor:</label>
        <input type="number" id="valor" name="valor" value="<%= doacao.getValor() %>" required><br><br>

        <label for="data">Data da Doa��o:</label>
        <input type="date" id="data" name="data" value="<%= doacao.getData() %>" required><br><br>

        <input type="submit" value="Atualizar Doa��o">
    </form>

    <%
            }
        }
    %>
</body>
</html>
