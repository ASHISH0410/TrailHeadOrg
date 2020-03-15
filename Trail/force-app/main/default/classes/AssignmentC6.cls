public class AssignmentC6 {
   List<SelectOption> options1{get;set;}

   
       public String getFruit() {
        return fruit;
    }

    public void setFruit(String fruit) {
        this.fruit=fruit;
    }
     public void setCountries(String countries) {
        this.countries=countries;
    }

public string countries{get;set;}
public string fruit{get;set;}

   

public string change()
{
options1= new List<SelectOption>();

      if(getCountries().equals('A')){
              system.debug('A selected');
             options1.add(new SelectOption('NONE','NONE'));    
         options1.add(new SelectOption('APPLE','APPLE'));
        options1.add(new SelectOption('APRICOT','APRICOT')); 
        }
        else  if(getCountries().equals('B'))
        {
         options1.add(new SelectOption('NONE','NONE'));    
        options1.add(new SelectOption('BANANA','BANANA'));
        options1.add(new SelectOption('BLUEBERRY','BLUEBERRY')); 

  
        }
        else
        {
        options1.add(new SelectOption('NONE','NONE'));
        }
        
return null;

}

    public list<SelectOption> getItems() {
List<SelectOption> options = new List<SelectOption>();
        options.add(new SelectOption('NONE','NONE'));
        options.add(new SelectOption('A','A'));
        options.add(new SelectOption('B','B')); 
   
        return options;
    }
  public list<SelectOption> getItems1() {


        return options1;
    }
    public String getCountries() {
        return countries;
    }


    public PageReference save() {
        return null;
    }

}