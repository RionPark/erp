package vo;

public class DepartInfoVO {

	private Integer diNum;
	private String diName;
	private String diCode;
	private String diEtc;
	private Integer diCnt;
	
	public DepartInfoVO() {}
	public DepartInfoVO(Integer diNum, String diName, String diCode, String diEtc, Integer diCnt) {
		super();
		this.diNum = diNum;
		this.diName = diName;
		this.diCode = diCode;
		this.diEtc = diEtc;
		this.diCnt = diCnt;
	}
	public Integer getDiNum() {
		return diNum;
	}
	public void setDiNum(Integer diNum) {
		this.diNum = diNum;
	}
	public String getDiName() {
		return diName;
	}
	public void setDiName(String diName) {
		this.diName = diName;
	}
	public String getDiCode() {
		return diCode;
	}
	public void setDiCode(String diCode) {
		this.diCode = diCode;
	}
	public String getDiEtc() {
		return diEtc;
	}
	public void setDiEtc(String diEtc) {
		this.diEtc = diEtc;
	}
	public Integer getDiCnt() {
		return diCnt;
	}
	public void setDiCnt(Integer diCnt) {
		this.diCnt = diCnt;
	}
	@Override
	public String toString() {
		return "DepartInfoVO [diNum=" + diNum + ", diName=" + diName + ", diCode=" + diCode + ", diEtc=" + diEtc
				+ ", diCnt=" + diCnt + "]";
	}
	
}
