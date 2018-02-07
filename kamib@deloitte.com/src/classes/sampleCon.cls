public class sampleCon {
    String country = null;
    List <account> a;     
    public PageReference test() {
        return new PageReference('/apex/contact_display?att='+a[0].id);
    }
                
    public List<SelectOption> getItems() {
        List<SelectOption> options = new List<SelectOption>(); 
        List<Account> acc=[Select id,name from Account];
        for(Account acc1:acc){
        options.add(new SelectOption(acc1.name,acc1.name));
        
        }return options; 
    }
                   
    public String getCountry() {
        return country;
    }
                    
    public void setCountry(String country) 
    {
         
         this.country = country; 
         a= new List<Account>([select id from Account where name=:country]);
     }
     
     public pageReference prev(){
         return new PageReference('/apex/firstpage');
     }
}