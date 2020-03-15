public class DoctorTriggerHelper {

    
    
    public static void setM(Doctor__c doc)
    {
        if(doc.Count__c==1)
            {  
                  doc.addError('Breaking:');
                
            }
           system.debug('Hello'+doc.Name__c); 
        
    }
}