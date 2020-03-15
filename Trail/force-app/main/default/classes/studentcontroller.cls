public class studentcontroller {

//public String  student{get;set;}

public String student{
get{return student;}
set{ student=value + 'hello';   }
}

public List<string> studentlist{get;set;}



public studentcontroller()
{
student='abc';
studentlist=new list<string>();
studentlist.add('a');
studentlist.add('b');
}
public PageReference savemethod()
{
PageReference prf=new PageReference('https://www.google.com');
return prf;
}



}