package vaobjects;

public class UserRegDetails {
	private String userName;
	private String mailId;
	private String mobNum;
	private String address;
	private String password;
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getMobNum() {
		return mobNum;
	}
	public void setMobNum(String mobNum) {
		this.mobNum = mobNum;
	}
	public String getMailId() {
		return mailId;
	}
	public void setMailId(String mailId) {
		this.mailId = mailId;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
}
