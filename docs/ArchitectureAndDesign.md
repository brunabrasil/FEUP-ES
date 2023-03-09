## Architecture and Design

In this section, our architecture is described in two ways: the logical and physical views.

### Logical architecture

In this subsection, the Logical View, the high-level logical structure of the code, is represented using a UML package diagram.

The app WeHere is divided is to be divided in three layers: UI, logic and database.
The UI renders the model and sends user input to the logic.
The logic handles the information from the users (students or professors) and their classes from the database so it can be readable and alters the database when needed. The logic of the app is also responsible for the communication with the secretary.
The database has is data taken from sigarra and when its information is updated sends back the same data to Sigarra's system.

<img width="464" alt="logical" src="https://user-images.githubusercontent.com/72560212/164050950-177297bc-c304-4d01-843f-782ac77f1ee8.png">

### Physical architecture

The high-level physical structure of the software system is represented using UML deployment diagrams (Deployment View).

The WeHere app is installed in the user's smarthphone.
It stores information about users in an SQLite database. The app uses Sigarra data to get information about students, professors and their courses. The data altered by the app is sent to the Sigarra system.
The app communicates with the secretary's help desk via student's e-mail.
 
<img width="467" alt="physical" src="https://user-images.githubusercontent.com/72560212/164050799-62fa9cf2-269a-4150-a33f-8aa1dfed06a3.png">
