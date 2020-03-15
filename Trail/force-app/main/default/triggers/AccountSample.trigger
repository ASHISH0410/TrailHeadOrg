trigger AccountSample on Account (before insert,before update) {

for(Account ac:Trigger.New)
{
system.debug('updated description');
ac.Description='new description';

}

}