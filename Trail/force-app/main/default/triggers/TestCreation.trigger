trigger TestCreation on Case (before insert) {
    
   /* ID userid=UserInfo.getUserId();
    CaseCreationCount__c data=CaseCreationCount__c.getInstance(userid);
     Decimal count= data.count__c;
    Case error;
     for(Case c:Trigger.new)
     {
         error=c;break;
         
     }
    if(count==0) error.addError('Cannot Create more cases');
    else
    {
        system.debug('here');
       data.count__c=count-1; 
        update data;
    }
    */
    
}