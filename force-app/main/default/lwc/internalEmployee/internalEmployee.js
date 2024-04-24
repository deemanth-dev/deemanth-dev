import { LightningElement, track } from 'lwc';
import searchEmployees from '@salesforce/apex/EmployeeController.searchEmployees';
 
export default class InternalEmployeeParent extends LightningElement {
    @track employeeData;
 
    handleSearch(event) {
        const searchKey = event.target.value;
        if (searchKey.length >= 1) {
            searchEmployees({ searchKey: searchKey })
                .then(result => {
                    this.employeeData = result;
                })
                .catch(error => {
                    console.error('Error occurred:', error);
                });
        } else {
            this.employeeData = null;
        }
    }
   
}