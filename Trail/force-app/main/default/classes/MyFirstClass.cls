public class MyFirstClass {

string []month=new string[12];
string data;
public string getShow()
{
month[0]='january';
month[1]='february';
month[2]='march';
month[3]='april';
month[4]='may';
month[5]='june';
month[6]='july';
month[7]='august';
month[8]='september';
month[9]='october';
month[10]='november';
month[11]='december';


data='';
for(integer i=0;i<=11;i++)
{
if(i!=11)data=data+month[i]+'>';
else data=data+month[i];


}

    system.debug('adding message');
return data;

}






}