public class TestCon {

    @AuraEnabled
    public static void serverEcho()
    {
        
        List<Doctor__c> docs=new  List<Doctor__c>();
        for(Integer i=0;i<5;i++)
        {
            Doctor__c dc=new Doctor__c();
            dc.count__c=i;
            dc.name__c='Jas'+i;
            docs.add(dc);
            
        }
        try{
            insert docs;}
        catch(Exception e)
        {
            Throw new AuraHandledException(e.getMessage());
        }
        
    }
    
    
}