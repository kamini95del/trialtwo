public with sharing class product_details{
    public Opportunity opp{set;get;}
    public Contact con{set;get;}
    Id conid{get;set;}
   
    public product_details(){
        conid= ApexPages.currentPage().getParameters().get('att');
        opp=new Opportunity();
        if(conid!=null)
            opp.contact__c=conid;
    }
    
    
    public PageReference prev()
    {
        PageReference vf2=new PageReference('/apex/convert_lead?att='+conid);
        return vf2;
    }    
    
    public PageReference save(){
 //   system.debug('#####'+opp);
           insert opp;
           return new PageReference('/apex/oppcreate?att='+opp.id);
                
    }
    
    
}