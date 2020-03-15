trigger TimeTrigger on TimeCard__c (before insert ) {
    
    for(Timecard__c tc:trigger.new)
    {
         assignment__c a=[select id,project__c from assignment__c where id=:tc.Assignment__c];
        project__c p1=[select start_date__c,end_date__c from project__c where id=:a.Project__c];
        if(tc.Date__c>=p1.start_date__c && tc.Date__c<=p1.end_date__c)
        {
            
            
        }
        else
        {
            tc.addError('date is not proper');

            
        }
        
    }

}