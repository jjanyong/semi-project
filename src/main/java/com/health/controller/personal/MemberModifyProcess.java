package com.health.controller.personal;

import com.health.dao.MemberDao;
import com.health.dao.PersonalDao;
import com.health.dto.MemberDto;
import com.health.util.ScriptWriter;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;

@WebServlet(name = "MemberModifyProcess", value = "/personal/member-modify-process")
public class MemberModifyProcess extends HttpServlet {

    private final MemberDao memberDao = MemberDao.getInstance();
    private final PersonalDao personalDao = PersonalDao.getInstance();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        MemberDto loggedMember = (MemberDto) session.getAttribute("loggedMember");
        if (loggedMember == null) {
            ScriptWriter.alertAndGo(response,"잘못된 접근입니다.", "../index/index");
        }
        int userNo = loggedMember.getUserNo();

        String nickName = request.getParameter("nickName");
        String email = request.getParameter("email");
        String address = request.getParameter("address");
        String addressDetail = request.getParameter("addressDetail");

        MemberDto memberDto = new MemberDto();
        memberDto.setUserNo(userNo);
        memberDto.setNickName(nickName);
        memberDto.setEmail(email);
        memberDto.setAddress(address);
        memberDto.setAddressDetail(addressDetail);

        int result = memberDao.updateMember(memberDto);


        if (result > 0) {
            MemberDto updateMember = personalDao.memberInfo(userNo);
            updateMember.setPw(null);
            session.setAttribute("loggedMember", updateMember);
            response.sendRedirect("../personal/member-info");
        } else {
            ScriptWriter.alertAndBack(response,"오류입니다.");
        }
    }
}
