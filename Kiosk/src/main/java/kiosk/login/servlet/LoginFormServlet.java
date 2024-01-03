package kiosk.login.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/owner/login_form")
public class LoginFormServlet extends HttpServlet{
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//쿠키에 로그인 정보가 저장이 되어 있는지 확인하기 
		Cookie[] cooks = req.getCookies();
		System.out.println(cooks);
		//if cooks 있다면 바로 그냥 옮기고 업
		RequestDispatcher rd = req.getRequestDispatcher("/owner/login_form.jsp");
		if(cooks != null) req.setAttribute("cookie", cooks);
		//로그인 폼에서 cookie의 값이 null 이 아니라면 자동완성을 해주는 기능을 추후 추가하자
		rd.forward(req, resp);
	}
}