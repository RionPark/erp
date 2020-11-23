package servlet;

import java.io.IOException;
import java.util.List;

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
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
