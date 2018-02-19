public with sharing class TextareaController {
    public Boolean blndisplay{get;set;}
    public TextareaController(ApexPages.StandardController controller) {
        blndisplay = false;
    }
    public void textboxs() {
        blndisplay  = true;
    }

}