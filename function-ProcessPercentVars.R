################################################################################
# Function: Process Percentage Variables
################################################################################
################################################################################
# Create function that can process variables in percentage range format.
# Where perc is the variable in percentage range format.
################################################################################

ProcessPercentVars <- function(dataset, sampleSizeVar, percVar) {
    
    # Create minimum, maximum, and mean value of numeric and percentage range
    #   variables.
    percVarMIN <- paste(percVar, "MIN", sep="")
    percVarMAX <- paste(percVar, "MAX", sep="")
    percVarMEAN <- paste(percVar, "MEAN", sep="")
    numVarMIN <- paste(percVar, "MINnum", sep="")
    numVarMAX <- paste(percVar, "MAXnum", sep="")
    numVarMEAN <- paste(percVar, "MEANnum", sep="")
    
    # Convert percentage range variable into character variable.
    dataset[[percVar]] <- as.character(dataset[[percVar]])
    
    # Convert percentage range: to minimum value.
    dataset[[percVarMIN]][dataset[[percVar]] == "LT50"] <- 0
    dataset[[percVarMIN]][dataset[[percVar]] == "GE50"] <- 50
    dataset[[percVarMIN]][dataset[[percVar]] == "LE20"] <- 0
    dataset[[percVarMIN]][dataset[[percVar]] == "21-39"] <- 21
    dataset[[percVarMIN]][dataset[[percVar]] == "40-59"] <- 40
    dataset[[percVarMIN]][dataset[[percVar]] == "60-79"] <- 60
    dataset[[percVarMIN]][dataset[[percVar]] == "GE80"] <- 80
    dataset[[percVarMIN]][dataset[[percVar]] == "LE10"] <- 0
    dataset[[percVarMIN]][dataset[[percVar]] == "11-19"] <- 11
    dataset[[percVarMIN]][dataset[[percVar]] == "20-29"] <- 20
    dataset[[percVarMIN]][dataset[[percVar]] == "30-39"] <- 30
    dataset[[percVarMIN]][dataset[[percVar]] == "40-49"] <- 40
    dataset[[percVarMIN]][dataset[[percVar]] == "50-59"] <- 50
    dataset[[percVarMIN]][dataset[[percVar]] == "60-69"] <- 60
    dataset[[percVarMIN]][dataset[[percVar]] == "70-79"] <- 70
    dataset[[percVarMIN]][dataset[[percVar]] == "80-89"] <- 80
    dataset[[percVarMIN]][dataset[[percVar]] == "GE90"] <- 90
    dataset[[percVarMIN]][dataset[[percVar]] == "LE5"] <- 0
    dataset[[percVarMIN]][dataset[[percVar]] == "6-9"] <- 6
    dataset[[percVarMIN]][dataset[[percVar]] == "10-14"] <- 10
    dataset[[percVarMIN]][dataset[[percVar]] == "15-19"] <- 15
    dataset[[percVarMIN]][dataset[[percVar]] == "20-24"] <- 20
    dataset[[percVarMIN]][dataset[[percVar]] == "25-29"] <- 25
    dataset[[percVarMIN]][dataset[[percVar]] == "30-34"] <- 30
    dataset[[percVarMIN]][dataset[[percVar]] == "35-39"] <- 35
    dataset[[percVarMIN]][dataset[[percVar]] == "40-44"] <- 40
    dataset[[percVarMIN]][dataset[[percVar]] == "45-49"] <- 45
    dataset[[percVarMIN]][dataset[[percVar]] == "50-54"] <- 50
    dataset[[percVarMIN]][dataset[[percVar]] == "55-59"] <- 55
    dataset[[percVarMIN]][dataset[[percVar]] == "60-64"] <- 60
    dataset[[percVarMIN]][dataset[[percVar]] == "65-69"] <- 65
    dataset[[percVarMIN]][dataset[[percVar]] == "70-74"] <- 70
    dataset[[percVarMIN]][dataset[[percVar]] == "75-79"] <- 75
    dataset[[percVarMIN]][dataset[[percVar]] == "80-84"] <- 80
    dataset[[percVarMIN]][dataset[[percVar]] == "85-89"] <- 85
    dataset[[percVarMIN]][dataset[[percVar]] == "90-94"] <- 90
    dataset[[percVarMIN]][dataset[[percVar]] == "GE95"] <- 95
    dataset[[percVarMIN]][dataset[[percVar]] == "LE1"] <- 0
    dataset[[percVarMIN]][dataset[[percVar]] == "GE99"] <- 99
    dataset[[percVarMIN]][is.na(dataset[[percVarMIN]])] <- as.numeric(dataset[[percVar]][is.na(dataset[[percVarMIN]])])
    
    # Convert percentage range: to maximum value.
    dataset[[percVarMAX]][dataset[[percVar]] == "LT50"] <- 49
    dataset[[percVarMAX]][dataset[[percVar]] == "GE50"] <- 100
    dataset[[percVarMAX]][dataset[[percVar]] == "LE20"] <- 20
    dataset[[percVarMAX]][dataset[[percVar]] == "21-39"] <- 39
    dataset[[percVarMAX]][dataset[[percVar]] == "40-59"] <- 59
    dataset[[percVarMAX]][dataset[[percVar]] == "60-79"] <- 79
    dataset[[percVarMAX]][dataset[[percVar]] == "GE80"] <- 100
    dataset[[percVarMAX]][dataset[[percVar]] == "LE10"] <- 10
    dataset[[percVarMAX]][dataset[[percVar]] == "11-19"] <- 19
    dataset[[percVarMAX]][dataset[[percVar]] == "20-29"] <- 29
    dataset[[percVarMAX]][dataset[[percVar]] == "30-39"] <- 39
    dataset[[percVarMAX]][dataset[[percVar]] == "40-49"] <- 49
    dataset[[percVarMAX]][dataset[[percVar]] == "50-59"] <- 59
    dataset[[percVarMAX]][dataset[[percVar]] == "60-69"] <- 69
    dataset[[percVarMAX]][dataset[[percVar]] == "70-79"] <- 79
    dataset[[percVarMAX]][dataset[[percVar]] == "80-89"] <- 89
    dataset[[percVarMAX]][dataset[[percVar]] == "GE90"] <- 100
    dataset[[percVarMAX]][dataset[[percVar]] == "LE5"] <- 5
    dataset[[percVarMAX]][dataset[[percVar]] == "6-9"] <- 9
    dataset[[percVarMAX]][dataset[[percVar]] == "10-14"] <- 14
    dataset[[percVarMAX]][dataset[[percVar]] == "15-19"] <- 19
    dataset[[percVarMAX]][dataset[[percVar]] == "20-24"] <- 24
    dataset[[percVarMAX]][dataset[[percVar]] == "25-29"] <- 29
    dataset[[percVarMAX]][dataset[[percVar]] == "30-34"] <- 34
    dataset[[percVarMAX]][dataset[[percVar]] == "35-39"] <- 39
    dataset[[percVarMAX]][dataset[[percVar]] == "40-44"] <- 44
    dataset[[percVarMAX]][dataset[[percVar]] == "45-49"] <- 49
    dataset[[percVarMAX]][dataset[[percVar]] == "50-54"] <- 54
    dataset[[percVarMAX]][dataset[[percVar]] == "55-59"] <- 59
    dataset[[percVarMAX]][dataset[[percVar]] == "60-64"] <- 64
    dataset[[percVarMAX]][dataset[[percVar]] == "65-69"] <- 69
    dataset[[percVarMAX]][dataset[[percVar]] == "70-74"] <- 74
    dataset[[percVarMAX]][dataset[[percVar]] == "75-79"] <- 79
    dataset[[percVarMAX]][dataset[[percVar]] == "80-84"] <- 84
    dataset[[percVarMAX]][dataset[[percVar]] == "85-89"] <- 89
    dataset[[percVarMAX]][dataset[[percVar]] == "90-94"] <- 94
    dataset[[percVarMAX]][dataset[[percVar]] == "GE95"] <- 100
    dataset[[percVarMAX]][dataset[[percVar]] == "LE1"] <- 1
    dataset[[percVarMAX]][dataset[[percVar]] == "GE99"] <- 100
    dataset[[percVarMAX]][is.na(dataset[[percVarMAX]])] <- as.numeric(dataset[[percVar]][is.na(dataset[[percVarMAX]])])
    
    # Convert percentage range: to mean value.
    dataset[[percVarMEAN]][dataset[[percVar]] == "LT50"] <- mean(c(0, 49))
    dataset[[percVarMEAN]][dataset[[percVar]] == "GE50"] <- mean(c(50, 100))
    dataset[[percVarMEAN]][dataset[[percVar]] == "LE20"] <- mean(c(0, 20))
    dataset[[percVarMEAN]][dataset[[percVar]] == "21-39"] <- mean(c(21, 39))
    dataset[[percVarMEAN]][dataset[[percVar]] == "40-59"] <- mean(c(40, 59))
    dataset[[percVarMEAN]][dataset[[percVar]] == "60-79"] <- mean(c(60, 79))
    dataset[[percVarMEAN]][dataset[[percVar]] == "GE80"] <- mean(c(80, 100))
    dataset[[percVarMEAN]][dataset[[percVar]] == "LE10"] <- mean(c(0, 10))
    dataset[[percVarMEAN]][dataset[[percVar]] == "11-19"] <- mean(c(11, 19))
    dataset[[percVarMEAN]][dataset[[percVar]] == "20-29"] <- mean(c(20, 29))
    dataset[[percVarMEAN]][dataset[[percVar]] == "30-39"] <- mean(c(30, 39))
    dataset[[percVarMEAN]][dataset[[percVar]] == "40-49"] <- mean(c(40, 49))
    dataset[[percVarMEAN]][dataset[[percVar]] == "50-59"] <- mean(c(50, 59))
    dataset[[percVarMEAN]][dataset[[percVar]] == "60-69"] <- mean(c(60, 69))
    dataset[[percVarMEAN]][dataset[[percVar]] == "70-79"] <- mean(c(70, 79))
    dataset[[percVarMEAN]][dataset[[percVar]] == "80-89"] <- mean(c(80, 89))
    dataset[[percVarMEAN]][dataset[[percVar]] == "GE90"] <- mean(c(90, 100))
    dataset[[percVarMEAN]][dataset[[percVar]] == "LE5"] <- mean(c(0, 5))
    dataset[[percVarMEAN]][dataset[[percVar]] == "6-9"] <- mean(c(6, 9))
    dataset[[percVarMEAN]][dataset[[percVar]] == "10-14"] <- mean(c(10, 14))
    dataset[[percVarMEAN]][dataset[[percVar]] == "15-19"] <- mean(c(15, 19))
    dataset[[percVarMEAN]][dataset[[percVar]] == "20-24"] <- mean(c(20, 24))
    dataset[[percVarMEAN]][dataset[[percVar]] == "25-29"] <- mean(c(25, 29))
    dataset[[percVarMEAN]][dataset[[percVar]] == "30-34"] <- mean(c(30, 34))
    dataset[[percVarMEAN]][dataset[[percVar]] == "35-39"] <- mean(c(35, 39))
    dataset[[percVarMEAN]][dataset[[percVar]] == "40-44"] <- mean(c(40, 44))
    dataset[[percVarMEAN]][dataset[[percVar]] == "45-49"] <- mean(c(45, 49))
    dataset[[percVarMEAN]][dataset[[percVar]] == "50-54"] <- mean(c(50, 54))
    dataset[[percVarMEAN]][dataset[[percVar]] == "55-59"] <- mean(c(55, 59))
    dataset[[percVarMEAN]][dataset[[percVar]] == "60-64"] <- mean(c(60, 64))
    dataset[[percVarMEAN]][dataset[[percVar]] == "65-69"] <- mean(c(65, 69))
    dataset[[percVarMEAN]][dataset[[percVar]] == "70-74"] <- mean(c(70, 74))
    dataset[[percVarMEAN]][dataset[[percVar]] == "75-79"] <- mean(c(75, 79))
    dataset[[percVarMEAN]][dataset[[percVar]] == "80-84"] <- mean(c(80, 84))
    dataset[[percVarMEAN]][dataset[[percVar]] == "85-89"] <- mean(c(85, 89))
    dataset[[percVarMEAN]][dataset[[percVar]] == "90-94"] <- mean(c(90, 94))
    dataset[[percVarMEAN]][dataset[[percVar]] == "GE95"] <- mean(c(95, 100))
    dataset[[percVarMEAN]][dataset[[percVar]] == "LE1"] <- mean(c(0, 1))
    dataset[[percVarMEAN]][dataset[[percVar]] == "GE99"] <- mean(c(99, 100))
    dataset[[percVarMEAN]][is.na(dataset[[percVarMEAN]])] <- as.numeric(dataset[[percVar]][is.na(dataset[[percVarMEAN]])])
    
    # Calculate minimum, maximum, and mean number of students proficient/
    #   graduated.
    dataset[[numVarMIN]] <- round(dataset[[sampleSizeVar]] * dataset[[percVarMIN]] * 0.01, digits = 0)
    dataset[[numVarMAX]] <- round(dataset[[sampleSizeVar]] * dataset[[percVarMAX]] * 0.01, digits = 0)
    dataset[[numVarMEAN]] <- round(dataset[[sampleSizeVar]] * dataset[[percVarMEAN]] * 0.01, digits = 0)
    
    return(as.data.frame(dataset))
}

################################################################################
# END OF FILE.
################################################################################