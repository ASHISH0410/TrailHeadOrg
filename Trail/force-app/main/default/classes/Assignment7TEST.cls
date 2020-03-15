@isTest
public class Assignment7TEST {
    
    static testMethod void checker()
    {
        
        PageReference prf=Page.Assignment7;
        test.setCurrentPage(prf);
        A7controller myc=new  A7controller();
  string url=myc.save().getUrl();
        system.debug('>>>>>>>>>>>>>>>>'+myc.countries);
  System.assertEquals('/apex/success?error=pass', url);
       
        
        
    }

}