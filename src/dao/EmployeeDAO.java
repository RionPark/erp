package dao;

import java.math.BigDecimal;
import java.util.List;

import vo.EmployeeVO;

public interface EmployeeDAO {
	public List<EmployeeVO> selectEmployeeList(EmployeeVO emp, int sNum, int eNum);
	public int selectTotalCountEmployee(EmployeeVO emp);
}
