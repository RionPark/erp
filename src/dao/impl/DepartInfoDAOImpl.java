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
			String sql = "select di_num as diNum, di_name as diName, di_code as diCode, di_etc as diEtc"
					+ " ,(select count(1) from employee e where e.di_num=di.di_num) as diCnt from depart_info di";
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
		DepartInfoVO diVO = new DepartInfoVO();
		diVO.setDiCode("04");
		diVO.setDiName("영업팀");
		diVO.setDiEtc("얘넨 맨날 늦게 오더라");
		System.out.println(diDAO.selectDepartInfoList(null));
	}

	@Override
	public int insertDepartInfo(DepartInfoVO diVO) {
		String sql = "insert into depart_info(di_num, di_code, di_name, di_etc) ";
		sql += " values(seq_di_no.nextval, ?,?,?)";
		Connection con = null;
		try {
			con = DBCon.getCon();
			QueryRunner qr = new QueryRunner();
			Object[] strs = new Object[3];
			strs[0] = diVO.getDiCode();
			strs[1] = diVO.getDiName();
			strs[2] = diVO.getDiEtc();
			return qr.update(con, sql, strs);
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










