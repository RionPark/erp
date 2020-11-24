package service;

import java.util.Map;
import vo.EmployeeVO;

public interface EmployeeService {
	public Map<String,Object> getEmployeeList(EmployeeVO emp, int page);
}
