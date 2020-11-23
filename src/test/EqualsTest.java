package test;

public class EqualsTest {

	private String url;
	
	public static void main(String[] args) {
		EqualsTest et = new EqualsTest();
		if(et.url.equals("test")) {
			System.out.println("아 url이 test구나");
		}else {
			System.out.println("아 url이 test아니구나");
		}
	}
}
