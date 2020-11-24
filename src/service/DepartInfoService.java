package service;

import java.util.List;

import vo.DepartInfoVO;

public interface DepartInfoService {
	public List<DepartInfoVO> selectDepartInfoList(DepartInfoVO diVO);
	public int insertDepartInfo(DepartInfoVO diVO);
}
