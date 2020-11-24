package servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service.DepartInfoService;
import service.impl.DepartInfoServiceImpl;
import vo.DepartInfoVO;

/**
 * Servlet implementation class DepartInfoServlet
 */
@WebServlet("/depart/*")
public class DepartInfoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    private DepartInfoService diService = new DepartInfoServiceImpl();
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String targetUrl = "/views/di-list";
		if("/depart/list".equals(request.getRequestURI())) {
			request.setAttribute("diList", diService.selectDepartInfoList(null));
		}
		RequestDispatcher rd = request.getRequestDispatcher(targetUrl);
		rd.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String targetUrl = "/views/di-insert";
		if("/depart/insert".equals(request.getRequestURI())) {
			DepartInfoVO diVO = new DepartInfoVO();
			diVO.setDiCode(request.getParameter("diCode"));
			diVO.setDiName(request.getParameter("diName"));
			diVO.setDiEtc(request.getParameter("diEtc"));
			String msgCode = "ss01";
			if(diService.insertDepartInfo(diVO)!=1) {
				msgCode = "err01";
			}
			request.setAttribute("msgCode", msgCode);
		}
		RequestDispatcher rd = request.getRequestDispatcher(targetUrl);
		rd.forward(request, response);
	}

}
