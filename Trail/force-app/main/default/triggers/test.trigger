trigger test on Account (before insert) {

for(Account a:Trigger.New)
{
if(a.name.tolowercase().contains('ash'))
{
a.description='this account is of a vip person';
    
}
else
{
    
  
}
}





}