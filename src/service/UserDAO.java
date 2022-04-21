package service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import model.UserDTO;

public class UserDAO {

	private DataSource dataFactory;
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	public UserDAO() {
		
		try {
			Context ctx = new InitialContext();
			dataFactory = (DataSource) ctx.lookup("java:/comp/env/jdbc/jspProject");
			conn = dataFactory.getConnection();
		} catch (NamingException | SQLException e) {
			e.printStackTrace();
		}	
	}
	
	public void dbClose() {
		if (rs != null) {
			try {
				rs.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		
		if (pstmt != null) {
			try {
				pstmt.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
		if (conn != null) {
			try {
				conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}
	
	public int login(String user_id, String user_pw) {
		
		String sql = "SELECT * from userTBL where uerID = ? and userPW = ?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, user_id);
			pstmt.setString(2, user_pw);
			rs = pstmt.executeQuery();
			
			if (rs.next()) {
				return 1;
			} else {
				return 0;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			dbClose();
		}

		return -9999;
		
	}

	public String userInsert (String user_id, String user_pw) {
		
		String sql = "INSERT INTO userTBL (uerID, userPW) VALUES(?, ?)";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, user_id);
			pstmt.setString(2, user_pw);
			int result = pstmt.executeUpdate();
			
			if (result == 1) {
				System.out.println("userInsert() 작동 완료. ");
				return "success";				
			} else {
				return "fail";
			}
			
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			dbClose();
		}
		return null;
	}
	
	
	public String idCheck (String user_id) {
		
		String sql = "SELECT uerID FROM userTBL where uerID = ?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, user_id);
			rs = pstmt.executeQuery();
			
			if (rs.next()) {
				return "Duplicate";
			} else {
				return "Available";
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			dbClose();
		}
		return null;
	}
	
	public List<UserDTO> userList() {
		
		List<UserDTO> list = new ArrayList<UserDTO>();
		
		String sql = "select * from userTBL";
		
		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				UserDTO dto = new UserDTO();
				dto.setuNo(rs.getInt("uNo"));
				dto.setUerID(rs.getString("uerID"));
				dto.setUserPW(rs.getString("userPW"));
				dto.setUserRegeDate(rs.getTimestamp("userRegeDate"));
				
				list.add(dto);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			dbClose();
		}
		
		return list;
	}
	
	public UserDTO userListView (String uerID) {
		
		UserDTO dto = new UserDTO();
		
		String sql = "SELECT * from userTBL where uerID = ?";

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, uerID);
			rs = pstmt.executeQuery();
			
			if (rs.next()) {
				dto.setuNo(rs.getInt("uNo"));
				dto.setUerID(rs.getString("uerID"));
				dto.setUserPW(rs.getString("userPW"));
				dto.setUserRegeDate(rs.getTimestamp("userRegeDate"));
				
				return dto;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			dbClose();
		}
		return dto;
	}
	
	public void userUpdate(String userPW, String uerID) {
		
		String sql = "update userTBL set userPW = ? WHERE uerID = ?";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userPW);
			pstmt.setString(2, uerID);
			pstmt.executeUpdate();
			dbClose();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			dbClose();
		}
	}
	
	public void userDelete(String uerID) {
		System.out.println("uerID 값 확인 : " + uerID);
		
		String sql = "DELETE FROM userTBL WHERE uerID=?";
		
		try {
			System.out.println("11111111111");
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, uerID);
			System.out.println("222222222222222");
			pstmt.executeUpdate();
			dbClose();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			dbClose();
		}
	}
}
