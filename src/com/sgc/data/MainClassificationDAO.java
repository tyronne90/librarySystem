package com.sgc.data;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

import com.sgc.model.MainClassification;

public class MainClassificationDAO {
	private static Connection con;

    public static int AddMainClassification(MainClassification mainclass) throws SQLException {
        int status = 0;
        try {
            con = DatabaseConnection.getConnection();
            String addMainClassification = "INSERT INTO mainclassification (mainclass) VALUES (?)";
            PreparedStatement ps = con.prepareStatement(addMainClassification);
            ps.setString(1, mainclass.getMainClass());
            status = ps.executeUpdate();      
        } catch (SQLException ex) {
            Logger.getLogger(DatabaseConnection.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            DatabaseConnection.closeConnection();
        }
        return status;
    }

    public static List<MainClassification> viewMainClassification() throws SQLException {
        List<MainClassification> mainclasses = new ArrayList<>();
        try {
            con = DatabaseConnection.getConnection();
            String viewMainClassification = "SELECT * FROM mainclassification";
            PreparedStatement ps = con.prepareStatement(viewMainClassification);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                MainClassification mainclass = new MainClassification();
                mainclass.setId(rs.getInt(1));
                mainclass.setMainClass(rs.getString(2));
                mainclasses.add(mainclass);
            }
        } catch (SQLException ex) {
            Logger.getLogger(BooksDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            DatabaseConnection.closeConnection();
        }
        return mainclasses;
    }
    
    public static int deleteMainClassification(int id) throws SQLException{
      int status = 0;
       con = DatabaseConnection.getConnection();
       String deleteMainClassification = "DELETE FROM mainclassification WHERE id=?";
       PreparedStatement ps=con.prepareStatement(deleteMainClassification);
       ps.setInt(1,id);
       status = ps.executeUpdate();
       con.close();
       return status;
    }
     
    public static int UpdateMainClassification(MainClassification mainclass) throws SQLException {
        int status = 0;
        try {
            con = DatabaseConnection.getConnection();
            String updateMainClassification = "UPDATE mainclassification SET mainclass=? WHERE id=?";
            PreparedStatement ps = con.prepareStatement(updateMainClassification);
            ps.setString(1, mainclass.getMainClass());
            ps.setInt(2, mainclass.getId());
            status = ps.executeUpdate();
            Logger.getLogger(DatabaseConnection.class.getName()).log(Level.SEVERE, null, ps.toString());

        } catch (SQLException ex) {
            Logger.getLogger(DatabaseConnection.class.getName()).log(Level.SEVERE, null, ex);
        }
        finally{DatabaseConnection.closeConnection();}
        return status;
    }
    
}
