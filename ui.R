require(shiny)
shinyUI(fluidPage(
     headerPanel("What is your risk of developing cardiovascular disease in 10 years?"),
     sidebarPanel(
          h3("ASCVD Calculator"),
          p("All fields must be filled out.", style = "color:red"),
          radioButtons("gender", "Gender:", c("Female" = 0, "Male" = 1), inline = TRUE),
          radioButtons("race", "Race:", c("White" = 0, "African American" = 1, 
                                          "Other" = 0), inline = TRUE),
          numericInput("age", "Age (20-79):", NULL, min = 20, max = 79, step = 1),
          numericInput("tchol", "Total Cholesterol (130 - 320 mg/dL):", NULL, min = 130, max = 320,
                       step = 1),
          numericInput("hdl", "HDL Cholesterol (20 - 100 mg/dL):", NULL, min = 20, max = 100, 
                       step = 1),
          numericInput("sbp", "Systolic Blood Pressure (90 - 200 mm Hg):", NULL, min = 90,
                       max = 200, step = 1),
          checkboxInput("treated", "Check if taking blood pressure medications", value = FALSE),
          br(),
          radioButtons("dm", "Diabetes?", c("YES" = 1, "NO" = 0), selected = 0, inline = TRUE),
          radioButtons("smoking", "Current smoker?", c("YES" = 1, "NO" = 0), selected = 0, inline = TRUE),
          submitButton("Submit")
          ),
     mainPanel(
          h5("Author: Michael Lee", style = 'color:purple'),
          p("This is the course project from the class Developing Data Product.  
            This web page was created with Shiny Package in R."),
          p("The Atherosclerotic Cardiovascular Disease risk estimator (Pooled Cohort  
            Risk Equations) was developed in 2013 by the American College of Cardiology 
             and the American Heart Association in collaboration with National Heart, Lung,
             and Blood Institute and other specialty societies.  The equation was 
            developed from multivariate regression analysis of pooled datasets from Atherosclerosis
            Risk in Communities Study, Cardiovascular Health Study, and the Coronary
            Artery Risk Development in Young Adults Study, combined with the Framingham
            Original and Offspring Study cohorts.  A complex equation, with different
            coefficients for different race and gender, log transformation of continuous
            variables and exponential calculation, it is virtually impossible to calculate
            without a computer.  Using the client-server interface of Shiny package in R, this
            web page calculates the 10-year ASCVD risk based on the values entered from the
            left panel."),
          p("Despite some concerns that the Pooled Cohort Risk Equations overestimate the risks 
            in some population, the guidelines have been generally accepted by the medical community."),
          br(),
          h4("Your 10-year risk of atherosclerotic cardiovascular disease is:", style = 'color:blue'),
          h4(textOutput("risk1"), style = 'color:blue'),
          h4("The risk for individuals with optimal risk factors is:", style = 'color:blue'),
          h4(textOutput("risk2"), style = 'color:blue'),
          p("Optimal risk factors are total cholesterol 170, HDL cholesterol 50, Systolic
            blood pressure 110, not taking medications, no smoking or diabetes."),
          h5("The 2013 ACC/AHA Guideline on the Treatment of Blood Cholesterol to
             Reduce Atherosclerotic Cardiovascular Risk in Adults recommended
             initiation of statin therapy for individuals with:", style = 'color:green'),
          h5("1. Clinical atherosclerotic cardiovascular disease", style = 'color:green'),
          h5("2. Diabetes", style = 'color:green'),
          h5("3. LDL cholesterol > 190 mg/dL", style = 'color:green'),
          h5("4. 10-year ASCVD risk > 7.5%", style = 'color:green'),
          br(),
          br(),
          h5("References"),
          p(a("2013 ACC/AHA Guideline on the Assessment of Cardiovascular Risk. A Report
            of the American College or Cardiology/American Heart Association Task Force 
            on Practice Guidelines. Circulation. 2014; 129:S49-S73",
            href = "http://circ.ahajournals.org/content/129/25_suppl_2/S49")),
          p(a("2013 ACC/AHA Guideline on the Treatment of Blood Cholesterol to Reduce 
            Atherosclerotic Cardiovascular Risk in Adults. A Report of the American 
            College of Cardiology/American heart Association Task Force on Practice 
            Guidelines. Circulation. 2014; 129:S1-S45", 
            href="https://circ.ahajournals.org/content/129/25_suppl_2/S1")),
          p(a("Muntner et.al. Validation of the Atherosclerotic Cardiovascular 
              Disease Pooled Cohort Risk Equations. JAMA. 2014; 311(14): 1406-1415",
              href="http://jama.jamanetwork.com/article.aspx?articleid=1853203")),
          p(a("Michael O'Riordan. New Cardiovascular Disease Risk Calculator Debated Again",
            href="http://www.medscape.com/viewarticle/817814")),
          p(a("http://tools.cardiosource.org/ASCVD-Risk-Estimator/", href = "http://tools.cardiosource.org/ASCVD-Risk-Estimator/"))
          )
))