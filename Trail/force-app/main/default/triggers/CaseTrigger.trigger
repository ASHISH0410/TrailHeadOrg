trigger CaseTrigger on Case (before insert,after update) {

 
      for(Case c:Trigger.new)
      {
          
          account a=[select id,last_survey_sent__c from account where id=:c.accountid];
          a.last_survey_sent__c=c.last_survey_sent__c;
          update a;
          
          
      }
      
  
   
       
}