global class batchAssignment8 implements Database.Batchable<sObject>,Database.Stateful {

public date startdate;
public string myname;

public batchAssignment8 (date mydate,string n)
{

startdate=mydate;
myname=n;

}

    
    global Database.QueryLocator start(Database.BatchableContext BC) {
        // collect the batches of records or objects to be passed to execute
         date enddate=startdate+4;
         
       //  assignment__c a=[select id,name from assignment__c where name=:myname];
       //  system.debug(a);
       // String query = 'SELECT Id,Name,no_of_hours__c,date__c,assignment__c FROM timecard__c';
        String query = 'SELECT Id,Name,no_of_hours__c,date__c,assignment__c FROM timecard__c where (date__c >=:startdate and date__c<=:enddate)' ;
        return Database.getQueryLocator(query);
    }
     
    global void execute(Database.BatchableContext BC, List<Timecard__c> TimeList) {
        
        // process each batch of records
        system.debug(timelist);
        List<Missing_timecard__c> mt=new list<missing_timecard__c>();
                for(Timecard__c missedtimecard:Timelist)
                {
                system.debug('here');
                Missing_timecard__c t=new missing_timecard__c();
                if(missedtimecard.no_of_hours__c<9)
                {
                
                t.assignment__c=missedtimecard.assignment__c;
                t.no_of_hours_missed__c=9-missedtimecard.no_of_hours__c;
                t.date__c=missedtimecard.date__c;
                mt.add(t);
                
                
                }
                
                
                }
                try{
                system.debug('adding');
                insert mt;
                }
                
                
                catch(Exception e)
                {
                system.debug('error');
                }
                
        
         
    }   
     
    global void finish(Database.BatchableContext BC) {
        // execute any post-processing operations
  }
}