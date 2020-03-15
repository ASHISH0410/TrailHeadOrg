public class TestDebuglogs {

    
   public static void checkLogs()
   {
       List<Contact> cons=[select id from Contact];
       system.debug('Hello');
   }
    
 public static void callLogs()
 {
     
         checkLogs();
     
 }


    
}