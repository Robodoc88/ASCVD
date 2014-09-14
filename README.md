ASCVD
=====

Course Project for Developing Data Products

This is the repository of the course project for the Developing Data Products.  The assignment is to create an interactive website that take the input, processed by the server and output back on the website.  This project uses Shiny package in R and includes `ui.R` and `server.R` files.  The webpage is hosted by Rstudio's Shiny server.

The `ui.R` file contains R codes for taking input from the user.  The variables include gender, race, age, total cholesterol, HDL cholesterol, systolic blood pressure, treatment status of blood pressure, smoking status and diabetes.  The main panel includes the result of the calculation, explanation of the Pooled Cohort Risk Equations, how it was derived, and references of the sources.  It also explained how the calculated risk would influence on the treatment recommendation.

The `server.R` file contains the complex calculation of the risk based on the Pooled Cohort Risk Equations, including different regression coefficients with different race and gender.  The result is sent to `ui.R` file for output.

Michael Lee
