public class mySecondController {
    Account account;

    public Account getAccount() {
        if(account == null) account = new Account();
        return account;
    }

    public static PageReference save() {
        string strq= 'https://sec.paymentexpress.com/pxmi3/EF4054F622D6C4C1B9D71EF353F1D999C6F316808B0D5A0B5D39F0010AC526EA6E14172309C56D907';
        PageReference pageRef = new PageReference(strq);
        return pageref;
    }
}