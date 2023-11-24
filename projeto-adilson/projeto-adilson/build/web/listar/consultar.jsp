<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Página Inicial</title>
</head>
<body>
    <h1>Consulta de Doações</h1>

    <form action="lista_doacoes.jsp" method="post">
        <label for="cpf">Digite o CPF:</label>
        <input type="text" id="cpf" name="cpf" required>
        <input type="submit" value="Consultar Doações">
    </form>
</body>
</html>