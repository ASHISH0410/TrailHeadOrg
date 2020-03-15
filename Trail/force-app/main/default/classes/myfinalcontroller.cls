public class myfinalcontroller {

    public myfinalcontroller(ApexPages.StandardController controller) {

    }


Employee__c employee;
    public myfinalcontroller(ApexPages.StandardSetController controller) {

    }
    
    public PageReference sendtocode()
    {
    
    PageReference prf=Page.mydetailpage;
    employee=[select id from employee__c where id=:Apexpages.currentPage().getParameters().get('id')];
    prf.setRedirect(true);
    prf.getParameters().put('id',employee.id);
    
    return prf;
    }
   

    
    

}