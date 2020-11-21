package beans;

import java.util.ArrayList;
import java.util.List;

import vo.DepartInfoVO;

public class DepartInfoBean {

	private DepartInfoVO di;
	public List<DepartInfoVO> getDepartInfoList(){
		List<DepartInfoVO> diList = new ArrayList<>();
		DepartInfoVO di = new DepartInfoVO(1,"개발팀","00","야근짱",30);
		diList.add(di);
		return diList;
	}
	public int setDepartInfo(DepartInfoVO di) {
		this.di = di;
		return 1;
	}
	public DepartInfoVO getDepartInfoVO() {
		return this.di;
	}
}





