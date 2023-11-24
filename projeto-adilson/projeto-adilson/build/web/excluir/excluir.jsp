<%@page import="domain.dao.DoacaoDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<%
    // Obtém o id da doação da URL
    String idParam = request.getParameter("id");

    if (idParam != null && !idParam.isEmpty()) {
        try {
            int id = Integer.parseInt(idParam);

            // Cria uma instância de DoacaoDAO para realizar a exclusão
            DoacaoDAO doacaoDAO = new DoacaoDAO();

            // Chama o método para excluir a doação com base no id
            doacaoDAO.excluirDoacao(id);

            // Redireciona de volta para a página de listagem
            response.sendRedirect("http://localhost:8080/projeto-adilson/");
 
        } catch (NumberFormatException e) {
            out.println("ID inválido");
        }
    } else {
        out.println("ID não especificado");
    }
%>