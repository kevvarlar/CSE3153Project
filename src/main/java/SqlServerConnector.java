import java.sql.*;

public class SqlServerConnector {

  private String connectionString =
      "jdbc:sqlserver://localhost;databaseName=RPG;encrypt=true;trustServerCertificate=true";

  private String user = "devuser";

  public void connectToSqlServer() {
    try {
      Connection connection = DriverManager.getConnection(connectionString, user, "");
      System.out.println("Connected to SQL Server");
    } catch (SQLException sqlException) {
      System.err.println("Error: " + sqlException.getMessage());
    }
  }
}
