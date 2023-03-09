# Requirements

In this section the requirements for the app (functional and non-functional) will be described, using the requirements engineering principles and tools learned in the theoretical classes.

## Use case model 

In this section some of the functional requirements are stated, with the help of use case modeling. Firstly there are two use case diagrams, one for each of 'WeHere' main users (students and professors) and lastly associated documentation for each of the use cases.

 <p align="center" justify="center">
  <img src="https://github.com/LEIC-ES-2021-22/2LEIC04T4/blob/main/docs/UML_IMG/Student.png"/>
  <img src="https://github.com/LEIC-ES-2021-22/2LEIC04T4/blob/main/docs/UML_IMG/Professor.png"/>
</p>

### Show QR code
|||
| --- | --- |
| *Name* | Show QR code |
| *Actor* |  Student | 
| *Description* | The student opens his personal QR code on its phone, containing information about himself and the class he is right now. |
| *Preconditions* | - The students needs to have internet connection on its phone <br> - The student needs to have a class in that moment so that the QR appears. |
| *Postconditions* | - The student's QR becames available so that the [professor can read it](#read-qr-code). |
| *Normal flow* | 1.The student opens the app 'WeHere'; <br> 2.The student shows the QR.|
| *Alternative flows and exceptions* | 1.[Alternative] The student can not open the QR code. The student should [request the professor to register his presence](#send-request-for-presence), by his name/number, through the 'WeHere' app; <br> 2.[No internet] The student should ask the [professor to register his presence manually](#register-a-presence-manually)|

### Send request for presence
|||
| --- | --- |
| *Name* | Send request for presence |
| *Actor* |  Student | 
| *Description* | The student send a request of presence to the professor. |
| *Preconditions* | - The student needs to have internet connection on its phone; <br> - The student can only make a request for a class he is currently having. |
| *Postconditions* | - [The professor recieves the request, being able to accept/deny it](#recieve-and-handle-a-request).|
| *Normal flow* | 1.The student opens the app 'WeHere'; <br> 2.The student sends the request to mark the presence to the professor.|
| *Alternative flows and exceptions* | 1.[No internet] The student should ask the [professor to register his presence manually](#register-a-presence-manually)|

### Justify absence
|||
| --- | --- |
| *Name* | Justify absence |
| *Actor* |  Student | 
| *Description* | Send a request for the secretary to justify absence. The student can attach a file (for example a medical report) or write text. |
| *Preconditions* | - The student needs to have internet connection on its phone; <br> - The student can only ask for absence justification if he had missed the class. |
| *Postconditions* | - The secretary will handle the absence justification appeal.|
| *Normal flow* | 1.The student opens the app 'WeHere'; <br> 2.The student opens the justify absence tab;<br> 3.The student selects a class/classes that he wants to justify <br> 4.The student can write a text or attatch a file to justify is absence; <br> 5.The secretary will analyze the appeal.|
| *Alternative flows and exceptions* | 1.[No Internet] The student can opt to justify his absence directly with his course secretary.|

### Consult the presence information
|||
| --- | --- |
| *Name* | Consult the presence information |
| *Actor* |  Student | 
| *Description* | The student can consult his history of prensences for all his courses and know how many classes it has missed for each one. This operation doesn't require internet connection, however only with it will the information be updated. |
| *Preconditions* | - For updated information, the student needs to have internet connection on its phone. |
| *Postconditions* | - Consulting doesn't affect the current conditions. |
| *Normal flow* | 1.The student opens the app 'WeHere' <br> 2.The student chooses to see the presence information page. <br> 3. The information is shown by course.
| *Alternative flows and exceptions* | 1. Without internet connection some information is still available. |

### Choose course
|||
| --- | --- |
| *Name* | Choose course |
| *Actor* |  Student | 
| *Description* | The student can choose to see all presence registers from a certain course. |
| *Preconditions* | - The [presence information page](#consult-the-presence-information) should be open. |
| *Postconditions* | - Choosing the course doesn't affect the current conditions. |
| *Normal flow* | 1. The student opens the app 'WeHere' <br> 2. The student chooses to see the presence information page. <br> 3. The information is shown by course. <br> 4. Any course can be selected showing the detailed information. <br> 5. The student can choose to come back to the presence information page and choose another course.
| *Alternative flows and exceptions* | 1. Course cannot be choosen if the presence information page is not opened. |

### Read QR code
|||
| --- | --- |
| *Name* | Read QR code |
| *Actor* |  Professor | 
| *Description* | The professor reads a student QR, using the functionalities of the app 'WeHere'. |
| *Preconditions* | - The student needs to have [shown his QR code](#show-qr-code). |
| *Postconditions* | - The student is [registered as present](#register-presence) in the class. |
| *Normal flow* | 1.The student shows his QR code; <br> 2.The professor opens the camera's app; <br> 3.The app reads the QR and its information; <br> 4.The student is marked as present.|
| *Alternative flows and exceptions* | 1.[No Internet] The professor cannot register the students presence. The professor may register the student's attendance later.|

### Recieve and handle a request
|||
| --- | --- |
| *Name* | Recieve and handle a request |
| *Actor* |  Professor | 
| *Description* | The professor receives a request to mark the presence of a student in class. The professor can refuse or accept to mark the student's presence. |
| *Preconditions* | - The student needs to make a [request to the professor](#send-request-for-presence) in order for him/her to take their attendance; <br> - The professor can only accept the student's request during the class. |
| *Postconditions* | - If the professor accepts the request, it will be [registered that the student attended the class](#register-presence).|
| *Normal flow* | 1.The professor opens the app 'WeHere'; <br> 2.The student sends the request to mark the presence to the professor; <br> 3. The professor accepts or denies the student's attendance request.|
| *Alternative flows and exceptions* | 1.[No Internet] The professor cannot register the students presence. The professor may register the student's attendance later.|

### Register a presence manually
|||
| --- | --- |
| *Name* | Register a presence manually |
| *Actor* |  Professor | 
| *Description* | The professor can access the list of students in the class and mark attendance by name/number|
| *Preconditions* | - The professor needs to have internet connection on its phone. |
| *Postconditions* | - The students who were selected by the professor are [registered as present in the class](#register-presence).|
| *Normal flow* | 1.The professor opens the app 'WeHere'; <br> 2.The professor access the list of students of the class he is teaching; <br> 3.The professor selects the students present in the class; <br> 4.The student is marked as present. |
| *Alternative flows and exceptions* | 1.[No Internet] The professor cannot register the students presence.|

### Consult absences
|||
| --- | --- |
| *Name* | Consult absences |
| *Actor* |  Professor | 
| *Description* | The professor can consult each students number of absences, for all the classes that he is teaching. |
| *Preconditions* | - The professor needs to have internet connection on its phone. |
| *Postconditions* | ---- |
| *Normal flow* | 1.The professor opens the app 'WeHere'; <br> 2.The professor access the list of students of a class he is teaching; <br> 3.He can choose between different classes and [use filters](#choose-filter) to select different students. |
| *Alternative flows and exceptions* | 1.[No Internet] The professor cannot consult the absences record.|

### Choose filter
|||
| --- | --- |
| *Name* |  Choose filter |
| *Actor* |  Professor | 
| *Description* | Choose a filter to select students that respect one set condition (for example, students who have excedeed the number of absences). |
| *Preconditions* | - The professor must be consulting his [students absences](#consult-absences). |
| *Postconditions* | - Only the students that respect the filter condition will be showed. |
| *Normal flow* | 1.Open the 'consult absences' tab; <br> 2.Select the filter option; <br> 3.Choose the wanted filter. |
| *Alternative flows and exceptions* | 1.[No Internet] The professor cannot consult the absences record.|

### Register presence
|||
| --- | --- |
| *Name* | Register presence |
| *Actor* |  System | 
| *Description* | Register the students presence in the system/app |
| *Preconditions* | - One of the three options to mark the presence must have been used: [read QR code](#read-qr-code), [recieved request](#recieve-and-handle-a-request) or [registered manually](#register-a-presence-manually) |
| *Postconditions* | - The student is registered as present in the class.|
| *Normal flow* | 1.One of the three options to mark the presence is used; <br> 2. The precense is registered. |
| *Alternative flows and exceptions* | 1.[No Internet] The presence is not registered. |



## Domain Model

In this section there will be the Domain Model that represents the different classes and interactions with each other.

 <p align="center" justify="center">
  <img src="https://github.com/LEIC-ES-2021-22/2LEIC04T4/blob/main/docs/UML_IMG/DomainModel.png"/>
</p>

The class "User" is a generalization of "Professor" and "Student".
All app users are either a professor or a student.
Users have a name and a current state.

The class "Professor" is a specification of "User".
Professors have an acronym, an unique code and an e-mail.
Professors are related to the classes they teach.
All professors are users.

"Student" class is a specification of "User".
Students have an unique mechanical number, a curricular year, a study cycle (L.EIC, MIEIC ...) and their type (normal, student worker, ...).
Students are related to the classes they attend.
All students are users.

"Class" is represented by a code that indicates the class number, year of the curricular unit and the course.
Example: 1MIEIC04, 2LEIC01, 2LEIC04, ...

"Course" is represented by a code that idicates the course of the lesson associated with the class.

The class "Lesson" have a week day, a start time and a duration.
Lesson is related to the professors who give the lesson and to the students who attend.

"Lesson Instance" is related with "Lesson" and have a week number and a date.

"Student Timetable"  is associated with a student and with the lessons instances he attends.

"Professor Timetable"  is associated with a professor and with the lessons instances he teaches.
