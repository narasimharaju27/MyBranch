public with sharing class AccountController {
//Test additions
    @AuraEnabled
    public static List<Account> findAll() {
        return [SELECT id, name FROM Account LIMIT 1000];
    }

    @AuraEnabled
    public static List<Account> findByName(String searchKey) {
        system.debug(searchKey + 'This is India');
        String name = '%' + searchKey + '%';
        return [SELECT id, name FROM Account WHERE name LIKE :name LIMIT 50];
    }

    @AuraEnabled
    public static Account findById(String AccountId) {
        return [SELECT id, name FROM Account WHERE Id = :AccountId];
    }

}
