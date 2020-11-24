package service.impl;

import java.util.List;

import dao.DepartInfoDAO;
import dao.impl.DepartInfoDAOImpl;
import service.DepartInfoService;
import vo.DepartInfoVO;

public class DepartInfoServiceImpl implements DepartInfoService {
	
	private DepartInfoDAO diDAO = new DepartInfoDAOImpl();
	@Override
	public List<DepartInfoVO> selectDepartInfoList(DepartInfoVO diVO) {
		return diDAO.selectDepartInfoList(diVO);
	}
	public static void main(String[] args) {
		DepartInfoService diService = new DepartInfoServiceImpl();
		System.out.println(diService.selectDepartInfoList(null));
	}
	@Override
	public int insertDepartInfo(DepartInfoVO diVO) {
		return diDAO.insertDepartInfo(diVO);
	}
}
