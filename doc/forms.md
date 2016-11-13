# Management Without Borders project documentation

## Current working forms


#### Sign In

The sign in form is intended for the course coordinator to get access to administrative features.
The form will redirect to the admin page if the username and password match the set admin credentials. Otherwise the form will show a notification saying "Invalid credentials".


#### Expression of Interest

The expression of interest form is intended for potential MWB partners.
The form will save the input into the expression_of_interest table if the submittion is successful.
Otherwise it will show a flash notification about missing fields.

#### Project Evaluation

The project evaluation form is intended for partners after they have completed a term with MWB.
The form will save the input into the project_evaluation table if the submittion is successful.

#### Student Rakings

The student rankings form is intended for students that need to evaluate the course projects.
The form will save the input into the student_rankings table if the submittion has ranked 5 unique projects.
Otherwise it will show a flash notification about the error.

#### Admin modifications form

The modifications form is intended for the admin to modify any database information with all tables.
The form is auto generated. It will allow to add, edit and delete information for each model.



