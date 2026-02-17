namespace com.learning.smartcontrols;

using {
    cuid,
    managed
} from '@sap/cds/common';

/**
 * Employees - Simple master data
 */
entity Employees : cuid, managed {
    employeeID      : String(10) @title: 'Employee ID';
    name            : String(100) @title: 'Name' @mandatory;
    email           : String(100) @title: 'Email';
    department      : String(50) @title: 'Department';
    position        : String(100) @title: 'Position';
    manager         : Association to Employees @title: 'Manager';
}

/**
 * Performance Reviews
 */
entity Reviews : cuid, managed {
    reviewID        : String(10) @title: 'Review ID';
    employee        : Association to Employees @title: 'Employee' @mandatory;
    reviewer        : Association to Employees @title: 'Reviewer' @mandatory;
    period          : String(20) @title: 'Period'; // Q1 2025, Q2 2025
    status          : String(20) @title: 'Status' default 'Draft';
    rating          : Decimal(3, 2) @title: 'Rating'; // 0.00 to 5.00
    comments        : String(2000) @title: 'Comments';
    
    // Composition - Goals belong to this review
    goals           : Composition of many Goals on goals.review = $self;
}

/**
 * Goals - Navigate from Review to Goals
 */
entity Goals : cuid, managed {
    goalID          : String(10) @title: 'Goal ID';
    review          : Association to Reviews @title: 'Review' @mandatory;
    employee        : Association to Employees @title: 'Employee' @mandatory;
    title           : String(200) @title: 'Goal Title' @mandatory;
    description     : String(2000) @title: 'Description';
    category        : String(50) @title: 'Category'; // Technical, Leadership, etc.
    priority        : String(20) @title: 'Priority' default 'Medium';
    progress        : Integer @title: 'Progress %' default 0; // 0-100
    status          : String(20) @title: 'Status' default 'In Progress';
    dueDate         : Date @title: 'Due Date';
}

/**
 * Code Lists for Dropdowns
 */
entity Departments {
    key code : String(50);
    name     : String(100);
}

entity Statuses {
    key code : String(20);
    name     : String(50);
}

entity Categories {
    key code : String(50);
    name     : String(100);
}

entity Priorities {
    key code : String(20);
    name     : String(50);
}
