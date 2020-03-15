trigger AssignmentTrigger on Assignment__c (before insert,before delete) {

    if(Trigger.isDelete)
    {
        if(Trigger.isBefore)
        
        {system.debug('Trigger.oldMap(BEFORE)'+JSON.serialize(Trigger.oldMap));}
        
        if(Trigger.isAfter)
        {
            system.debug('Trigger.oldMap(AFTER)'+JSON.serialize(Trigger.oldMap));
        }
        
        
        
    }
    
}