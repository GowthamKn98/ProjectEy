# ProjectEy

## Overview
. This project demonstrates automation in Salesforce using Apex, Lightning Web Components (LWC), Flows, Approval Processes, REST API integrations, and batch Apex. It includes a custom object (Project__c) and various automation processes to manage project records.

##Setup Instructions

##1. Custom Object and Fields
. Create a custom object named Project__c with the following fields:
. Name (Text)
. Status__c (Picklist: Draft, In Progress, Completed)
. Description__c (Text Area)
. Start_Date__c (Date)
. End_Date__c (Date)

#Steps that i follow:

Go to Setup > Object Manager > Create > Custom Object.
. Add the fields listed above.

## 2. Apex Classes and Trigger
. Apex Class: ProjectController.cls
. Contains methods to update project status, fetch records using SOQL, and search records using SOSL.
. Test Class: ProjectControllerTest.cls
. Provides test cases to ensure 75% code coverage.

# Trigger: ProjectTrigger.trigger

. Automatically updates the Description__c field when a project is created.
. Deploy the Apex classes and trigger using VS Code or Salesforce DX.

## 3. Lightning Web Component (LWC)
. Component Name: projectForm
. Displays and updates project records.
. Includes a dynamic form with validation.

.. Steps that i follow:

. Deploy the LWC using VS Code.
. Add the component to a Lightning page.

##4. Flow for Field Updates
. Go to Setup > Flows.
. Create a Record-Triggered Flow on the Project__c object.
. Add a condition to check if Status__c is "Completed".
. Add an action to update the End_Date__c field to today's date.

## 5. Test Classes
. Test Class: ProjectContollerTest.cls
. Validates the functionality of the ProjectController class.
. Ensures 75% code coverage.

## My Salesforce Learning Journy
. As a fresher, I am not yet familiar with Integration and Batch Apex, but I have recently started studying these topics. For now, I am skipping Integration, Batch Apex, and Approval Processes. Additionally, I am not working with CSV files, as I am manually creating custom objects for this project. I have tried my best with the current knowledge i have.

## Contributors
[ GOWTHAM KN]
