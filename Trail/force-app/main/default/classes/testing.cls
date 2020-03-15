@isTest
public class testing
{

static testMethod void check()
{
list<account> accounts=new list<account>();

for(Integer i=0;i<200;i++)
{
account a =new account(name='ashish gudekar');
accounts.add(a);

}

test.startTest();
 insert accounts;
 test.stoptest();
 
 list<account> inserted=[select name,description from account where id in:accounts];
 
 for(account myaccount:inserted )
 {
 system.assertequals('this account is of a vip person',myaccount.description);
     system.debug('hi this is my first debug log');
 
 }



}




}