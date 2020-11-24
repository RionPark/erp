package service.impl;

import java.util.HashMap;
import java.util.Map;

import dao.EmployeeDAO;
import dao.impl.EmployeeDAOImpl;
import service.EmployeeService;
import vo.EmployeeVO;

public class EmployeeServiceImpl implements EmployeeService {
	EmployeeDAO empDAO = new EmployeeDAOImpl();
	@Override
	public Map<String,Object> getEmployeeList(EmployeeVO emp, int page) {
		int sNum = (page-1)*5 + 1;
		int eNum = sNum+(5-1);
		Map<String,Object> rMap = new HashMap<>();
		rMap.put("empList", empDAO.selectEmployeeList(emp, sNum, eNum));
		rMap.put("totalCount", empDAO.selectTotalCountEmployee(emp));
		return rMap;
	}
	
	public static void main(String[] args) {
		EmployeeService empService = new EmployeeServiceImpl();
		System.out.println(empService.getEmployeeList(null, 1));
	}

}
