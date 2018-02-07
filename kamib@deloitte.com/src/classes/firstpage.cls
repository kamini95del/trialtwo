public with sharing class firstpage{

    public PageReference leadcreate() {
        PageReference vf2=new PageReference('/apex/insert_lead');
        return vf2;
    }
   

    public PageReference leadconvert() 
    {
        PageReference vf2=new PageReference('/apex/lead_display');
        return vf2;
    }


     
     public PageReference updateacc() {
        PageReference vf2=new PageReference('/apex/account_display');
        return vf2;
    }


}