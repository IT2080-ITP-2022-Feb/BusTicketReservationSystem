package com.btrs.agencyRegistration;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import DBconnection.DatabaseConnection;

public class AgencyDatabaseUtil {
	
	private static Connection con = null;
	private static Statement stmt = null;
	private static ResultSet rs = null;
//	
//	
//	public static List<AgencyDetails> checkExistData(String userName, String password){
//	
//		ArrayList<AgencyDetails> AgDetail = new ArrayList<>();
//		
//		//Validation of data
//		try {
//			con = DatabaseConnection.initializeDatabase();
//			stmt = con.createStatement();
//			String sql = "SELECT * FROM agency WHERE username ='"+userName+"'and password ='"+password+"'";
//			rs = stmt.executeQuery(sql);
//			
//			 //IF condition goes here
//		}
//		catch(Exception e) {
//			e.printStackTrace();
//		}
//		
//		return AgDetail;
//	}
	
	
// Inserting data into the data base
	public static String insertAgencyDetails(String agentNIC, String agentName, String companyName, String agentPhone,String agentEmail, String agencyLocation, String password, String confirmPassword, String username) 
	{
		String status = "0";
		try {
			con = DatabaseConnection.initializeDatabase();
			stmt = con.createStatement();
			String sql1 = "SELECT * FROM obtrs.agency WHERE username ='"+username+"'OR agentEmail = '"+agentEmail+"'";
			rs = stmt.executeQuery(sql1);
			
			//Check if password match with confirm password
			if(!(password.equals(confirmPassword))) {
				status = "password";
				return status;
			}
			
			//Check if username or email already exist or not
			if(rs.next()) {
				String checkUsername = rs.getString("username");
				String checkAgentEmail = rs.getString("agentEmail");
				if(checkUsername.equals(username) || checkAgentEmail.equals(agentEmail) ) {
					status = "username";
					return status;
				}
			}
			
			//This will insert entered data into the database
			String sql2 = "Insert into agency values (0 , '"+agentNIC+"', '"+agentName+"', '"+companyName+"', '"+agentPhone+"', '"+agentEmail+"', '"+agencyLocation+"', '"+password+"', '"+confirmPassword+"','"+username+"')";
			int rs2 = stmt.executeUpdate(sql2);

			if(rs2 > 0) {
				status = "1";
			}else {
				status = "0";
			}
		}
		catch(Exception e){
			e.printStackTrace();
		}
		return status;
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
 