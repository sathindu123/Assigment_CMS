package org.example.model.dao;



import org.example.model.Complains;

import javax.sql.DataSource;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class ComplainsDao {

    public ResultSet getAllComplains(String userId, DataSource dataSource) throws Exception {
        Connection connection = dataSource.getConnection();
        PreparedStatement preparedStatement = connection.prepareStatement("SELECT * FROM complaints WHERE user_id = ?");
        preparedStatement.setString(1, userId);
        ResultSet resultSet = preparedStatement.executeQuery();
        return resultSet;
    }

    public int saveComplains(Complains complains , DataSource dataSource) throws Exception {
        Connection connection = dataSource.getConnection();
        PreparedStatement preparedStatement = connection.prepareStatement("INSERT INTO complaints (id, user_id, description, status, remarks) VALUES (?, ?, ?, ?, ?)");
        preparedStatement.setString(1, complains.getComplainId());
        preparedStatement.setString(2, complains.getUserId());
        preparedStatement.setString(3, complains.getDescription());
        preparedStatement.setString(4, complains.getStatus());
        preparedStatement.setString(5, complains.getRemarks());
        int i = preparedStatement.executeUpdate();
        return i;
    }

    public int deleteComplains(String id, DataSource dataSource) throws SQLException {
        Connection connection = dataSource.getConnection();
        PreparedStatement preparedStatement = connection.prepareStatement("DELETE FROM complaints WHERE id = ?");
        preparedStatement.setString(1,id);

        int i = preparedStatement.executeUpdate();
        return i;
    }

    public int updateComplains(Complains complains, DataSource dataSource) throws SQLException {
        Connection connection = dataSource.getConnection();
        PreparedStatement preparedStatement = connection.prepareStatement("UPDATE complaints SET user_id = ?, description = ?,status  = ?, remarks = ? WHERE id = ?;  ");
        preparedStatement.setString(1, complains.getUserId());
        preparedStatement.setString(2, complains.getDescription());
        preparedStatement.setString(3, complains.getStatus());
        preparedStatement.setString(4, complains.getRemarks());
        preparedStatement.setString(5, complains.getComplainId());
        int i = preparedStatement.executeUpdate();
        return i;
    }

    public ResultSet getAllComplainsAdmin(DataSource dataSource) throws SQLException {
        Connection connection = dataSource.getConnection();
        PreparedStatement preparedStatement = connection.prepareStatement(" select * from complaints");
        ResultSet resultSet = preparedStatement.executeQuery();
        return resultSet;
    }

    public ResultSet isResolved(String id, DataSource dataSource) throws SQLException {
        Connection connection = dataSource. getConnection();
        PreparedStatement preparedStatement = connection.prepareStatement("SELECT status FROM complaints WHERE id = 'C010';");
        ResultSet resultSet = preparedStatement.executeQuery();
        return resultSet;
    }

    public ResultSet FinishStatus(String id, DataSource dataSource) throws SQLException {
        Connection connection = dataSource.getConnection();
        PreparedStatement statement = connection.prepareStatement("SELECT status FROM complaints WHERE id = ?");
        statement.setString(1, id);
        ResultSet resultSet = statement.executeQuery();
        return resultSet;
    }
}
