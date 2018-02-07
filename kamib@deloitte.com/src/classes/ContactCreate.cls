public class ContactCreate {
    public static void afterUpdate(List<Lead> leads, Map<id,lead> oldMap){
        System.debug('Leads'+leads); 
        List<Contact> conList= new List<Contact>();
        List<Lead> lead1= new List <Lead>();
        for(Lead l:leads){
           	if(l.Status=='Closed - Converted' && (l.status!= oldMap.get(l.id).Status)){
            Contact con=new Contact();
           	List<Account> acc = new List<Account>([SELECT id from Account where name=:l.Company]);
          	con.accountid=acc[0].id;
            con.FirstName = l.firstname;
            con.LastName=l.lastname;
            con.Phone=l.mobilephone;
            con.Email=l.email;
 			if(l.street!=null)
            	con.MailingStreet=l.Street;
            if(l.city!=null)
                con.mailingcity=l.City;
            if(l.country!=null)
                con.MailingCountry=l.country;
            if(l.PostalCode!=null)
                con.MailingPostalCode=l.PostalCode;
            if(l.state!=null)
                con.MailingState=l.State;
          	
             conList.add(con);
            
            }
         
        }
        //system.debug('@@@@@'+conList);
        insert conList;
    }
}