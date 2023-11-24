package util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class ConnectaDAO {
    private static final String URL = "jdbc:postgresql://localhost:5432/projetoadilson";
    private static final String USER = "projetoadilson";
    private static final String PASSWORD = "1234";

    public Connection conectar() {
        try {
            Class.forName("org.postgresql.Driver");
            return DriverManager.getConnection(URL, USER, PASSWORD);
        } catch (ClassNotFoundException | SQLException e) {
            System.out.println(e.getMessage());
        }

        return null;
    }

}
