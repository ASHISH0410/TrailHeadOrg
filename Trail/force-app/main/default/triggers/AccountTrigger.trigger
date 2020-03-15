trigger AccountTrigger on Account (after insert) {

    List<Account> c=new List<Account>();
    for(Account parent:Trigger.new)
    {
        Account ch=new Account(parentID=parent.id,name=parent.name);
        c.add(ch);
    }
    
    insert c;
    
}