package org.example.model.dao;

import org.example.model.User;

import javax.sql.DataSource;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class UserDao {
    public ResultSet Login(User user, DataSource dataSource) throws SQLException {
        Connection connection = dataSource.getConnection();
        PreparedStatement statement = connection.prepareStatement("SELECT * FROM users WHERE username = ? AND password = ?");
        statement.setString(1, user.getUserName());
        statement.setString(2, user.getPassword());
        ResultSet resultSet = statement.executeQuery();
        return resultSet;
    }

    public int insertUser(User user, DataSource dataSource) throws SQLException {
        Connection connection = dataSource.getConnection();
        PreparedStatement statement = connection.prepareStatement("INSERT INTO users(id,username,password,role) VALUES(?,?,?,?)");
        statement.setString(1, user.getId());
        statement.setString(2, user.getUserName());
        statement.setString(3, user.getPassword());
        statement.setString(4, user.getRole());
        int i = statement.executeUpdate();
        return i;
    }
}
