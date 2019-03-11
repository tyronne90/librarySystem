package com.sgc.data;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

import com.sgc.model.SubClassification;

public class SubClassificationDAO {
	 private static Connection con;

	    public static int AddSubClassification(SubClassification subclass) throws SQLException {
	        int status = 0;
	        try {
	            con = DatabaseConnection.getConnection();
	            String addSubClassification = "INSERT INTO subclassification (subclass,mainclass) VALUES (?,?)";
	            PreparedStatement ps = con.prepareStatement(addSubClassification);
	            ps.setString(1, subclass.getSubClass());
	            ps.setString(2, subclass.getMainClass());
	            status = ps.executeUpdate();      
	        } catch (SQLException ex) {
	            Logger.getLogger(DatabaseConnection.class.getName()).log(Level.SEVERE, null, ex);
	        } finally {
	            DatabaseConnection.closeConnection();
	        }
	        return status;
	    }

	    public static List<SubClassification> viewSubClassification() throws SQLException {
	        List<SubClassification> subclasses = new ArrayList<>();
	        try {
	            con = DatabaseConnection.getConnection();
	            String viewSubClassification = "SELECT * FROM subclassification";
	            PreparedStatement ps = con.prepareStatement(viewSubClassification);
	            ResultSet rs = ps.executeQuery();
	            while (rs.next()) {
	                SubClassification subclass = new SubClassification();
	                subclass.setId(rs.getInt(1));
	                subclass.setSubClass(rs.getString(2));
	                subclass.setMainClass(rs.getString(3));
	                subclasses.add(subclass);
	            }
	        } catch (SQLException ex) {
	            Logger.getLogger(BooksDAO.class.getName()).log(Level.SEVERE, null, ex);
	        } finally {
	            DatabaseConnection.closeConnection();
	        }
	        return subclasses;
	    }
	       
	    public static List<SubClassification> viewSubClassification(SubClassification mainclass) throws SQLException {
	        List<SubClassification> subclasses = new ArrayList<>();
	        try {
	            con = DatabaseConnection.getConnection();
	            String viewSubClassification = "SELECT * FROM subclassification WHERE mainclass=?";
	            PreparedStatement ps = con.prepareStatement(viewSubClassification);
	            ps.setString(1, mainclass.getMainClass());
	            ResultSet rs = ps.executeQuery();
	            while (rs.next()) {
	                SubClassification subclass = new SubClassification();
	                subclass.setSubClass(rs.getString(2));
	                subclasses.add(subclass);
	            }
	         } catch (SQLException ex) {
	            Logger.getLogger(BooksDAO.class.getName()).log(Level.SEVERE, null, ex);
	        } finally {
	            DatabaseConnection.closeConnection();
	        }
	        return subclasses;
	    }
	    
	    public static SubClassification searchOneSubClassification(String mainClassName){  
	        SubClassification subclasses = new SubClassification();
	          
	        try{  
	            con = DatabaseConnection.getConnection();
	            String viewSubClassification = "SELECT subclass FROM subclassification WHERE mainclass=?";
	            PreparedStatement ps = con.prepareStatement(viewSubClassification);
	            ps.setString(1,mainClassName);  
	            ResultSet rs=ps.executeQuery();  
	            if(rs.next()){  
	                subclasses.setSubClass(rs.getString(2));
	            }  
	            con.close();  
	        }catch(Exception ex){ex.printStackTrace();}  
	          
	        return subclasses;  
	    }  
	    
	    public static int deleteSubClassification(int id) throws SQLException{
	      int status = 0;
	       con = DatabaseConnection.getConnection();
	       String deleteSubClassification = "DELETE FROM subclassification WHERE id=?";
	       PreparedStatement ps=con.prepareStatement(deleteSubClassification);
	       ps.setInt(1,id);
	       status = ps.executeUpdate();
	       con.close();
	       return status;
	    }
	    
	    
	    public static int UpdateSubClassification(SubClassification subclass) throws SQLException {
	        int status = 0;
	        try {
	            con = DatabaseConnection.getConnection();
	            String updateSubClassification = "UPDATE subclassification SET subclass=?, mainclass=? WHERE id=?";
	            PreparedStatement ps = con.prepareStatement(updateSubClassification);
	            ps.setString(1, subclass.getSubClass());
	            ps.setString(2, subclass.getMainClass());
	            ps.setInt(3, subclass.getId());
	            status = ps.executeUpdate();
	            Logger.getLogger(DatabaseConnection.class.getName()).log(Level.SEVERE, null, ps.toString());

	        } catch (SQLException ex) {
	            Logger.getLogger(DatabaseConnection.class.getName()).log(Level.SEVERE, null, ex);
	        }
	        finally{DatabaseConnection.closeConnection();}
	        return status;
	    }
	    
	    
}
