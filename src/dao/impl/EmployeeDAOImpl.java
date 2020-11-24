package dao.impl;

import java.math.BigDecimal;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

import org.apache.commons.dbutils.DbUtils;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.ResultSetHandler;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import org.apache.commons.dbutils.handlers.ScalarHandler;

import common.DBCon;
import dao.EmployeeDAO;
import vo.EmployeeVO;

public class EmployeeDAOImpl implements EmployeeDAO {

	@Override
	public List<EmployeeVO> selectEmployeeList(EmployeeVO emp, int sNum, int eNum) {
		Connection con = null;
		try {
			QueryRunner qr = new QueryRunner();
			String sql = "select * from (select * from (select rownum as rNum, "
					+ "em_num as emNum, em_name as emName, di_num as diNum, em_id as emId, em_pwd as emPwd, credat from employee  e\r\n" + 
					"order by em_num desc)\r\n" + 
					"where rNum<=?)\r\n" + 
					"where rNum>=?";
			ResultSetHandler<List<EmployeeVO>> rsh = new BeanListHandler<>(EmployeeVO.class);
			Object[] objs = new Object[2];
			objs[0] = eNum;
			objs[1] = sNum;
			con = DBCon.getCon();
			return qr.query(con, sql, rsh, objs);
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			try {
				DbUtils.close(con);
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return null;
	}
	public static void main(String[] args) {
		EmployeeDAO empDAO = new EmployeeDAOImpl();
		System.out.println(empDAO.selectTotalCountEmployee(null));
	}
	@Override
	public int selectTotalCountEmployee(EmployeeVO emp) {
		String sql = "select count(1) from employee";
		Connection con = null;
		try {
			con = DBCon.getCon();
			QueryRunner qr = new QueryRunner();
			ScalarHandler<BigDecimal> sh = new ScalarHandler<>();
			return  qr.query(con, sql, sh).intValue();
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			try {
				DbUtils.close(con);
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return 0;
	}

}
