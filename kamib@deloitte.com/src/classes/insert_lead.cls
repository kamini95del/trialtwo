public with sharing class insert_lead{
    public Lead lead1{get;set;}
    
    public insert_lead(){
    lead1=new Lead();
    
    }

    Public string propPickValSelected { get; set; }

       public List<SelectOption> getPickLstValue()
      {
              List<SelectOption> options = new List<SelectOption>();
              Schema.DescribeFieldResult fieldResult = Lead.Status.getDescribe();
              List<Schema.PicklistEntry> ple = fieldResult.getPicklistValues();
              for(Schema.PicklistEntry f : ple)
             {
                      if(f.getValue() != 'Closed - Converted')
                      {
                              options.add(new SelectOption(f.getLabel(), f.getValue()));
                      }
              } 
              return options;           
       }

     
    public PageReference save(){
       insert lead1;
       PageReference vf2=new PageReference('/apex/firstpage');
        return vf2;
      }
       

    
    public PageReference cancel(){
      PageReference vf2=new PageReference('/apex/firstpage');
        return vf2;
    }

}