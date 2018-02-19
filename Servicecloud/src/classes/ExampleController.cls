Public with sharing class ExampleController {
   Public List<Test_case__c> Account_List{get;set;}
   Public List<string> Country_List{get;set;}
     
    Public ExampleController (){
      Account_List = New list<Test_case__c>();
      Account_List = [Select name,id from Test_case__c limit 5];
      Country_List = New List<string>();
      Country_List.add('India');
      Country_List.add('United Kingdom');
      Country_List.add('United States');
      Country_List.add('Singapore');
      Country_List.add('Spain');
    } 
}