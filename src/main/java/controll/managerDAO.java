package controll;

import java.util.ArrayList;
import java.sql.*;
import model.*;

public class managerDAO {
        
    private Connection conn ;
	private String url = "jdbc:mysql://localhost:3306/quan_ly_dan_cu";
	private String user = "root";
	private String password = "";
	public managerDAO(){
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			conn = DriverManager.getConnection(url 
					+ "?useUnicode=true&characterEncoding=utf-8", user, password);
		} catch (Exception e) {
			e.printStackTrace();
		
		}
	}
	public boolean addHoKhau(hokhau s)
	{
		String sql = "INSERT INTO shk (shk, id_chuho, diachi) VALUES (?, ?, ?);";
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

	public ArrayList<person> getList() {
		ArrayList<person> list = new ArrayList<person>();
		String sql = "SELECT * FROM person";
		
		try {
			Statement statement= conn.createStatement();
			ResultSet rs = statement.executeQuery(sql);
			while (rs.next()) {
				person s = new person();
				s.setID(rs.getInt("id"));
				s.setName(rs.getString("name"));
				s.setCCCD(rs.getString("cccd"));
				s.setDob(rs.getDate("dob"));
				s.setHomeTown(rs.getString("hometown"));
				s.setNation(rs.getString("nation"));
				s.setJob(rs.getString("job"));
				s.setShk(rs.getString("shk"));
				s.setPhone(rs.getString("phone"));
				
				list.add(s);
			}
		} catch (Exception e) {
			System.out.println("Oops, loi cmnr");
			e.printStackTrace();
		}
		return list;
	}
	public ArrayList<hokhau> getShkList() {
		ArrayList<hokhau> list = new ArrayList<hokhau>();
		String sql = "SELECT * FROM shk";
		
		try {
			Statement statement= conn.createStatement();
			ResultSet rs = statement.executeQuery(sql);
			while (rs.next()) {
				hokhau s = new hokhau();
				s.setDiachi(rs.getString("diachi"));
				s.setId_chuho(rs.getInt("id_chuho"));
				s.setShk(rs.getString("shk"));
				s.setCount(rs.getInt("count"));
				
				list.add(s);
			}
		} catch (Exception e) {
			System.out.println("Oops, loi cmnr");
			e.printStackTrace();
		}
		return list;
	}
	public boolean removePersonById(int id) {
		String sql = "DELETE FROM person WHERE id =?";
        try {
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, id);
            return ps.executeUpdate()>0;
        
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
	}
	public ArrayList<person> getRegisterRequest() 
	{
		ArrayList<person> list = new ArrayList<person>();
		String sql = "SELECT * FROM tempaccount";
		
		try {
			Statement statement= conn.createStatement();
			ResultSet rs = statement.executeQuery(sql);
			while (rs.next()) {
				int id = rs.getInt("id");
				person s = new userDAO().getTempPersonByID(id);		
				list.add(s);
			}
		} catch (Exception e) {
			System.out.println("Oops, loi cmnr");
			e.printStackTrace();
		}
		return list;
	}
	public ArrayList<person> getTachKhauRequest() 
	{
		ArrayList<person> list = new ArrayList<person>();
		String sql = "SELECT * FROM yeucautachkhau";
		
		try {
			Statement statement= conn.createStatement();
			ResultSet rs = statement.executeQuery(sql);
			while (rs.next()) {
				int id = rs.getInt("id_chuho");
				person s = new userDAO().getPersonByID(id);		
				list.add(s);
			}
		} catch (Exception e) {
			System.out.println("Oops, loi cmnr");
			e.printStackTrace();
		}
		return list;
	}
	public boolean addAccount(int id, String userName, String pass)
    {
         String sql = "INSERT INTO account(id, username, password) VALUES(?,?,?)";
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
	public boolean removeTempAccount(int id) {
		String sql = "DELETE FROM tempaccount WHERE id =?";
        try {
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, id);
            return ps.executeUpdate()>0;
        
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
	}
	public boolean removeTempPerson(int id) {
		String sql = "DELETE FROM tempperson WHERE id =?";
        try {
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, id);
            return ps.executeUpdate()>0;
        
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
	}
	public boolean addPersonFromTemp(int id){
        String sql= "INSERT INTO person(id,name,cccd,dob,hometown,nation,job,phone,shk)"
        		+ "SELECT id, name, cccd, dob, hometown, nation, job, phone, shk FROM tempperson WHERE id=?";
        try {
            PreparedStatement ps =conn.prepareStatement(sql);
            ps.setInt(1, id);
            
            return ps.executeUpdate()>0;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }
	public boolean addAccountFromTemp(int id){
        String sql= "INSERT INTO account(id, username, password)"
        		+ "SELECT id, username, password FROM tempaccount WHERE id=?";
        try {
            PreparedStatement ps =conn.prepareStatement(sql);
            ps.setInt(1, id);
            
            return ps.executeUpdate()>0;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }
	public boolean removeTachKhauRequest(int id) {
		String sql = "DELETE FROM yeucautachkhau WHERE id_chuho =?";
        try {
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, id);
            return ps.executeUpdate()>0;
        
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
	}
	
	 public hokhau getTachKhauByID(int id) {
  	   String sql= "select * from yeucautachkhau WHERE id_chuho=?";
  	   hokhau s = new hokhau();
  	   try {
  		   PreparedStatement ps = conn.prepareStatement(sql);
  		   ps.setInt(1, id);
  		   ResultSet rs = ps.executeQuery();
  		   while (rs.next()) {
  			   s.setShk(rs.getString("shk"));
  			   s.setDiachi(rs.getString("diachi"));
  			   s.setId_chuho(rs.getInt("id_chuho"));
  		   }
  	   } catch (Exception e) {
  		   e.printStackTrace();
  	   }
  	   return s;
     }
}