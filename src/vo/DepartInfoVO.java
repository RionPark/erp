package vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class DepartInfoVO {
	private Integer diNum;
	private String diName;
	private String diCode;
	private String diEtc;
	private Integer diCnt;
}
