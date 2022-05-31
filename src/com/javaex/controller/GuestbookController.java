package com.javaex.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.javaex.dao.GuestbookDao;
import com.javaex.util.WebUtil;
import com.javaex.vo.GuestbookVo;

@WebServlet("/gbc")
public class GuestbookController extends HttpServlet {

	// 필드
	private static final long serialVersionUID = 1L;

	// defaut 생성자
	// 메서드 getter/setter

	// 메서드 일반
	// get 방식 호출
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		// post방식일때 한글 깨짐 방지
		request.setCharacterEncoding("UTF-8");

		// action 파라미터 꺼내기
		String action = request.getParameter("action");

		// 리스트
		if ("addList".equals(action)) {
			// 데이터 가져오기
			GuestbookDao guestbookDao = new GuestbookDao();
			List<GuestbookVo> guestList = guestbookDao.getList();

			// requset에 데이터 추가
			request.setAttribute("gList", guestList);

			WebUtil.forward(request, response, "/WEB-INF/addList.jsp");

			// 등록
		} else if ("add".equals(action)) {
			String name = request.getParameter("name");
			String password = request.getParameter("password");
			String content = request.getParameter("content");

			GuestbookVo guestbookVo = new GuestbookVo(name, password, content);

			GuestbookDao guestbookDao = new GuestbookDao();

			guestbookDao.insert(guestbookVo);

			// 리다이렉트 list
			WebUtil.redirect(request, response, "./gbc?action=addList");

			// 삭제
		} else if ("delete".equals(action)) {
			int no = Integer.parseInt(request.getParameter("number"));
			String password = request.getParameter("password");

			
			
			
			// 삭제폼
		} else if ("deleteForm".equals(action)) {
			
			int no = Integer.parseInt(request.getParameter("number"));
			
			// 포워드
			WebUtil.forward(request, response, "/WEB-INF/deleteForm.jsp");

		} else {
			System.out.println("action 파라미터 없음");
		}

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
}