package com.sgc.data;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

public class DatabaseConnection {

	private static Connection con;

    public static Connection getConnection() {

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3307/librarysystem", "root", "root");
            Logger.getLogger(DatabaseConnection.class.getName()).log(Level.INFO,"connection success");
        } catch (SQLException | ClassNotFoundException ex) {
            Logger.getLogger(DatabaseConnection.class.getName()).log(Level.SEVERE, null, ex);
        }
        return con;
    }

    public static void closeConnection() throws SQLException {
        if (con != null) {
            con.close();
        }
    }
    
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		System.out.print(getConnection());
	}

}
