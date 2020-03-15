public class DealPass {

Contact c;
    public DealPass(ApexPages.StandardController controller) {
 

    }
    
    public PageReference send()
    {
     c=[select id,name from contact where id=:Apexpages.currentpage().getparameters().get('id')];
    Pagereference pf=Page.Deal_Viewer_Screen;
    pf.setRedirect(true);
    pf.getparameters().put('id',c.id);
    return pf;
    }

}