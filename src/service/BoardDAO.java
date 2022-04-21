package service;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
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

import model.BoardDTO;

public class BoardDAO {

	private DataSource dataFactory;
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	public BoardDAO() {
		
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
	
	public void boardInsert(String bTitle, String bContent, String bWriter) {
		
		String sql = "INSERT INTO boardTBL (bTitle, bContent, bWriter) VALUES(?, ?, ?)";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, bTitle);
			pstmt.setString(2, bContent);
			pstmt.setString(3, bWriter);
			pstmt.executeUpdate();
			System.out.println("boardInsert() 작동 완료.");
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			dbClose();
		}
	}
	
	public List<BoardDTO> boardSelect () {
		
		List<BoardDTO> list = new ArrayList<BoardDTO>();
		
		String sql = "SELECT * FROM boardTBL order by bNo DESC";
		
		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				BoardDTO dto = new BoardDTO();
				dto.setbNo(rs.getInt("bNo"));
				dto.setbTitle(rs.getString("bTitle"));
				dto.setbContent(rs.getString("bContent"));
				dto.setbWriter(rs.getString("bWriter"));
				dto.setbRegData(rs.getTimestamp("bRegData"));
				
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
	
	public BoardDTO boardSelectView(String bNo) {
		
		BoardDTO dto = new BoardDTO();
		
		String sql = "SELECT * FROM boardTBL where bNo = ?";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, Integer.parseInt(bNo));
			rs = pstmt.executeQuery();
			
			if (rs.next()) {
				dto.setbNo(rs.getInt("bNo"));
				dto.setbTitle(rs.getString("bTitle"));
				dto.setbContent(rs.getString("bContent"));
				dto.setbWriter(rs.getString("bWriter"));
				dto.setbRegData(rs.getTimestamp("bRegData"));
				
				return dto;
			}			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			dbClose();
		}
		return dto;
	}
	
	public BoardDTO boardDelete (String bNo) {
		
		String sql = "DELETE FROM boardTBL WHERE bNo = ?";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, bNo);
			pstmt.executeUpdate();
			dbClose();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			dbClose();
		}
		
		return null;
	}
	
	public void boardUpdate(String bTitle, String bContent, String bNo) {
		
		String sql = "UPDATE boardTBL SET bTitle = ?, bContent = ? WHERE bNo = ?";
		
		try {
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, bTitle);
			pstmt.setString(2, bContent);
			pstmt.setString(3, bNo);
			pstmt.executeUpdate();
			dbClose();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			dbClose();
		}
		
	}
	
	public void upload(File file) {
	      String sql = "insert into imgTBL(img) values(?)";
	      try {
	         FileInputStream fis = new FileInputStream(file);
	         pstmt = conn.prepareStatement(sql);
	         pstmt.setBinaryStream(1, fis);
	         pstmt.executeUpdate();
	         dbClose();
	      } catch (Exception e) {
	         // TODO Auto-generated catch block
	         e.printStackTrace();
	      }
	   }

}
