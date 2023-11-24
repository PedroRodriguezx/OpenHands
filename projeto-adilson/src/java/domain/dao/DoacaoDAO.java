package domain.dao;

import util.ConnectaDAO;
import domain.model.Doacao;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class DoacaoDAO {

    private final Connection connection;

    public DoacaoDAO() {
        ConnectaDAO connectaDAO = new ConnectaDAO();
        this.connection = connectaDAO.conectar();
    }

    public void inserirDoacao(Doacao doacao) {
        String sql = "INSERT INTO doacoes (cpf, nome_doador, valor, data) VALUES (?, ?, ?, ?)";
        try (PreparedStatement preparedStatement = connection.prepareStatement(sql)) {
            preparedStatement.setString(1, doacao.getCpf());
            preparedStatement.setString(2, doacao.getNomeDoador());
            preparedStatement.setDouble(3, doacao.getValor());
            preparedStatement.setDate(4, java.sql.Date.valueOf(doacao.getData()));
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
    }

    public void atualizarDoacao(Doacao doacao) {
        String sql = "UPDATE doacoes SET cpf = ?, nome_doador = ?, valor = ?, data = ? WHERE id = ?";
        try (PreparedStatement preparedStatement = connection.prepareStatement(sql)) {
            preparedStatement.setString(1, doacao.getCpf());
            preparedStatement.setString(2, doacao.getNomeDoador());
            preparedStatement.setDouble(3, doacao.getValor());
            preparedStatement.setDate(4, java.sql.Date.valueOf(doacao.getData()));
            preparedStatement.setLong(5, doacao.getId());
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
    }

    public void excluirDoacao(int id) {
        String sql = "DELETE FROM doacoes WHERE id = ?";
        try (PreparedStatement preparedStatement = connection.prepareStatement(sql)) {
            preparedStatement.setInt(1, id);
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
    }

    public List<Doacao> buscarPorCPF(String cpf) {
        List<Doacao> doacoes = new ArrayList<>();
        String sql = "SELECT * FROM doacoes WHERE cpf = ?";
        try (PreparedStatement preparedStatement = connection.prepareStatement(sql)) {
            preparedStatement.setString(1, cpf);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                Doacao doacao = new Doacao(
                        resultSet.getLong("id"),
                        resultSet.getString("cpf"),
                        resultSet.getString("nome_doador"),
                        resultSet.getDouble("valor"),
                        resultSet.getDate("data").toLocalDate()
                );
                doacoes.add(doacao);
            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return doacoes;
    }

    public Doacao buscarPorID(Long id) {
        Doacao doacao = null;
        String sql = "SELECT * FROM doacoes WHERE id = ?";
        try (PreparedStatement preparedStatement = connection.prepareStatement(sql)) {
            preparedStatement.setLong(1, id);
            ResultSet resultSet = preparedStatement.executeQuery();
            if (resultSet.next()) {
                doacao = new Doacao(
                        resultSet.getLong("id"),
                        resultSet.getString("cpf"),
                        resultSet.getString("nome_doador"),
                        resultSet.getDouble("valor"),
                        resultSet.getDate("data").toLocalDate()
                );
            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return doacao;
    }
}
