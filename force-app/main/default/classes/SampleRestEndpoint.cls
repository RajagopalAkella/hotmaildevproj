/*
https://akellahotmaildev-developer-edition.ap24.force.com/mydev/services/apexrest/myVals/
*/
@RestResource(urlMapping='/myVals/*')
global without sharing class SampleRestEndpoint {
  
    @HttpGet
    global static List<Account> doGet() {
        RestRequest req = RestContext.request;
        RestResponse res = RestContext.response;
        //String accountId = req.requestURI.substring(req.requestURI.lastIndexOf('/')+1);
        List<Account> result = [SELECT Id, Name FROM Account];
        return result;
    }    
    
/*    


    @HttpGet
    global static String doGet() {
        RestRequest req = RestContext.request;
        RestResponse res = RestContext.response;
        List<sample__c> result = [SELECT Id, Name FROM sample__c];
        return JSON.serialize(result);
        //return JSON.serialize('Sample String');
    } 

    @HttpGet
    global static List<Account> doGet() {
        RestRequest req = RestContext.request;
        RestResponse res = RestContext.response;
        //String accountId = req.requestURI.substring(req.requestURI.lastIndexOf('/')+1);
        List<Account> result = [SELECT Id, Name FROM Account LIMIT 10];
        return result;
    } 

@HttpGet
    global static Account doGet() {
        RestRequest req = RestContext.request;
        RestResponse res = RestContext.response;
        String accountId = req.requestURI.substring(req.requestURI.lastIndexOf('/')+1);
        Account result = [SELECT Id, Name FROM Account WHERE Id = :accountId];
        return result;
    }    */
    
/*    @HttpDelete
    global static void doDelete() {
        RestRequest req = RestContext.request;
        RestResponse res = RestContext.response;
        String accountId = req.requestURI.substring(req.requestURI.lastIndexOf('/')+1);
        Account account = [SELECT Id FROM Account WHERE Id = :accountId];
        delete account;
    }  
  @HttpPost
    global static String doPost(String name,
        String phone, String website) {
        Account account = new Account();
        account.Name = name;
        account.phone = phone;
        account.website = website;
        insert account;
        return account.Id;
    } */
}