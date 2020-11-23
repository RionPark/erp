package dao.common.impl;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

import org.apache.commons.dbutils.DbUtils;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.ResultSetHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;

import common.DBCon;
import dao.common.CommonDAO;

public class CommonDAOImpl<T> implements CommonDAO<T> {

	@Override
	public List<T> selectList(String sql,Class<? extends T> t) {
		Connection con = null;
		try {
			con = DBCon.getCon();
			ResultSetHandler<List<T>> rsh = new BeanListHandler<T>(t);
			QueryRunner qr = new QueryRunner();
			return qr.query(con, sql, rsh);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				DbUtils.close(con);
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return null;
	}

}
