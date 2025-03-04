@isTest
public class ProjectControllerTest 
{
    @isTest
    static void testGetProjectsByStatus() 
    {
        
        Account acc = new Account(Name = 'Test Account');
        insert acc;

        Project__c proj = new Project__c(
            Name = 'Test Project',
            Start_Date__c = Date.today(),
            End_Date__c = Date.today().addDays(30),
            Status__c = 'Not Started',
            Account__c = acc.Id
        );
        insert proj;

        Test.startTest();
        List<Project__c> projects = ProjectController.getProjectsByStatus('Not Started');
        Test.stopTest();

        // Verify the results
        System.assertEquals(1, projects.size());
        System.assertEquals('Test Project', projects[0].Name);
    }

    @isTest
    static void testUpdateProjectStatus() 
    {
        
        Project__c proj = new Project__c(
            Name = 'Test Project',
            Start_Date__c = Date.today(),
            End_Date__c = Date.today().addDays(30),
            Status__c = 'Not Started'
        );
        insert proj;

        
        Test.startTest();
        ProjectController.updateProjectStatus(proj.Id, 'Completed');
        Test.stopTest();

        
        Project__c updatedProj = [SELECT Status__c FROM Project__c WHERE Id = :proj.Id];
        System.assertEquals('Completed', updatedProj.Status__c);
    }
}