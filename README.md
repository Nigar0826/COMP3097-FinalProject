
PRIORITASK – Your Smart Task Manager
Description:
PRIORITASK is a powerful and intuitive iOS task management app built with SwiftUI and Core Data. It helps users organize their daily tasks efficiently, track progress, and stay productive with a clean interface, customizable priorities, offline access, and engaging visuals. Whether you're a student, professional, or a busy multitasker, this app ensures you stay on top of everything.
 
Features
•	Dark Mode UI with modern color contrast and accessibility.
•	Create, update, and delete tasks easily.
•	Offline access with Core Data persistence.
•	Due date and priority pickers.
•	Task status indicators: Completed, Incomplete, Overdue, Due Soon.
•	Forgot password screen and login/signup system using UserDefaults.
•	Custom reusable text fields for form consistency.
•	Simple and intuitive design optimized for users.
 
Motivation
Our team wanted to create a reliable and clean task manager tailored for students and individuals juggling multiple responsibilities. Our goal was to solve these key challenges:
•	Forgetting tasks or deadlines.
•	Poor time management.
•	Lack of motivation and task visibility.
•	Need for productivity tools with clean UI and smooth UX.
 
What We Learned
•	Core Data: Modeling persistent data, CRUD operations, local storage.
•	SwiftUI: View hierarchies, navigation, toggle states, and dynamic binding.
•	GitHub Collaboration: Managing shared codebases, commits, branches.
•	UI/UX Design: Building accessible and professional interfaces.
•	Teamwork: Assigning roles, resolving merge conflicts, and agile development.
 
Screens Implemented
Screen	Description
LaunchView	Branding + tagline + navigation to login
SignUpView	Form with full name, email, password, local validation
LoginView	Auth with email & password + navigation
ForgotPasswordView	Reset link simulation and alert confirmation
ProfileView	Displays stored user name and email + logout button
DashboardView	Lists all tasks with filters, status, due logic
TaskCreationView	Allows adding new tasks with form fields
TaskDetailView	Edit/delete an existing task with confirmation alert
 
Technologies Used
•	SwiftUI – modern iOS declarative UI framework.
•	Core Data – persistent local storage for task management.
•	UserDefaults – for lightweight user profile/session management.
•	Xcode – for development and iOS simulation.
 
How to Run the App
1.	Clone the Repository: git clone https://github.com/Nigar0826/COMP3097-FinalProject
2.	Open app in Xcode.
3.	Select simulator or real device
4.	Run the App.
 
 
Team Contributions
Member	Contribution
Nigar Ahmadova	LaunchView, LoginView, SignUpView, ProfileView (initial)
Fatima Arab	Core Data (PersistenceController), TaskModel setup
Luilson Sousa Dos Reis	DashboardView and TaskCreationView implementation
Justin Yeh	TaskDetailView and ProfileView enhancements
Fab Pisco	ForgotPasswordView, CustomTextField component, README documentation

