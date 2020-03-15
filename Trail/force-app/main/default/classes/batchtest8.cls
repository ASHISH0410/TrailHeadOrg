@isTest
public class batchtest8 {

    static testMethod void testMethod1() 
    {
        List<Timecard__c> lst= new List<Timecard__c>();
        Project__c p=new Project__c();
        p.start_date__c=system.today().adddays(-20);
        p.end_date__c=system.today().adddays(150);
        insert p;
        contact c=new contact();
        c.LastName='gudekar';
        insert c;
        Assignment__c a=new Assignment__c();
        a.Contact__c=c.id;
        a.Project__c=p.id;
        insert a;
        
        for(Integer i=0 ;i <100;i++)
        {
          Timecard__c tim = new Timecard__c();
                    tim.Assignment__c=a.id;
                    tim.No_of_Hours__c=5;
                tim.Date__c=system.today();
       
        }
        
        insert lst;
        
        Test.startTest();

            batchAssignment8 obj = new batchAssignment8(system.today().addDays(1),'A-007');
            DataBase.executeBatch(obj); 
            
        Test.stopTest();
    }

}