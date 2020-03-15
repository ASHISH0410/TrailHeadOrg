public class lastcontroller {

    public lastcontroller(ApexPages.StandardController controller) {
    


    }


Employee__c employee;

public Employee__c getEmployee()
{
if(employee==null)
employee=[select id,firstname__c,lastname__c,state__c,country__c from Employee__c where id=:ApexPages.currentPage().
getParameters().get('id')];

return  employee;
}


   public PageReference save()
    {
    update employee;
    PageReference prf=Page.Assignement2c;
    //employee=[select id from employee__c where id=:Apexpages.currentPage().getParameters().get('id')];
    prf.setRedirect(true);
   // prf.getParameters().put('id',employee.id);
    
    return prf;
    }



}