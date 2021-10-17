# dataLabs
DataLabs


WORK WITH MYSQL DB WITH THE HELP OF JDBC

1. The task is performed on the basis of the designed database model
lab. works No. 1 and the developed script in No. 3.
2. The database must be deployed using SQL-script.
3. The Java client is created in the form of Maven
project with MySQL connection.
4. The structure of the project is created on the basis of MVC-pattern. Where
the model must contain both a Database Access Layer and a
Business Logic Layer. Implementation of Database Access level
performed on the basis of DAO-pattern.
5. User Interface Layer is implemented as a console
menu. The program must work with
data in the database using JDBC:
• output of data from tables;
• insert data into the table;
• delete data from the table;
• update data in tables.
6. Connect the following plugins to Maven:
Find FindBugs plugin that performs automatic checking
code quality and search for potential errors in the code
❖ PMD plugin
❖ Checkstyle plugin - checks compliance with the code convention

2

When finished, run the command mvn site and
view the results of its execution in the target / site folder
In the code it is necessary to correct all errors which will find plug-ins FindBugs,
PMD and Checkstyle (except for remoteness errors
comments).