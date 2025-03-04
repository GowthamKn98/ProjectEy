public with sharing class ProjectController 
{
    @AuraEnabled(cacheable=true)
    public static List<Project__c> getProjectsByStatus(String status) 
    {
        return [SELECT Id, Name, Start_Date__c, End_Date__c, Status__c, Account__r.Name 
                FROM Project__c 
                WHERE Status__c = :status];
    }

    
    public static List<Project__c> searchProjectsByName(String searchTerm) 
    {
        String searchQuery = 'FIND \'' + searchTerm + '*\' IN ALL FIELDS RETURNING Project__c(Id, Name, Start_Date__c, End_Date__c, Status__c)';
        List<List<SObject>> searchResults = Search.query(searchQuery);
        return (List<Project__c>) searchResults[0];
    }

    
    @AuraEnabled
    public static void updateProjectStatus(String projectId, String status) 
    {
        Project__c proj = [SELECT Id, Status__c FROM Project__c WHERE Id = :projectId];
        proj.Status__c = status;
        update proj;
    }
}