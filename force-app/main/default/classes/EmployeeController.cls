public with sharing class EmployeeController {
   
    @AuraEnabled(cacheable=true)
    public static List<Employee__c> searchEmployees(String searchKey) {
        // Check if the current user has permission to query the Employee__c object
        if (!Schema.sObjectType.Employee__c.isAccessible()) {
            // Handle the case where the user doesn't have permission
            throw new AuraHandledException('Insufficient access to Employee records.');
        }

        String searchQuery = '%' + searchKey + '%';
        return [SELECT Id, Name, Employee_Name__c FROM Employee__c WHERE Name LIKE :searchQuery LIMIT 10];
    }
}
