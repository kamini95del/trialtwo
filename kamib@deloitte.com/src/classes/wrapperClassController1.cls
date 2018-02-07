public class wrapperClassController1 {

    //Our collection of the class/wrapper objects cContact 
    public List<cContact> contactList {get; set;}
    public List<Lead> selectedContacts{get;set;}
    public String value {get;set;}
    public List<cContact> getContacts() {
        if(contactList == null) {
            contactList = new List<cContact>();
            for(Lead c : [select Name, Company from Lead where (Status!='Closed - Converted' and Status!='Closed - Not Converted') limit 20]) {
                // As each contact is processed we create a new cContact object and add it to the contactList
                contactList.add(new cContact(c));
            }
        }
        return contactList;
    }


    public PageReference processSelected() {

                //We create a new list of Contacts that we be populated only with Contacts if they are selected
        selectedContacts = new List<Lead>();
        
        
        //We will cycle through our list of cContacts and will check to see if the selected property is set to true, if it is we add the Contact to the selectedContacts list
         List<Account> acct=new List<Account>();
        Integer i=0;
        for(cContact cCon : getContacts()) {
            if(cCon.selected == true) {
                selectedContacts.add(cCon.con);
                Account accl=new Account();
                Lead l= new Lead();
                l=(Lead)cCon.con;
               // l.status='Closed - Converted';
               // l=[SELECT lastname, id, company from Lead where (company=cCon.con.company AND lastname=Ccon.con.lastname)]
              //  update l;
                accl.Name=l.company;
                acct.add(accl);
               
               
                i++;
            system.debug('***Account'+acct);              
            }
        }
        system.debug('acct'+acct);
        for (Account acc:acct)
        {
            List<Account> check= new List<Account>();
            check = [SELECT id,name from Account where name=:acc.name];
            if(check.IsEmpty()){
               insert acc;
              }
               
         }
         
         for(cContact cCon : getContacts()){
                  if(cCon.selected == true) {
                      Lead leadl= new Lead();
                      leadl=(Lead)cCon.con;
                      leadl.status='Closed - Converted';
                      update leadl;
                   }
              }

      system.debug('@@@@@@@@@@@@@@@'+selectedContacts);
        
        
       
            if(selectedContacts.size()>0)
            {
                value = selectedContacts.size()+ 'ACCOUNTS CREATED SUCCESSFULLY!';
                System.debug('printing listcontc'+selectedContacts.size());
            }
            else
             {
                 value =''+ selectedContacts.size();
             
             }
        
        // Now we have our list of selected contacts and can perform any type of logic we want, sending emails, updating a field on the Contact, etc
       
       
        return null;
    }
    
    public List<Lead> getSelectedContacts(){
        System.debug('printing listcontc inside get'+selectedContacts.size());
        if(selectedContacts.size()>0)
            
            return selectedContacts;
        else return null;
    }

    public pageReference back(){
        return new pageReference('/apex/firstpage');
    }

    // This is our wrapper/container class. A container class is a class, a data structure, or an abstract data type whose instances are collections of other objects. In this example a wrapper class contains both the standard salesforce object Contact and a Boolean value
    public class cContact {
        public Lead con {get; set;}
        public Boolean selected {get; set;}

        //This is the contructor method. When we create a new cContact object we pass a Contact that is set to the con property. We also set the selected value to false
        public cContact(Lead c) {
            con = c;
            selected = false;
        }
    }
}