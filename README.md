# flutter_application_1

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://flutter.dev/docs/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://flutter.dev/docs/cookbook)

For help getting started with Flutter, view our
[online documentation](https://flutter.dev/docs), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

## Requirements

In this section, you should describe all kinds of requirements for your module: functional and non-functional requirements.

### Use case model 

 <p align="center" justify="center">
  <img src="https://github.com/LEIC-ES-2021-22/2LEIC02T2/use-case-diagram.png"/>
</p>

###  Visualize the calendar

|||
| --- | --- |
| *Name* | Visualize the calendar |
| *Actor* |  Student | 
| *Description* | Allows the user to navigate the calendar. The user can navigate by day, week, or month. |
| *Preconditions* | -The user needs to be authenticated.<br> |
| *Postconditions* | |
| *Normal flow* | 1.the user opens the calendary section on the app.<br> 
2. the calendar is synced with Google Calendar and loaded with data of evaluation moments.<br> 
3. the application shows the calendar.<br> 
4.  the user can visualize the calendar and navigate on it as well.<br>
 5. the user can click on an event to check data about it such as the corresponding course subject.<br> 
 6. The system redirects the customer to Electronic Payment.<br>
  7. the user can go back to viewing the calendar.<br>
  8. the user may finally close the calendar section. |
| *Alternative flows and exceptions* | 1. [Payment failure] If, in step 6 of the normal flow the payment fails, the system gives the user the possibility to cancel or retry. |

### Add an event

|||
| --- | --- |
| *Name* | Add an event |
| *Actor* |  Student <br> Professor | 
| *Description* | Allows the user to add one or more events to the calendar. The user introduces information  about the date and the topic each event. If it's added by a professor, the event will be available for all users. If it's added by a student, the event will be visible on the student's calendar. |
| *Preconditions* | - The user has internet access. <br> - The user wants to add an event. |
| *Postconditions* | - The information of an event is added to the calendar. |
| *Normal flow* | 1.the user can add an event by clicking on a date in the calendar.<br> 
2. the application reveals several fields about the new event.<br>
3. the user may or not complete those fields.<br> 
4. the user either concludes the operation (confirming the addition of the event) or cancels it.<br>
 5. if the user is a student, the new event will only show up on his/her calendar (personal event). |
| *Alternative flows and exceptions* | |

### Add a delivery date

|||
| --- | --- |
| *Name* | Add a delivery date |
| *Actor* | Professor | 
| *Description* | Allows the professor to add a delivery date of a project. The professor introduces the deadline date. |
| *Preconditions* | - The user has internet access. <br> - The professor wants to add a delivery date. |
| *Postconditions* | - The delivery date is added to the assignment. |
| *Normal flow* | 
| *Alternative flows and exceptions* | 



### Domain model

To better understand the context of the software system, it is very useful to have a simple UML class diagram with all the key concepts (names, attributes) and relationships involved of the problem domain addressed by your module. 
Also provide a short textual description of each class. 

Example:
 <p text-align="center" justify="center">
  <img src="https://github.com/LEIC-ES-2021-22/2LEIC02T2/domain-model.png"/>
</p>
