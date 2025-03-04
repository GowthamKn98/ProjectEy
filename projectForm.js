import { LightningElement, track } from 'lwc';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';
import saveProject from '@salesforce/apex/ProjectController.saveProject';

export default class ProjectForm extends LightningElement 
{
    @track projectName = '';
    @track startDate = '';
    @track endDate = '';
    @track status = '';
    @track statusOptions = [
        { label: 'Not Started', value: 'Not Started' },
        { label: 'In Progress', value: 'In Progress' },
        { label: 'Completed', value: 'Completed' }
    ];

    handleNameChange(event) {
        this.projectName = event.target.value;
    }

    handleStartDateChange(event) {
        this.startDate = event.target.value;
    }

    handleEndDateChange(event) {
        this.endDate = event.target.value;
    }

    handleStatusChange(event) {
        this.status = event.target.value;
    }

    handleSave() 
    {
        
        if (!this.projectName || !this.startDate || !this.endDate || !this.status) 
        {
            this.dispatchEvent(
                new ShowToastEvent(
                    {
                        title: 'Error',
                        message: 'Please fill in all fields',
                        variant: 'error'
                    })
            );
            return;
        }

       
        saveProject(
        { 
            name: this.projectName, 
            startDate: this.startDate, 
            endDate: this.endDate, 
            status: this.status 
        })
            .then(() => 
            {
                this.dispatchEvent(
                    new ShowToastEvent(
                    {
                        title: 'Success',
                        message: 'Project saved successfully',
                        variant: 'success'
                    })
                );
                
                this.projectName = '';
                this.startDate = '';
                this.endDate = '';
                this.status = '';
            })
            .catch((error) => 
            {
                this.dispatchEvent(
                    new ShowToastEvent(
                    {
                        title: 'Error',
                        message: error.body.message,
                        variant: 'error'
                    })
                );
            });
    }
}