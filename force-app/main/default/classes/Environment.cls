/*
* @author : Davide Arena 
*/
public without sharing class Environment {
	public static final System.URL ORG_DOMAIN_URL = System.URL.getOrgDomainUrl();
	public static final String SANDBOX_NAME= DomainParser.parse(ORG_DOMAIN_URL).getSandboxName();
	
	public static Boolean isSandbox() {
		return SANDBOX_NAME != null;
	}
}
