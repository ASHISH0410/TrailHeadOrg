public class mynewcontroller {

Employee__c employee;
string first;
Employee__c temp;
//ApexPages.StandardController ck;
public string getName()
{
return 'mynewcontroller';
}
    public mynewcontroller(ApexPages.StandardController controller) {
    
           // ck=controller;          
         //  employee=(Employee__c) controller.getRecord();  

    }
    
    public string getgo()
    {
    
    if(employee==null)
    employee=[select firstname__c,lastname__c,state__c,country__c from Employee__c where 
    id = :ApexPages.currentPage().getParameters().get('cid')];
   
    return employee.firstname__c+'hey';
    }
    
 
    
    public PageReference save()
    {
            //   temp=(Employee__c)ck.getRecord();
           //    employee.firstname__c=temp.firstname__c;
        //  update employee;
        
          
update employee;
    PageReference prf=Page.Assignement2c;
    prf.setRedirect(true);
    return prf;
    
    
    }
    

}