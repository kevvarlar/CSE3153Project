# CSE3153Project

To connect to the Database

1. You have to make sure you run the CreateUser.sql file.

2. In your SSMS right click on the server name under Object Explorer.

3. When the popup opens up look all the way down to "Properties"

4. A menu will open up, now go to "Security" (Should be the 4th thing that shows up)

5. Look under Server authentication and change it to "SQL Server and Windows Authentication mode"

To run the program

1. Make sure you have Maven installed, if you have not then install it.

2. Run "mvn clean compile exec:java -D maven.compiler.source=21 -D maven.compiler.target=21 -D exec.mainClass="Main" in this directory.
