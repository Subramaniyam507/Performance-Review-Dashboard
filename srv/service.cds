using {com.learning.smartcontrols as db} from '../db/schema';

/**
 * Review Service - For SmartTable, SmartFilterBar, SmartForm
 */
service ReviewService @(impl : './serviceImpl')@(path: '/odata/v4/review') {

    @cds.redirection.target
    entity Reviews as projection on db.Reviews
        actions {
            action submit();
            action approve();
            action reject();
        };

    entity Employees as projection on db.Employees;

    // Read-only for value helps
    @readonly entity Departments as projection on db.Departments;
    @readonly entity Statuses as projection on db.Statuses;
}

/**
 * Goal Service - For Tree Table, Inline Editing, Charts
 */
service GoalService @(impl : './serviceImpl') @(path: '/odata/v4/goal') {

    @cds.redirection.target
    entity Goals as projection on db.Goals
        actions {
            action updateProgress(progress : Integer);
            action complete();
        };

    entity Reviews as projection on db.Reviews;
    entity Employees as projection on db.Employees;

    // Read-only for value helps
    @readonly entity Categories as projection on db.Categories;
    @readonly entity Priorities as projection on db.Priorities;
    @readonly entity Statuses as projection on db.Statuses;
    function getSomthing() returns String;
} 
