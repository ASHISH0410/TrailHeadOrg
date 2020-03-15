public class ProjectController {

public boolean value{get;set;}
  
public date mydate{get;set;}
  public List<project__c> data1{get;set;}
   public List<assignment__c> data2{get;set;}
  public List<AssignTime> data3{get;set;}


public class AssignTime
{

public decimal sum{get;set;}
public Assignment__c myassign{get;set;}

public AssignTime(decimal d,Assignment__c a)
{
sum=d;
myassign=a;

}

} 
 
 public pagereference sendid()
 {
 data3=new list<AssignTime>();
 value=true;
 data2 = [select id,name,contact__r.firstname from assignment__c where Project__c=:Apexpages.currentpage().getparameters().get('id')];
 
 for(assignment__c ma:data2)
 {
    string dataid=ma.id;
    list<Timecard__c> tc=[select no_of_hours__c from timecard__c where assignment__c=:dataid];
    
     decimal sum=0;
    for(Timecard__c currenttc:tc)
    {
    
    sum=sum+currenttc.no_of_hours__c;
    
    }
    
    data3.add(new AssignTime(sum,ma));
    
    system.debug('Assignment id='+ma.name+' no of hours worked '+sum);
 
 
 }

 return null;
 }
 

public date getmydate()
{

return mydate;

}

public List<AssignTime> getdata3()
{
system.debug('getdata3()...');
return data3;
 //return [SELECT id,Name FROM Project__c where start_date__c=:getmydate() limit 1 ];
}

public List<assignment__c> getdata2()
{
system.debug('getdata2()...');
return data2;
 //return [SELECT id,Name FROM Project__c where start_date__c=:getmydate() limit 1 ];
}

public List<project__c> getdata1()
{
system.debug('getdata()...');
return data1;
 //return [SELECT id,Name FROM Project__c where start_date__c=:getmydate() limit 1 ];
}




public PageReference search()
{
//myprojects=new list<project__c>();
data1=[SELECT id, Name FROM Project__c where start_date__c=:getmydate()];
system.debug(data1);
system.debug(getdata1());

return null;
}
   

}