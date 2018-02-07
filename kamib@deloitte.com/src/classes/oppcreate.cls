public with sharing class oppcreate{

    public String productused { get; set; }

    public List<SelectOption> getproductopts(){
       List<Product2> products = [SELECT Id, Name from Product2 where IsActive = true];
        List<SelectOption> productopts = new List<SelectOption>();
        for(Product2 pb : products)
            productopts.add(new SelectOption(pb.name,pb.name));
        return productOpts;
       }
       

    public List<SelectOption> getPriceBookOptions() {
        List<Pricebook2> pricebooks = [SELECT Id, Name from Pricebook2 where IsActive = true];
        List<SelectOption> pbOptions = new List<SelectOption>();
        for(PriceBook2 pb : pricebooks)
            pbOptions.add(new SelectOption(pb.name,pb.name));
        return pbOptions;
    }
    public opportunitylineitem opppro{set;get;}
    public Opportunity opp{set;get;}
    public Lead lead1{get;set;}
    public String selectedCountry2{get;set;}
    public List<Product2Wrapper> wrappers {get; set;}
    public static Integer toDelIdent {get; set;}
    public static Integer addCount {get; set;}
    private Integer nextIdent=0;
   public String PriceBookUsed{get;set;}  
   public oppcreate()
 {
  opp= new Opportunity();
  opp.id=ApexPages.currentPage().getParameters().get('att');
  wrappers=new List<Product2Wrapper>();
  wrappers.add(new Product2Wrapper(nextIdent++,opp));
  
 }
 
    
 public void delWrapper()
 {
  Integer toDelPos=-1;
  for (Integer idx=0; idx<wrappers.size(); idx++)
  {
   if (wrappers[idx].ident==toDelIdent)
   {
    toDelPos=idx;
   }
  }
   
  if (-1!=toDelPos)
  {
   wrappers.remove(toDelPos);
  }
 }
  
 public void addRows()
 {
  for (Integer idx=0; idx<addCount; idx++)
  {
   wrappers.add(new Product2Wrapper(nextIdent++,opp));
  }
 }
  
 public pageReference save()
 {
  List<Product2> pros=new List<Product2>();
  for (Product2Wrapper wrap : wrappers)
  {
   //wrap.pro.opportunity__c=opp.id;
   pros.add(wrap.pro);
  }
  insert pros;
   return new PageReference('/apex/firstpage');
  //return new PageReference('/' + Schema.getGlobalDescribe().get('Product2').getDescribe().getKeyPrefix() + '/o');
 }
  
  public pageReference prev()
 {
      return new PageReference('/apex/product_details?att='+opp.Id);
 }
  
    public void amt(){
        
    }
 public class Product2Wrapper
 {
  public Product2 pro {get;set;}
  public Integer ident {get; set;}
  
  Product2Wrapper(){}
   
  public Product2Wrapper(Integer inIdent, Opportunity opp)
  {
   ident=inIdent;
   pro=new Product2();
   
   }
  
    
  
 }
}