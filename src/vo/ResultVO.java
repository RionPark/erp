package vo;

import java.util.List;

import lombok.Data;

@Data
public class ResultVO {

	private List<EmployeeVO> empList;
	private Integer totalCount;
}
