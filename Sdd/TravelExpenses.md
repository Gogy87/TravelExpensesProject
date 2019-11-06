# Travel Expenses

## Requirements

1.	Your task is to cover simple Travel Expenses.
2.	You need a document where you can enter destination and costs.
3.	Document should have several types of cost (mileage, road cost, accommodation, time).
4.	Types of cost must be settable. Defaults must be created with wizard.
5.	Some of the costs are reimbursable.
6.	On the end they must be posted to the employee connected vendor.
7.	If vendor does not exists it needs to be created when posting document.
8.	After posting document the data should be moved to readonly tables.
9.	Your vendor entries should be marked with extra field that shows travel expenses.

## Design

### Data Design

- Travel Order Header
- Travel Order Line
- Posted Travel Order Header
- Posted Travel Order Line
- Travel Order Setup
- Travel Cost
- Travel Locations
- Travel Transportation

### Data flow

## User Interface

### User as a traveler

When user starts a journey he/she will open Travel Order and write following info:

- Start Date
- End Date
- Destination
- Transport Type

After document is released, approver must approve or reject the document.

### User as Approver

Approver will approve or reject Travel Order document. 

### User as a traveler when trip is finished

When traveler is back he/she will enter cost that occurred on the trip.

### User as Accountant

Accountant will open released document and he/she will check if the document is ok. If document is Ok, accountant posts the document.





