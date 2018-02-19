public class attachclass{
    public list<attachment> atcm{get;set;}
    public set<string> strname{get;set;}
    public attachclass(){
        atcm = [select id,name,body from attachment limit 5 ] ;   
    }
    
    public void save1(){
        strname = new set<string>(); 
        for(attachment atc : atcm ){
            strname.add(atc.name);    
        }
        system.debug(strname + 'This is string' + atcm);
    }
    
    public pagereference save2(){
        system.debug('This is India');
        upsert atcm;
        return null;
    }
}