public class A6Econtroller {

public String contacts{get;set;}
public boolean value{get;set;}
public list<skill__c> data{get;set;}

public list<skill__c> getdata()
{
return data;
}

    public A6Econtroller()
    {
        //gender='Male';
    }


    public string getcontacts()
    {
        return contacts;
    }
       
   public  list<SelectOption> getitems()
    {
    
    list<Contact> con=[select firstname from contact];
    List<SelectOption> options = new List<SelectOption>();
    
    for(Contact c:con)
    {
    options.add(new SelectOption(c.firstname,c.firstname));
    }
         
        return options;
        
    }
    
    public pagereference selectcontact()
    {
     value=true;
     contact c=[select id from contact where firstname=:getcontacts()];
     data=[select id,name,rating__c,LastModifiedDate  from skill__c where contact__c=:c.id];
    return null;
    }
      
    public pagereference save()
    {
    value=false;
    update data;
    return null;
    }
    
 
    public void setcontacts(string c)
    {
    this.contacts=c;
    }
    
    
    
    

}