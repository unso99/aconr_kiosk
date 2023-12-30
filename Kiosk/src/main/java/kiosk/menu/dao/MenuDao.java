package kiosk.menu.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import kiosk.menu.dto.CategoryDto;
import kiosk.menu.dto.UpdateMenuDto;
import kiosk.menu.dto.MenuDto;
import kiosk.util.DbcpBean;

public class MenuDao {
	private static MenuDao dao;
	
	private MenuDao() {}
	
	public static MenuDao getInstance() {
		if(dao==null) {
			dao=new MenuDao();
		}
		
		return dao;
	}
	//카테고리별 메뉴리스트 가져오기
	public List<MenuDto> getList(CategoryDto cDto){
		List<MenuDto> list=new ArrayList<MenuDto>();
		
		Connection conn = null; // oracle scott 사용자 접속에 필요한 참조값 공간확보 
		PreparedStatement pstmt = null; // sql문을 대신 실행해줄 preparedStatement 객체의 참조값 공간확보 
		ResultSet rs = null; // DB 결과 값을 얻어내기 위한 공간확보 
		try {
			
			conn = new DbcpBean().getConn();
			String sql = "select sto_num, name, price, description, imageUrl, sell, category"
					+ " from menu_info"
					+ " where sto_num = ? and category = ?";
			pstmt = conn.prepareStatement(sql);
			//? 에 바인딩할 내용이 있으면 여기서 한다.
			pstmt.setString(1, cDto.getStoNum());
			pstmt.setString(2, cDto.getCategory());

			//query 문 수행하고 결과(ResultSet) 얻어내기
			rs = pstmt.executeQuery();
			
			//반복문 돌면서 
			while (rs.next()) {
				MenuDto dto=new MenuDto();
				dto.setStoNum(cDto.getStoNum());
				dto.setName(rs.getString("name"));
				dto.setPrice(rs.getInt("price"));
				dto.setDescription(rs.getString("description"));
				dto.setImageUrl(rs.getString("imageUrl"));
				dto.setSell(rs.getString("sell"));
				dto.setCategory(cDto.getCategory());
				list.add(dto);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close(); //Connection 객체의 close() 메소드를 호출하면 Pool 에 반납된다.
			} catch (Exception e) {
			}
		}
		return list;
	}
	
	//카테고리 리스트 가져오기
	public List<CategoryDto> getCategory(String stoNum){
		List<CategoryDto> list=new ArrayList<CategoryDto>();
		 
		Connection conn = null; // oracle scott 사용자 접속에 필요한 참조값 공간확보 
		PreparedStatement pstmt = null; // sql문을 대신 실행해줄 preparedStatement 객체의 참조값 공간확보 
		ResultSet rs = null; // DB 결과 값을 얻어내기 위한 공간확보 
		
		
		try {
			conn = new DbcpBean().getConn();
			String sql = "SELECT distinct category" // distinct: 데이터 중복방지
					+ " FROM menu_info"
					+ " WHERE sto_num = ?"; // 로그인한 사장님의 번호를 사용하여 설정한 카테고리를 가져온다.
			pstmt = conn.prepareStatement(sql);
			//? 에 바인딩할 내용이 있으면 여기서 한다.
			pstmt.setString(1, stoNum);

			//query 문 수행하고 결과(ResultSet) 얻어내기
			rs = pstmt.executeQuery();
			
			//반복문 돌면서 
			while (rs.next()) {
				CategoryDto dto=new CategoryDto();
				dto.setStoNum(stoNum);
				dto.setCategory(rs.getString("category"));
				list.add(dto);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close(); //Connection 객체의 close() 메소드를 호출하면 Pool 에 반납된다.
			} catch (Exception e) {
			}
		}
		
		return list;
	}
	
	//상품 등록
	public boolean insert(MenuDto dto) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		int rowCount = 0;
		
		try {
			conn = new DbcpBean().getConn();
			//실행할 sql 문
			String sql = "INSERT INTO menu_info"
		               + " (sto_num,name,price,description,imageUrl,sell,category)"
		               + " values(?,?,?,?,?,'NO',?)";
			pstmt = conn.prepareStatement(sql);
			
			//? 에 바인딩 할 내용이 있으면 바인딩
			pstmt.setString(1,dto.getStoNum());
			pstmt.setString(2, dto.getName());
			pstmt.setInt(3, dto.getPrice());
			pstmt.setString(4,dto.getDescription() );
			pstmt.setString(5,dto.getImageUrl());
			pstmt.setString(6, dto.getCategory());

			rowCount = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close();
			} catch (Exception e) {
			}
		}
		if (rowCount > 0) {
			return true;
		} else {
			return false;
		}
	}
	
	//상품삭제하기 name과 stoNum으로 수정해야한다.
	public boolean delete(String name) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		int rowCount = 0;
		try {
			conn = new DbcpBean().getConn();
			//실행할 sql 문
			String sql = "DELETE FROM menu_info"
		               + " WHERE name=?";
			pstmt = conn.prepareStatement(sql);
			//? 에 바인딩 할 내용이 있으면 바인딩
			pstmt.setString(1, name);

			rowCount = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close();
			} catch (Exception e) {
			}
		}
		if (rowCount > 0) {
			return true;
		} else {
			return false;
		}
	}
	
	//상품수정하기 sto_num과 name으로 찾아야됨
	public boolean update(MenuDto dto) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		int rowCount = 0;
		try {
			conn = new DbcpBean().getConn();
			System.out.println(dto.getDescription());
			//실행할 sql 문
			 String sql = "UPDATE menu_info"
		               + " SET price=?,description=?,imageurl=?,category=?,sell=?"
		               + " WHERE name=? and sto_num=?";
			pstmt = conn.prepareStatement(sql);
			//? 에 바인딩 할 내용이 있으면 바인딩
			pstmt.setInt(1, dto.getPrice());
			pstmt.setString(2, dto.getDescription());
			pstmt.setString(3, dto.getImageUrl());
			pstmt.setString(4, dto.getCategory());
			pstmt.setString(5, dto.getSell());
			pstmt.setString(6, dto.getName());
			pstmt.setString(7, dto.getStoNum());
			rowCount = pstmt.executeUpdate();
//			rowCount = pstmt.execute() ? 1 : 0;
			conn.commit();
			System.out.println(rowCount);
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("fail1");
			
		} finally {
			try {
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close();
			} catch (Exception e) {
				System.out.println("fail2");
				
			}
		}
		if (rowCount > 0) {
			return true;
		} else {
			System.out.println("fail3");
			return false;
			
		}
	}
	
	//상품정보 하나 가져오기
	public MenuDto getdata(UpdateMenuDto udto) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		MenuDto dto=null;
		
		try {
			conn = new DbcpBean().getConn();
			//실행할 sql 문
			String sql = "SELECT *"
					+ " FROM menu_info"
					+ " WHERE name=? and sto_num=?";
			pstmt = conn.prepareStatement(sql);
			//? 에 바인딩할 내용이 있으면 여기서 한다.
			

			pstmt.setString(1, udto.getName());
			pstmt.setString(2, udto.getStoNum());
			


			//query 문 수행하고 결과(ResultSet) 얻어내기
			rs = pstmt.executeQuery();
			//상품정보가 담긴 Dto를 하나 만들어봅시다 
			if (rs.next()) {
				dto=new MenuDto();
				//dto.setStoNum(stoNum);
				dto.setStoNum(rs.getString("sto_num"));
				dto.setName(rs.getString("name"));
				dto.setPrice(rs.getInt("price"));
				dto.setDescription(rs.getString("description"));
				dto.setImageUrl(rs.getString("imageUrl"));
				dto.setSell(rs.getString("sell"));
				dto.setCategory(rs.getString("category"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close(); //Connection 객체의 close() 메소드를 호출하면 Pool 에 반납된다.
			} catch (Exception e) {
			}
		}
		return dto;
	}
	//상품 이름 가져오기
	public String getName(String name) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String inValidname=null;
		
		try {
			conn = new DbcpBean().getConn();
			//실행할 sql 문
			String sql = "SELECT name"
					+ " FROM menu_info"
					+ " WHERE name=?";
			pstmt = conn.prepareStatement(sql);
			//? 에 바인딩할 내용이 있으면 여기서 한다.
			

			pstmt.setString(1, name);
			
			


			//query 문 수행하고 결과(ResultSet) 얻어내기
			rs = pstmt.executeQuery();
			//상품정보가 담긴 Dto를 하나 만들어봅시다 
			if (rs.next()) {
				inValidname= name;
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close(); //Connection 객체의 close() 메소드를 호출하면 Pool 에 반납된다.
			} catch (Exception e) {
			}
		}
		return inValidname;
	}
	//상품목록 전체 가져오기 ? 아직 사용할지는 미정
	public List<MenuDto> getList(){
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<MenuDto> list=new ArrayList<MenuDto>();
		try {
			conn = new DbcpBean().getConn();
			//실행할 sql 문
			String sql = "SELECT *"
					+ " FROM menu_info";
					//+ "	ORDER BY NLSSORT(name, 'NLS_SORT=KOREAN')";
					
			pstmt = conn.prepareStatement(sql);
			//? 에 바인딩할 내용이 있으면 여기서 한다.

			//query 문 수행하고 결과(ResultSet) 얻어내기
			rs = pstmt.executeQuery();
			//반복문 돌면서 
			while (rs.next()) {
				MenuDto dto=new MenuDto();
				dto.setStoNum(rs.getString("sto_num"));
				dto.setName(rs.getString("name"));
				dto.setPrice(rs.getInt("price"));
				dto.setDescription(rs.getString("description"));
				dto.setImageUrl(rs.getString("imageUrl"));
				dto.setSell(rs.getString("sell"));
				dto.setCategory(rs.getString("category"));
				list.add(dto);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close(); //Connection 객체의 close() 메소드를 호출하면 Pool 에 반납된다.
			} catch (Exception e) {
			}
		}	
		return list;
	}

}
