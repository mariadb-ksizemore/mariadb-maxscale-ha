//STEP 1. Import required packages
//package mariadb;

import java.sql.*;
import org.mariadb.jdbc.Driver;

public class javademo {
    // MaxScale connection details

    static final String MX1_URL = "172.31.41.217";
    static final String MX2_URL = "172.31.32.182";

    //  Database credentials
    static final String USER = "admin";
    static final String PASS = "admin";

    // Connection String
    static final String CONNECTSTRING = ("jdbc:mariadb:sequential://" + MX1_URL + "," + MX2_URL + "/test?user=" + USER + "&password=" + PASS );


    public static void main(String[] args) {
        Connection conn = null;
        Statement stmt = null;
        System.out.println(javademo.CONNECTSTRING);

        try {
            //STEP 2: Register JDBC driver
            Class.forName("org.mariadb.jdbc.Driver");

            //STEP 3: Open a connection
            System.out.println("Connecting to a selected database...");
            conn = DriverManager.getConnection(CONNECTSTRING);

            System.out.println("Connected database successfully...");

            //STEP 4: Execute a queries
            ////Create Table
            System.out.println("Creating table if not exists...");
            stmt = conn.createStatement();

            String sql = "CREATE TABLE IF NOT EXISTS javatest"
                    + "(id INT NOT NULL AUTO_INCREMENT PRIMARY KEY, "
                    + " source VARCHAR(20), "
                    + " tstamp TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP); ";

            stmt.executeUpdate(sql);

            ////Insert Records
            System.out.println("Inserting Record...");
            String sql2 = "INSERT INTO javatest VALUES (NULL,'javatest script', NULL)";

            stmt.executeUpdate(sql2);

            ////Select From Table
            String query = "SELECT id, source, tstamp FROM javatest";
            ResultSet rs = stmt.executeQuery(query);

            ////Display Results
            while (rs.next())
            {
             int id = rs.getInt("id");
             String source = rs.getString("source");
             Timestamp tstamp = rs.getTimestamp("tstamp");
             System.out.format("%s, %s, %s \n", id, source, tstamp);
            }
            stmt.close();


        } catch (SQLException se) {
            //Handle errors for JDBC
            se.printStackTrace();
        } catch (Exception e) {
            //Handle errors for Class.forName
            e.printStackTrace();
        } finally {
            //finally block used to close resources
            try {
                if (stmt != null) {
                    conn.close();
                }
            } catch (SQLException se) {
            }// do nothing
            try {
                if (conn != null) {
                    conn.close();
                }
            } catch (SQLException se) {
                se.printStackTrace();
            }//end finally try
        }//end try
        System.out.println("Goodbye!");
    }//end main
}//end JDBCExample

