package dao.common;

import java.util.List;

public interface CommonDAO<T> {
	public List<T> selectList(String sql,Class<? extends T> t) ;
}
