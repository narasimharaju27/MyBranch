public class Download {
public blob base64value{get;set;}
public id recid{get;set;}
public Download(){
recid='00P28000001CODF';
}
    public blob down(){
        string str1 = 'string1,';
        string str2 = 'String2,';
        string str3 = 'String3';
        string ReportName = 'Narasimha';
        string str = str1+str2+str3;
        blob base64value = Blob.valueOf(str);
        string csvname = ReportName+'.CSV';
        
        //base64value = EncodingUtil.base64Encode(OpptyBlob);
        return base64value ;

    }
}