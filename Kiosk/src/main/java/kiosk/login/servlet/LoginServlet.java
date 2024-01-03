package kiosk.login.servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kiosk.owner.dao.OwnerDao;
import kiosk.owner.dto.OwnerDto;

@WebServlet("/owner/login")
public class LoginServlet extends HttpServlet{
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		 // 사용자가 제출한 폼 데이터에서 사용자 이름과 비밀번호 추출
        String email = req.getParameter("email");
        String pwd = req.getParameter("pwd");
       
        boolean isSuccess;
//        OwnerDto dto=new OwnerDto();
//		boolean isSuccess = OwnerDao.getInstance().insert(dto);
        

        // 실제로는 데이터베이스에서 사용자 정보를 가져와서 확인하는 것이 일반적입니다.
        // 여기서는 간단한 예제를 위해 미리 정의된 값과 비교합니다.
        OwnerDto dto = OwnerDao.getInstance().getData(email);
        if(dto == null) {
        	isSuccess = false;
        	req.setAttribute("errorMessage", "Invalid email or password. Please try again.");
            RequestDispatcher rd = req.getRequestDispatcher("login.jsp");
            rd.forward(req, resp);
        }
        
        if (dto.getEmail().equals(email) && dto.getPwd().equals(pwd)) {
            // 사용자 인증이 성공하면 세션을 생성하고 사용자를 로그인 상태로 유지
            HttpSession session = req.getSession();
            session.setAttribute("email", email);
            session.setAttribute("stoNum", dto.getSto_num());
            session.setAttribute("oName", dto.getO_name());
            isSuccess = true;
         
            req.setAttribute("isSuccess", isSuccess);

            if (isSuccess) {
                // 로그인 성공 시 메인 페이지로 이동
            	RequestDispatcher rd = req.getRequestDispatcher("login.jsp");
                rd.forward(req, resp);
            } else {
                // 로그인 실패 시 에러 메시지를 표시하고 로그인 페이지로 이동
                req.setAttribute("errorMessage", "Invalid email or password. Please try again.");
                RequestDispatcher rd = req.getRequestDispatcher("login.jsp");
                rd.forward(req, resp);
            }
        }
    }

}


