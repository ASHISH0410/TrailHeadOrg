public class A7controller {
public String countries{get;set;}
public String gender{get;set;}
public String hobbies{get;set;}
public string data{get;set;}

    public A7controller()
    {
        gender='Male';
    }

  public string getdata()
    {
        return data;
    }

    public string getcountries()
    {
        return countries;
    }
        public string getgender()
    {
        return gender;
    }
    
      public string gethobbies()
    {
        return hobbies;
    }
   public  list<SelectOption> getitems()
    {
        List<SelectOption> options = new List<SelectOption>();
        options.add(new SelectOption('India','India'));
        options.add(new SelectOption('US','US'));
        options.add(new SelectOption('South Africa','South Africa')); 
        return options;
        
    }
     public  list<SelectOption> getitems1()
    {
        List<SelectOption> options = new List<SelectOption>();
        options.add(new SelectOption('Male','Male'));
        options.add(new SelectOption('Female','Female'));
        return options;
        
    }
      public  list<SelectOption> getitems2()
    {
        List<SelectOption> options = new List<SelectOption>();
        options.add(new SelectOption('Reading','Reading'));
        options.add(new SelectOption('Dancing','Dancing'));
        options.add(new SelectOption('Singing','Singing'));
        return options;
        
    }
    
  //  public PageReference onclick() {
   // system.debug('events...........' + countries);
    
   // return null;
//}


    
    
    
    public pagereference save()
    {
        pagereference p=null;
        if(gender==null)
        {
            p=Page.fail;
            p.getParameters().put('error','noParam');
        }
   else
   {
        p=Page.success;
       data='Selected country:'+countries+'-->Selected Hobby:'+hobbies+' Gender:'+gender;  
         p.getParameters().put('error','pass');
    
   }

        p.setRedirect(true);
        return p;
    }
    
 
    public void setcountries(string countries)
    {
    this.countries=countries;
    }
    
     public void setgender(string gender)
    {
    this.gender=gender;
    }
     public void hobbies(string hobbies)
    {
    this.hobbies=hobbies;
    }
    
    
    
    
}