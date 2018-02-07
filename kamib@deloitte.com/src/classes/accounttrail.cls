public class accounttrail {
    public static void tri(List<account> acc){
        Integer i;
        List<Contact> con= new List<Contact>();
        for(Account acc1:acc){
            for(i=0;i<2;i++){
            Contact con1=new Contact();
            con1.accountid=acc1.id;
            con1.lastname='trial'+i;
            con1.email='trial'+i+'@sdf.com';
            con1.phone='42342';
            con.add(con1);
            }
            insert con;
        }
    }
}