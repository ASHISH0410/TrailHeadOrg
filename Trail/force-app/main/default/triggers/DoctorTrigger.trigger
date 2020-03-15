trigger DoctorTrigger on Doctor__c (before insert,before delete,after delete) {

    if(Trigger.isDelete)
    {
        if(Trigger.isBefore)
        {
           system.debug('Before:'+Trigger.oldMap); 
        }
        
        if(Trigger.isAfter)
        {
            system.debug('Im Here');
             system.debug('After:'+Trigger.oldMap); 
            
        }
        
        
    }
    
    if(Trigger.isInsert && Trigger.isBefore)
    { String msg='Hello';
        for(Doctor__c doc:Trigger.new)
        {
            
           DoctorTriggerHelper.setM(doc); 
            
            
            
            
            
            
        }
        
        
    }
    
    
    
}