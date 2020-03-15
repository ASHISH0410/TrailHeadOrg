public class mynewclass {

    public account acc;

    public mynewclass(ApexPages.StandardController controller) {
     this.acc=(account)controller.getRecord();
    
    }
    
    public String getGreeting()
    {
    
    return 'Welcome '+UserInfo.getName() + 'from' +acc.name;
    
    }
    



    

}