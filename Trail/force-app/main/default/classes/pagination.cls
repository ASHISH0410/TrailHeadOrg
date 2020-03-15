public class pagination {
ApexPages.StandardSetController mycnt;
Integer pagesize;
    public pagination(ApexPages.StandardSetController controller) {
pagesize=5;

mycnt=controller;
mycnt.setpagesize(pagesize);
    }

}