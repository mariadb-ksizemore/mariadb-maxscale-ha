//STEP 1. Import required packages
//package mariadb;

import java.sql.*;
import org.mariadb.jdbc.Driver;

public class Demo {
	// MaxScale connection details
	private static final String MX1_URL = "172.31.41.217";
	private static final String MX2_URL = "172.31.32.182";

	// Database credentials
	private static final String USER = "admin";
	private static final String PASS = "admin";

	// Connection String
	private static final String CONNECTSTRING = String.format("jdbc:mariadb:sequential://%s,%s/test?user=%s&password=%s",
			MX1_URL, MX2_URL, USER, PASS);

	public static void main(String[] args) throws Exception {
		System.out.println(CONNECTSTRING);

		// STEP 2: Open a connection
		System.out.println("Connecting to a selected database...");
		try (Connection conn = DriverManager.getConnection(CONNECTSTRING)) {

			System.out.println("Connected database successfully...");

			// STEP 3: Execute a queries
			//// Create Table
			System.out.println("Creating table if not exists...");
			try (Statement stmt = conn.createStatement()) {

				var sql = """
						CREATE TABLE IF NOT EXISTS javatest
						id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
						source VARCHAR(20),
						tstamp TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP);
						""";

				stmt.executeUpdate(sql);

				//// Insert Records
				System.out.println("Inserting Record...");
				var sql2 = "INSERT INTO javatest VALUES (NULL,'javatest script', NULL)";

				stmt.executeUpdate(sql2);

				//// Select From Table
				var query = "SELECT id, source, tstamp FROM javatest";
				ResultSet rs = stmt.executeQuery(query);

				//// Display Results
				while (rs.next()) {
					var id = rs.getInt("id");
					var source = rs.getString("source");
					var tstamp = rs.getTimestamp("tstamp");
					System.out.format("%s, %s, %s \n", id, source, tstamp);
				}
			} // end try stmt
		} // end try connection
		System.out.println("Goodbye!");
	} // end main
} // end JDBCExample
