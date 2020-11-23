package dao.impl;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

import org.apache.commons.dbutils.DbUtils;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.ResultSetHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;

import common.DBCon;
import dao.DepartInfoDAO;
import vo.DepartInfoVO;


public class DepartInfoDAOImpl implements DepartInfoDAO { 
	@Override
	public List<DepartInfoVO> selectDepartInfoList(DepartInfoVO diVO) {
		Connection con = null;
		try {
			QueryRunner qr = new QueryRunner();
			String sql = "select di_num as diNum, di_name as diName, di_code as diCode, di_etc as diEtc from depart_info";
			ResultSetHandler<List<DepartInfoVO>> rsh = new BeanListHandler<>(DepartInfoVO.class);
			con = DBCon.getCon();
			return qr.query(con, sql, rsh);
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
		DepartInfoDAO diDAO = new DepartInfoDAOImpl();
		System.out.println(diDAO.selectDepartInfoList(null));
	}

}
