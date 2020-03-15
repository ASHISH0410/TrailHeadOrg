public class DealViewer {


private integer counter=0;  //keeps track of the offset
   private integer list_size=5; //sets the page size or number of rows
   public integer total_size; //used to show user the total size of the list
   public integer PageNumber;
   public integer TotalPages;
   public string fullname;
   public list<deal__c> data=new list<deal__c>();
   public list<deal_action__c> actions=new list<deal_action__c>();
   
   public list<ImageAssign> mydata=new list<ImageAssign>();
  public ID myid;
  
  public string getfullname()
  {
  
  contact c=[select firstname,lastname from contact where id=:myid];
  
  return (c.firstname+' '+c.lastname);
  }
  
  public list<ImageAssign> getmydata()
  {

  mydata=new list<ImageAssign>();
 
 //contact c=[select id,Deals_Rejected__c from contact where id=:Apexpages.currentpage().getparameters().get('id')];
actions=[SELECT Action__c,Deal__c,Id,contact__c FROM Deal_Action__c where contact__c=:myid];

data=[SELECT Available_Deals__c,Id,Name,Valid_Through__c FROM Deal__c where ( (Valid_Through__c  >=:system.today()) and 
        Available_Deals__c >0) order by Valid_Through__c,Available_Deals__c,Name
       limit :list_size offset :counter];
     
       string url='/servlet/servlet.FileDownload?file=';
      
       string status;
       boolean button;
       integer flag1;
   for(deal__c dd:data){
   flag1=0;
   for(deal_action__c currentaction:actions){
   
  
   if(currentaction.Deal__c==dd.id)
   {
      status=currentaction.action__c;
      button=false;flag1=1; break;
   }
  
   
   }
   if(flag1==0)
   {
    status='Available';
      button=true;
   }
   
   
   
    list<attachment> mf=[select Id,ParentId, Name, Description, LastModifiedDate from Attachment where ParentId = :dd.id ];
  
    if(mf.size()>0){
                               mydata.add(new ImageAssign(dd,url+mf[0].id,true,status,button));
                             
                }
               else{
                     mydata.add(new ImageAssign(dd,'',false,status,button));
                   
               } 
                
                
       }
   
  return mydata;
  }
  
  public class ImageAssign{
  public boolean v{get;set;}
  public deal__c de{get;set;}
  public string imageurl{get;set;}
  public string status{get;set;}
  public boolean buttonstatus{get;set;}
  public ImageAssign(deal__c  mydeal,string img,boolean value_for_image,string mystatus,boolean button){
  
  de=mydeal;
  imageurl=img;
  v=value_for_image;
  status=mystatus;
  buttonstatus=button;
  
  }
  
  } 
  
 
    public DealViewer(ApexPages.StandardController controller) {

         myid=Apexpages.currentpage().getparameters().get('id');
         total_size = [select count() from deal__c where  ( (Valid_Through__c  >=:system.today()) and 
        Available_Deals__c >0) ];

    }
   public Boolean getDisablePrevious() { 
      //this will disable the previous and beginning buttons
      if (counter>0) return false; else return true;
   }

   public Boolean getDisableNext() { //this will disable the next and end buttons
      if (counter + list_size < total_size) return false; else return true;
   }

 public pagereference first()
    {
     counter = 0;
   
    return null;
    }
     public pagereference previous()
    {
       counter -= list_size;
    return null;
    }
     public pagereference last()
    {
       counter = total_size - math.mod(total_size, list_size);
    return null;
    }
     public pagereference next()
    {
         counter += list_size;
    return null;
    }

public Integer getPageNumber() {
      return (counter/list_size + 1);
   }

   public Integer getTotalPages() {
      if (math.mod(total_size, list_size) > 0) {
         return total_size/list_size + 1;
      } else {
         return (total_size/list_size);
      }
   }
   
   public pagereference reject()
   {
   
   contact c=[select id,Deals_Rejected__c from contact where id=:Apexpages.currentpage().getparameters().get('id')];
   c.Deals_Rejected__c=c.Deals_Rejected__c+1;
   update c;
    deal__c d=[SELECT Acceptances__c,Rejections__c,id FROM Deal__c where id=:Apexpages.currentpage().getparameters().get('did') ];
    d.Rejections__c=d.Rejections__c+1;
   update d;
   
   Deal_Action__c da=new Deal_Action__c();
   da.Action__c='Rejected';
   da.Contact__c =c.id;
   da.Deal__c =d.id;
   insert da;
   return null;
   }
   
   
   
   public pagereference done()
   {
  Pagereference pf=Page.Deal_Viewer;
  pf.setredirect(true);
   contact c=[select id,Deals_Accepted__c from contact where id=:Apexpages.currentpage().getparameters().get('id')];
   pf.getparameters().put('id',c.id);
   return pf;
   }
   
   public pagereference accept()
   {
  
   contact c=[select id,Deals_Accepted__c from contact where id=:Apexpages.currentpage().getparameters().get('id')];
   c.Deals_Accepted__c=c.Deals_Accepted__c+1;
   update c;
    deal__c d=[SELECT Acceptances__c,Rejections__c,id FROM Deal__c where id=:Apexpages.currentpage().getparameters().get('did') ];
    d.Acceptances__c=d.Acceptances__c+1;
    update d;
     Deal_Action__c da=new Deal_Action__c();
   da.Action__c='Accepted';
   da.Contact__c =c.id;
   da.Deal__c =d.id;
   insert da;
   return null;
   }
   
 
 
 
 
 
 
    
    

}