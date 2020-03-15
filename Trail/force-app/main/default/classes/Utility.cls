public class Utility {

    
    @Auraenabled
    public static string getOTP()
    {
        Integer len = 10;
        Blob blobKey = crypto.generateAesKey(128);
        String key = EncodingUtil.convertToHex(blobKey);
        String otp = key.substring(0,len);
        return otp;
    }
    @Auraenabled
    public static boolean getsendOTPEmail(String email,String Firstname,String otp)
    {
        List<Messaging.SingleEmailMessage> mails = new List<Messaging.SingleEmailMessage>();
        Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
        List<String> To = new List<String>();
        To.add(email);
        mail.setToAddresses(To);
        mail.setReplyTo('viraj_shirgaonkar@persistent.com.com');
        mail.setSenderDisplayName('Lightning Reusable Components');
        mail.setSubject('OTP for Subscription!');
        String body = 'Dear ' + FirstName + ', ';
        body += 'OTP:'+otp;
        mail.setHtmlBody(body);
        mails.add(mail);
        Messaging.sendEmail(mails);
        return true;
    }
    
     @Auraenabled
    public static void createContact(String firstname,String lastname,String email)
    {
        Contact con=new Contact();
        con.FirstName=firstname;
        con.Lastname=lastname;
        con.email=email;
        insert con;
    }
    
    
    
    
    
    
    
}