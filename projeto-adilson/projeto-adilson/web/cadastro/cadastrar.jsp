<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Cadastro de Doação</title>
</head>
<body>
    <h1>Cadastro de Doação</h1>

    <form action="realizar_cadastro.jsp" method="post">
        <label for="cpf">CPF:</label>
        <input type="text" id="cpf" name="cpf" required><br><br>

        <label for="nome">Nome do Doador:</label>
        <input type="text" id="nome" name="nome" required><br><br>

        <label for="valor">Valor:</label>
        <input type="number" id="valor" name="valor" required><br><br>

        <label for="data">Data da Doação:</label>
        <input type="date" id="data" name="data" required><br><br>

        <input type="submit" value="Cadastrar Doação">
    </form>
</body>
</html>