package vaobjects;

public class UserData {
	private String name;
	private String mailId;
	private String mobNum;
	private String address;
	private String pass;
	private String search;
	
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
	public String getName() {
		return name;
	}
	public void setName(String userName) {
		this.name = userName;
	}
	public String getPass() {
		return pass;
	}
	public void setPass(String pass) {
		this.pass = pass;
	}
	public String getSearch() {
		return search;
	}
	public void setSearch(String search) {
		this.search = search;
	}
}
