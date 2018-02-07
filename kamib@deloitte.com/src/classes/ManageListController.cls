public class ManageListController 
{
 public List<Product2Wrapper> wrappers {get; set;}
 public static Integer toDelIdent {get; set;}
 public static Integer addCount {get; set;}
 private Integer nextIdent=0;
  
 public ManageListController()
 {
  wrappers=new List<Product2Wrapper>();
  wrappers.add(new Product2Wrapper(nextIdent++));
  
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
   wrappers.add(new Product2Wrapper(nextIdent++));
  }
 }
  
 /*public PageReference save()
 {
  List<Product2> pros=new List<Product2>();
  for (Product2Wrapper wrap : wrappers)
  {
   pros.add(wrap.pro);
  }
   
  insert pros;
   
  return new PageReference('/' + Schema.getGlobalDescribe().get('Product2').getDescribe().getKeyPrefix() + '/o');
 }
 */ 
 public class Product2Wrapper
 {
  public Product2 pro {get; private set;}
  public Integer ident {get; private set;}
   
  public Product2Wrapper(Integer inIdent)
  {
   ident=inIdent;
   pro=new Product2(Name='Product'+1);
  }
 }
}