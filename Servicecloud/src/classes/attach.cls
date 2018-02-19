public class attach{
public void attchment(){
Attachment attach = [
    select Body,
        ContentType,
        Name
    from Attachment
    limit 1
];

String attachmentBody = EncodingUtil.base64Encode(attach.Body);
String formattedDateString = Datetime.now().formatGMT('EEE, dd MMM yyyy HH:mm:ss z');
String key = 'AKIAJRGYLHYZA3AI2RKQ';
String secret = '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';
String bucketname = 'erms-phoenix-apac';
String host = 's3.amazonaws.com';
String method = 'PUT';
String filename = attach.Id + '-' + attach.Name;

HttpRequest req = new HttpRequest();
req.setMethod(method);
req.setEndpoint('https://' + bucketname + '.' + host + '/' + bucketname + '/' + filename);
system.debug('https://' + bucketname + '.' + host + '/' + bucketname + '/' + filename);
req.setHeader('Host', bucketname + '.' + host);
req.setHeader('Content-Length', String.valueOf(attachmentBody.length()));
req.setHeader('Content-Encoding', 'UTF-8');
req.setHeader('Content-type', attach.ContentType);
req.setHeader('Connection', 'keep-alive');
req.setHeader('Date', formattedDateString);
req.setHeader('ACL', 'public-read');
req.setBody(attachmentBody);

String stringToSign = 'PUT\n\n' +
    attach.ContentType + '\n' +
    formattedDateString + '\n' +
    '/' + bucketname + '/' + bucketname + '/' + filename;

String encodedStringToSign = EncodingUtil.urlEncode(stringToSign, 'UTF-8');
Blob mac = Crypto.generateMac('HMACSHA1', blob.valueof(stringToSign),blob.valueof(secret));
String signed = EncodingUtil.base64Encode(mac);
String authHeader = 'AWS' + ' ' + key + ':' + signed;
req.setHeader('Authorization',authHeader);
String decoded = EncodingUtil.urlDecode(encodedStringToSign , 'UTF-8');

Http http = new Http();
HTTPResponse res = http.send(req);
System.debug('*Resp:' + String.ValueOF(res.getBody()));
System.debug('RESPONSE STRING: ' + res.toString());
System.debug('RESPONSE STATUS: ' + res.getStatus());
System.debug('STATUS_CODE: ' + res.getStatusCode());
}
}