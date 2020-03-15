trigger ContactTrigger on Contact (After insert) {

       system.debug('Hi'); 
    
    
    ContactTriggerHelper.call();
    
    
    
}