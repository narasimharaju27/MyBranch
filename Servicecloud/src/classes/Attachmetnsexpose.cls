public class Attachmetnsexpose {

public Attachment[] pictures {
get {
return [SELECT Id,name FROM Attachment ORDER BY CreatedDate ASC];
}
}
}