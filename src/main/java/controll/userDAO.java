package controll;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;


import model.*;

public class userDAO {
        
    private Connection conn ;
	private String url = "jdbc:mysql://localhost:3306/quan_ly_dan_cu";
	private String user = "root";
	private String password = "";
       public userDAO(){
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			conn = DriverManager.getConnection(url 
					+ "?useUnicode=true&characterEncoding=utf-8", user, password);
		} catch (Exception e) {
			e.printStackTrace();
		
		}
       }
       
       public boolean addTempAccount(int id, String userName, String pass)
       {
            String sql = "INSERT INTO tempaccount(id, username, password) VALUES(?,?,?)";
            try {
                PreparedStatement ps = conn.prepareStatement(sql);
                ps.setInt(1, id);
                ps.setString(2,userName);
                ps.setString(3,pass);
                return ps.executeUpdate()>0;
            
            } catch (Exception e) {
                e.printStackTrace();
            }
            return false;
       }
       public boolean addPerson(person s){
           String sql= "INSERT INTO person(id,name,cccd,dob,hometown,nation,job,phone,shk) VALUES(?,?,?,?,?,?,?,?,?)";
           try {
               PreparedStatement ps =conn.prepareStatement(sql);
               ps.setInt(1,s.getID());
               ps.setString(2,s.getName());
               ps.setString(3,s.getCCCD());
               ps.setDate(4, new java.sql.Date(s.getDob().getTime()));
               ps.setString(5, s.getHomeTown());
               ps.setString(6, s.getNation());
               ps.setString(7, s.getJob());
               ps.setString(8, s.getPhone());
               ps.setString(9, s.getShk());
               
               return ps.executeUpdate()>0;
           } catch (Exception e) {
               e.printStackTrace();
           }
           return false;
       }
       public boolean addTempPerson(person s){
           String sql= "INSERT INTO tempperson(id,name,cccd,dob,hometown,nation,job,phone,shk) VALUES(?,?,?,?,?,?,?,?,?)";
           try {
               PreparedStatement ps =conn.prepareStatement(sql);
               ps.setInt(1,s.getID());
               ps.setString(2,s.getName());
               ps.setString(3,s.getCCCD());
               ps.setDate(4, new java.sql.Date(s.getDob().getTime()));
               ps.setString(5, s.getHomeTown());
               ps.setString(6, s.getNation());
               ps.setString(7, s.getJob());
               ps.setString(8, s.getPhone());
               ps.setString(9, s.getShk());
               return ps.executeUpdate()>0;
           } catch (Exception e) {
               e.printStackTrace();
           }
           return false;
       }
       public int checkLogin(String username ,String password){
           String sql =" SELECT * FROM `account` WHERE `username` = ? AND `password` = ? ";
           try {
               PreparedStatement ps =conn.prepareStatement(sql);
               
               ps.setString(1, username);
               ps.setString(2, password);
               ResultSet rs= ps.executeQuery();
               while(rs.next()){
                    return rs.getInt("id");
               }
              
           } catch (Exception e) {
               e.printStackTrace();
           }
           return -1;
       }
       public boolean isValidUsername(String username){
           String sql =" SELECT * FROM `account` WHERE `username` = ?";
           try {
               PreparedStatement ps = conn.prepareStatement(sql);
               
               ps.setString(1, username);
               ResultSet rs= ps.executeQuery();
               while(rs.next()){
                    return true;
               }
              
           } catch (Exception e) {
               e.printStackTrace();
           }
           return false;
       }
       public person getPersonByID(int id) {
    	   String sql= "select * from person WHERE id=?";
    	   person s = new person();
    	   try {
    		   PreparedStatement ps = conn.prepareStatement(sql);
    		   ps.setInt(1, id);
    		   ResultSet rs = ps.executeQuery();
    		   while (rs.next()) {
    			   s.setID(Integer.parseInt(rs.getString("id")));
    			   s.setName(rs.getString("name"));
    			   s.setCCCD(rs.getString("cccd"));
    			   s.setDob(rs.getDate("dob"));
    			   s.setHomeTown(rs.getString("hometown"));
    			   s.setJob(rs.getString("job"));
    			   s.setNation(rs.getString("nation"));
    			   s.setPhone(rs.getString("phone"));
    			   s.setShk(rs.getString("shk")); 
    		   }
    	   } catch (Exception e) {
    		   e.printStackTrace();
    	   }
    	   return s;
       }
       public person getTempPersonByID(int id) {
    	   String sql= "select * from tempperson WHERE id=?";
    	   person s = new person();
    	   try {
    		   PreparedStatement ps = conn.prepareStatement(sql);
    		   ps.setInt(1, id);
    		   ResultSet rs = ps.executeQuery();
    		   while (rs.next()) {
    			   s.setID(Integer.parseInt(rs.getString("id")));
    			   s.setName(rs.getString("name"));
    			   s.setCCCD(rs.getString("cccd"));
    			   s.setDob(rs.getDate("dob"));
    			   s.setHomeTown(rs.getString("hometown"));
    			   s.setJob(rs.getString("job"));
    			   s.setNation(rs.getString("nation"));
    			   s.setPhone(rs.getString("phone"));
    			   s.setShk(rs.getString("shk")); 
    		   }
    	   } catch (Exception e) {
    		   e.printStackTrace();
    	   }
    	   return s;
       }
       public boolean editPerson(person s){
           String sql= "UPDATE person SET name=?, cccd=?, dob=?, hometown=?, nation=?,"
        		   +"job=?, phone=?, shk=? WHERE id=?";
           try {
               PreparedStatement ps =conn.prepareStatement(sql);
               ps.setString(1,s.getName());
               ps.setString(2,s.getCCCD());
               ps.setDate(3, new java.sql.Date(s.getDob().getTime()));
               ps.setString(4, s.getHomeTown());
               ps.setString(5, s.getNation());
               ps.setString(6, s.getJob());
               ps.setString(7, s.getPhone());
               ps.setString(8, s.getShk());
               ps.setInt(9, s.getID());
               
               return ps.executeUpdate()>0;
           } catch (Exception e) {
               e.printStackTrace();
           }
           return false;
       }
       public boolean addTachKhauRequest(hokhau s) 
       {
    	   	String sql = "INSERT INTO yeucautachkhau(shk, id_chuho, diachi) VALUES (?, ?, ?)";
			try {
				PreparedStatement ps =conn.prepareStatement(sql);
				ps.setString(1, s.getShk());
				ps.setInt(2, s.getId_chuho());
				ps.setString(3, s.getDiachi());

				return ps.executeUpdate()>0;
			} catch (Exception e) {
				e.printStackTrace();
			}
			return false;
       }
}