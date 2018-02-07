public class contact_display {
     //List<SelectOption> options = new List<SelectOption>(); 
    String country = null;     
    Id id1{get;set;}
    List<Contact> c;
    public PageReference next() {
        return new PageReference('/apex/convert_lead?att='+c[0].id);
    }
 
     public contact_display(){
         id1= ApexPages.currentPage().getParameters().get('att');
     }
    //  Account a=new Account();          
     // a.id=Integer.valueof(id1);
    public List<SelectOption> getItems() {
        List<SelectOption> options = new List<SelectOption>(); 
        List<Contact> con=[Select name, Email from Contact where accountid=:id1];
        for(Contact con1:con){
        options.add(new SelectOption(con1.name,con1.name));
        
        }return options; 
    }
                   
    public String getCountry() {
        return country;
    }
                    
    public void setCountry(String country) 
    {
         
         this.country = country; 
         c= new List<Contact>([select id from Contact where name=:country]);
                 
         
         
     }
     
     public pageReference prev(){
         return new PageReference('/apex/account_display');
     }
}