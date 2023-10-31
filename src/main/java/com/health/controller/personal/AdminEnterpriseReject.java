package com.health.controller.personal;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import com.google.gson.Gson;
import com.health.dao.MemberDao;

@WebServlet("/personal/admin-entReject-process")
public class AdminEnterpriseReject extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private final MemberDao memberDao = MemberDao.getInstance();
       
 
    public AdminEnterpriseReject() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int intEnerpriseNo = Integer.parseInt(request.getParameter("userNo"));
		int result = memberDao.entReject(intEnerpriseNo);
		Gson gson = new Gson();
		Map<String, String> map = new HashMap<>();
		String resultJson = null;
		
		if (result > 0) {
			map.put("isRejected", "ok");
			resultJson = gson.toJson(map);

		} else {
			map.put("isRejected", "fail");
			resultJson = gson.toJson(map);
		}
		request.setAttribute("resultJson", resultJson);
		RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/personal/enterpriseRejected.jsp");
		dispatcher.forward(request, response);
	}

}
