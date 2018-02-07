public with sharing class convertlead{
    public String conname{get;set;}
    Id conid{get;set;}
    public Account acc{get;set;}
    //public Account acc1{get;set;}
   public Contact con{get;set;}
    public Lead lead{get;set;}
   
   
    public convertlead()
    {
        con=new Contact();
        conid= ApexPages.currentPage().getParameters().get('att');
        if(conid!=null)
        {
            List <Contact> conlist= new List<Contact>([select id, name, mailingstreet, mailingcity, mailingstate, mailingcountry, mailingpostalcode, accountid, otherstreet, othercity, otherstate, othercountry, otherpostalcode, email, phone, lastname  from Contact where id=:conid]);
            con=conList[0];
            List<Account> acclist= new List<Account>([SELECT id, name, billingstate, billingcity, billingcountry from Account where id=:con.accountid]);
            acc=acclist[0];
            
         }
    }
    
    
  
    public PageREference updateacc()
    {
        try{
            update acc;
            update con;
            
    
        }
        catch(Exception dmlexp)
        {
            System.debug('**** Exception occurred -> '+dmlexp.getMessage());
        }
        return new PageReference('/apex/product_details?att='+con.id);
        
     }  
    
    
    
    public PageReference cancel()
    {
        PageReference vf2=new PageReference('/apex/contact_display?att='+acc.id);
        return vf2;
    }    
   
}