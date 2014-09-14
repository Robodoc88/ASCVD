ASCVD <- function(gender, race, treated, age, tchol, hdl, sbp, smoking, dm) {
     smoking <- as.numeric(smoking)
     dm <- as.numeric(dm)
     ##Coefficients are different for different gender, race or treatment status
     if ((gender == 0) & (race == 0) & (treated == FALSE)) {
          Coef <- c(-29.799,4.884,13.540,-3.114,-13.578,3.149,1.957,0,
                    7.574, -1.665,0.661,-29.18, 0.9665)
     } 
     if ((gender == 0) & (race == 0) & (treated == TRUE))  {
          Coef <- c(-29.799,4.884,13.540,-3.114,-13.578,3.149,2.019,0,
                    7.574, -1.665,0.661,-29.18, 0.9665)
     }
     if ((gender == 0) & (race == 1) & (treated == FALSE)) {
          Coef <- c(17.114,0,0.94,0,-18.920,4.475,27.820,-6.087,
                    0.691,0,0.874,86.61, 0.9533)
     }
     if ((gender == 0) & (race == 1) & (treated == TRUE)) {
          Coef <- c(17.114,0,0.94,0,-18.920,4.475,29.291,-6.432,
                    0.691,0,0.874,86.61, 0.9533)
     }
     if ((gender == 1) & (race == 0) & (treated == FALSE)) {
          Coef <- c(12.344,0,11.853,-2.664,-7.990,1.769,1.764,0,7.837,
                    -1.795,0.658,61.18,0.9144)
     }
     if ((gender == 1) & (race == 0) & (treated == TRUE)) {
          Coef <- c(12.344,0,11.853,-2.664,-7.990,1.769,1.797,0,7.837,
                    -1.795,0.658,61.18,0.9144)
     }
     if ((gender == 1) & (race == 1) & (treated == FALSE)) {
          Coef <- c(2.469,0,0.302,0,-0.307,0,1.809,0,0.549,0,0.645,19.54,0.8954)
     }
     if ((gender == 1) & (race == 1) & (treated == TRUE)) {
          Coef <- c(2.469,0,0.302,0,-0.307,0,1.916,0,0.549,0,0.645,19.54,0.8954)
     }
     
     ##Transformed variables
     TransVar <- c(log(age), (log(age)^2), log(tchol), log(age)*log(tchol),
                   log(hdl), log(age)*log(hdl), log(sbp), log(age)*log(sbp),
                   smoking, log(age)*smoking, dm)
     
     ##sum of the transformed variables multiplied by corresponding coefficients
     tot <- sum(Coef[1:11]*TransVar)
     
     ##Calculation of risk
     a <- exp(tot - Coef[12])
     risk <- paste(round((1 - (Coef[13]^a))*100,1),"%")
     return(risk)
}