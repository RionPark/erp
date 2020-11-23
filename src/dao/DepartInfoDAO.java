package dao;

import java.util.List;
import java.util.Map;

import vo.DepartInfoVO;

public interface DepartInfoDAO {

	public List<DepartInfoVO> selectDepartInfoList(DepartInfoVO diVO);
}
