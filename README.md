
# Team name

## Members

Hugo Gomes - up202004343 <br />
Diogo Silva - up202004288 <br />
Lia Vieira - up202005042 <br />
João Moreira - up202005035 <br />
João Araújo - up202007855 <br />

# Product Name

## Vision Stament
A calendar to provide a more organized life to the everyday student, since nothing is worse than realizing that your deadline was yesterday.

## Main Features
 - Feature 1 - Short description
 - Feature 2 - Short description
...

For help getting started with Flutter, view our
[online documentation](https://flutter.dev/docs), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

## Requirements

In this section, you should describe all kinds of requirements for your module: functional and non-functional requirements.

### Use case model 
![Uml user](https://user-images.githubusercontent.com/80840030/160202981-940749f1-6fd2-47bc-a2e5-e474b5e46238.jpeg)

###  Visualize the calendar

|||
| --- | --- |
| *Name* | Visualize the calendar |
| *Actor* | Student | 
| *Description* | Allows the user to navigate the calendar. The user can navigate by day, week, or month. |
| *Preconditions* | -The user needs to be authenticated.<br> |
| *Normal flow* | 1. The user opens the calendary section on the app <br> 2. The calendar is synced with Google Calendar and loaded with data of evaluation moments <br> 3. The application shows the calendar <br> 4. The user can visualize the calendar and navigate on it as well <br> 5. The user can click on an event to check data about it |
| *Alternative flows and exceptions* | None. |


### Add an event

|||
| --- | --- |
| *Name* | Add an event |
| *Actor* |  Student <br> Professor | 
| *Description* | Allows the user to add one or more events to the calendar. The user introduces information  about the date and the topic each event. If it's added by a professor, the event will be available for all users. If it's added by a student, the event will be visible on the student's calendar. |
| *Preconditions* | -The user has internet access. <br> -The user wants to add an event. |
| *Postconditions* | -The information of an event is added to the calendar. |
| *Normal flow* | 1. The user can add an event by clicking on a date in the calendar <br> 2. The application reveals several fields about the new event <br> 3. The user completes those fields <br> 4. The user concludes the operation (confirming the addition of the event) |
| *Alternative flows and exceptions* | 1. The user can leave some fields incomplete <br> 2. The user can cancel the operation |


### Add a delivery date

|||
| --- | --- |
| *Name* | Add a delivery date |
| *Actor* | Professor | 
| *Description* | Allows the professor to add a delivery date of a project. The professor introduces the deadline date. |
| *Preconditions* | -The user has internet access. <br> -The professor wants to add a delivery date. |
| *Postconditions* | -The delivery date is added to the assignment. |
| *Normal flow* | 1. The teacher can add a delivery date, originating a "major" event which shows up on all calendars of students related to it. |
| *Alternative flows and exceptions* | 1. The teacher can add a new delivery date to an already existing event. |


### Manage an event

|||
| --- | --- |
| *Name* | Manage an event |
| *Actor* | Student <br> Professor | 
| *Description* | Allows the user to update one or more events to the calendar. The user can change information about the date and the topic of an event or delete it.  |
| *Preconditions* | - The user wants to add an event. |
| *Postconditions* | - The information of an event is updated to the calendar. |
| *Normal flow* | 1. The user can edit an event by clicking on it in the calendar (students can't customize "major" events such as evaluation moments). <br> 2. The application reveals several fields about the already existing event. <br> 3. The user edits some fields. <br> 4. The user concludes the operation (confirming the new updates). |
| *Alternative flows and exceptions* | 1. The user can leave the fields as they were. <br> 2. The user can cancel the operation. |


### Domain model

To better understand the context of the software system, it is very useful to have a simple UML class diagram with all the key concepts (names, attributes) and relationships involved of the problem domain addressed by your module. 
Also provide a short textual description of each class. 

Example:

![Domain_model](https://user-images.githubusercontent.com/80840030/161306659-ce1ba5a3-a912-44be-87ab-98306f4b1d6c.png)
