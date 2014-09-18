################################################################################
# Data Download and Initial Processing.
################################################################################

################################################################################
# Download FY12 Datasets
################################################################################

################################################################################
# Set up working directory and call libraries.
################################################################################

# SPECIFY MAIN WORKING DIRECTORY HERE.
mainDirectory <- "Z:/github_syntax_files/aea_2014"
setwd(mainDirectory)

# Check to see if subfolder "downloaded files" exists -- if not, create new
# folder to store downloaded datasets.
if (file.exists("downloaded files")) {
} else { dir.create("downloaded files") }
downloadsDirectory <- paste(getwd(), "/downloaded files", sep = "")

# SPECIFY DATA SOURCE DIRECTORY.
FY12DataDirectory <- "Z:/Cross Instrument/FY12/Source Data"

# Required libraries.
#install.packages("Hmisc")
library(Hmisc)
#install.packages("plyr")
library(plyr)

################################################################################
# Specify source dataset URLs.
################################################################################

# Specify dataset URLs.
# National Center for Education Statistics File - Common Core of Data.
NCESCCDSCH1112Url <- "http://nces.ed.gov/ccd/Data/zip/sc111a_supp_txt.zip"
# data.gov ELA proficiency: SCHOOL-LEVEL.
ELAProfSCH1112Url <- "https://inventory.data.gov/dataset/e1f06719-f437-431c-8a52-d7706b7791aa/resource/5a238416-a57d-4c73-8c3c-e3bd1d0d7cb7/download/userssharedsdfachvmntrsltsstateassmtsrlasy201112.csv"
# data.gov ELA proficiency: DISTRICT-LEVEL.
ELAProfDIST1112Url <- "https://inventory.data.gov/dataset/e4b3ce38-c0e2-45c1-97b4-73f6a467e801/resource/7c9a1737-5501-492a-8d23-99e1501e9e0b/download/userssharedsdfleaachvrsltsassessrlasy201112.csv"
# data.gov math proficiency: SCHOOL-LEVEL.
MTHProfSCH1112Url <- "https://inventory.data.gov/dataset/cee9d558-313f-41f7-8955-1d6e4df3a2dc/resource/0f696b5b-129c-4a83-93af-662f5f8162f4/download/userssharedsdfachvmntrsltsstateassmtsmathssy201112.csv"
# data.gov math proficiency: DISTRICT-LEVEL.
MTHProfDIST1112Url <- "https://inventory.data.gov/dataset/53266ad7-8fc0-4929-b4be-fb93772bd441/resource/b4e7f148-3afc-4782-84a3-dfaca3156e8b/download/userssharedsdflealvlachvmntrsltsforstateassmntsinmathssy201112.csv"
# data.gov graduation rates: SCHOOL-LEVEL.
GRADSCH1112Url <- "https://inventory.data.gov/dataset/d11cbb1f-c534-43bd-a883-e40921e22a56/resource/77455e2a-5f50-4038-8e34-d4df64fd515e/download/adjustedcohortgrdtnratesslsy201112updated.csv"
# data.gov graduation rates: DISTRICT-LEVEL.
GRADDIST1112Url <- "https://inventory.data.gov/dataset/73021f54-f5bf-4f34-86dd-5497ba4bdcfc/resource/32b21f42-b80b-4b1b-ad50-b361c5cecd99/download/userssharedsdfadjustedcohortgrdtnratesleasy201112.csv"

# Specify documentation links, for reference purposes (sample sizes as of 9/12/14).
# National Center for Education Statistics File - Common Core of Data.
#   http://nces.ed.gov/ccd/pubschuniv.asp
#   n = 103,483
# data.gov ELA proficiency: SCHOOL-LEVEL.
#   https://inventory.data.gov/dataset/achievement-results-for-state-assessments-in-reading-language-arts-school-year-2011-2012
#   n = 90,885
# data.gov ELA proficiency: DISTRICT-LEVEL.
#   https://inventory.data.gov/dataset/lea-level-achievement-results-for-state-assessments-in-reading-language-arts-school-year-2011-2012
#   n = 16,060
# data.gov math proficiency: SCHOOL-LEVEL.
#   https://inventory.data.gov/dataset/achievement-results-for-state-assessments-in-mathematics-school-year-2011-2012
#   n = 90,906
# data.gov math proficiency: DISTRICT-LEVEL.
#   https://inventory.data.gov/dataset/lea-level-achievement-results-for-state-assessments-in-mathematics-school-year-2011-2012
#   n = 16,061
# data.gov graduation rates: SCHOOL-LEVEL.
#   https://inventory.data.gov/dataset/adjusted-cohort-graduation-rates-at-the-school-level-school-year-2011-12
#   n = 20,434
# data.gov graduation rates: DISTRICT-LEVEL.
#   https://inventory.data.gov/dataset/adjusted-cohort-graduation-rates-at-the-lea-level-school-year-2011-12
#   n = 11,325

################################################################################
# Upload datasets.
################################################################################

# Move to downloads directory.
setwd(downloadsDirectory)

# National Center for Education Statistics File - Common Core of Data.
if (file.exists("NCESCCDSCH1112.csv")) {
    NCESCCDSCH1112 <- read.csv("NCESCCDSCH1112.csv", header = TRUE, sep = ",")
} else {
    temp <- tempfile()
    download.file(NCESCCDSCH1112Url, temp)
    NCESCCDSCH1112 <- read.csv(unz(temp, "sc111a_supp.txt"), header = TRUE, sep = "\t")
    unlink(temp)
    write.csv(NCESCCDSCH1112, file="NCESCCDSCH1112.csv")
}

# data.gov ELA proficiency: SCHOOL-LEVEL.
if (file.exists("ELAProfSCH1112.csv")) {
} else { download.file(ELAProfSCH1112Url, destfile = "ELAProfSCH1112.csv") }
ELAProfSCH1112 <- read.csv("ELAProfSCH1112.csv", header = TRUE, sep = ",")

# data.gov ELA proficiency: DISTRICT-LEVEL.
if (file.exists("ELAProfDIST1112.csv")) {
} else { download.file(ELAProfDIST1112Url, destfile = "ELAProfDIST1112.csv") }
ELAProfDIST1112 <- read.csv("ELAProfDIST1112.csv", header = TRUE, sep = ",")

# data.gov math proficiency: SCHOOL-LEVEL.
if (file.exists("MTHProfSCH1112.csv")) {
} else { download.file(MTHProfSCH1112Url, destfile = "MTHProfSCH1112.csv") }
MTHProfSCH1112 <- read.csv("MTHProfSCH1112.csv", header = TRUE, sep = ",")

# data.gov math proficiency: DISTRICT-LEVEL.
if (file.exists("MTHProfDIST1112.csv")) {
} else { download.file(MTHProfDIST1112Url, destfile = "MTHProfDIST1112.csv") }
MTHProfDIST1112 <- read.csv("MTHProfDIST1112.csv", header = TRUE, sep = ",")

# data.gov graduation rates: SCHOOL-LEVEL.
if (file.exists("GRADSCH1112.csv")) {
} else { download.file(GRADSCH1112Url, destfile = "GRADSCH1112.csv") }
GRADSCH1112 <- read.csv("GRADSCH1112.csv", header = TRUE, sep = ",")

# data.gov graduation rates: DISTRICT-LEVEL.
if (file.exists("GRADDIST1112.csv")) {
} else { download.file(GRADDIST1112Url, destfile = "GRADDIST1112.csv") }
GRADDIST1112 <- read.csv("GRADDIST1112.csv", header = TRUE, sep = ",")

# List of FY12 City Year schools.
setwd(FY12DataDirectory)
FY12CYSchoolIDs <- spss.get("FY12 NCES to City Year School IDs 2014.08.05.sav", use.value.labels=FALSE)

# Move back to main directory.
setwd(mainDirectory)

################################################################################
# Halt script if data did not download properly.
################################################################################

stopifnot(nrow(NCESCCDSCH1112) == 103483, nrow(ELAProfSCH1112) == 90885,
          nrow(ELAProfDIST1112) == 16060, nrow(MTHProfSCH1112) == 90906,
          nrow(MTHProfDIST1112) == 16061, nrow(GRADSCH1112) == 20434,
          nrow(GRADDIST1112) == 11325)

################################################################################
# Attach CY flag to schools and districts.
################################################################################

# Select main schools only. This means that Oak Ridge in Orlando will not be
#   included in this analysis since it was a start-up team that began mid-year.
#   Specialty schools/programs housed within City Year schools (e.g. Noel
#   Community Arts School in Denver and New Technology HS@East Tech in
#   Cleveland) are also excluded. However, programs where it was highly likely
#   that corps members served are included (e.g. Achievement Academies in
#   Chicago, where there was a focus on supporting struggling students in early
#   HS).
FY12CYSchools <- subset(FY12CYSchoolIDs[,3:4], MainSchoolsOnly == 1)
colnames(FY12CYSchools) <- c("NCESSCH", "FY12CYSchool")

# Merge CY school variable (1=FY12 City Year school, NA otherwise) to all
#   school-level datasets.
# National Center for Education Statistics File - Common Core of Data.
NCESCCDSCH1112 <- merge(NCESCCDSCH1112, FY12CYSchools, by.x = "NCESSCH",
                        by.y = "NCESSCH", all.x = TRUE, all.y = FALSE)
# data.gov ELA proficiency: SCHOOL-LEVEL.
ELAProfSCH1112 <- merge(ELAProfSCH1112, FY12CYSchools, by.x = "NCESSCH",
                        by.y = "NCESSCH", all.x = TRUE, all.y = FALSE)
# data.gov math proficiency: SCHOOL-LEVEL.
MTHProfSCH1112 <- merge(MTHProfSCH1112, FY12CYSchools, by.x = "NCESSCH",
                        by.y = "NCESSCH", all.x = TRUE, all.y = FALSE)
# data.gov graduation rates: SCHOOL-LEVEL.
colnames(GRADSCH1112)[1] <- "NCESSCH"
GRADSCH1112 <- merge(GRADSCH1112, FY12CYSchools, by.x = "NCESSCH",
                     by.y = "NCESSCH", all.x = TRUE, all.y = FALSE)

# Create list of City Year districts.
FY12CYDistrictIDs <- ddply(subset(NCESCCDSCH1112, FY12CYSchool == 1),
                           c("LEAID", "LEANM", "LSTATE"), summarise,
                           N = length(LEANM))
FY12CYDistrictIDs$FY12CYDistrict <- 1
FY12CYDistricts <- subset(FY12CYDistrictIDs[,c(1,4,5)])

# Merge CY district variable (1=FY12 City Year district, NA otherwise) to all
#   district-level datasets.
# data.gov ELA proficiency: DISTRICT-LEVEL.
ELAProfDIST1112 <- merge(ELAProfDIST1112, FY12CYDistricts, by.x = "LEAID",
                         by.y = "LEAID", all.x = TRUE, all.y = FALSE)
# data.gov math proficiency: DISTRICT-LEVEL.
MTHProfDIST1112 <- merge(MTHProfDIST1112, FY12CYDistricts, by.x = "LEAID",
                         by.y = "LEAID", all.x = TRUE, all.y = FALSE)
# data.gov graduation rates: DISTRICT-LEVEL.
colnames(GRADDIST1112)[3] <- "LEAID"
GRADDIST1112 <- merge(GRADDIST1112, FY12CYDistricts, by.x = "LEAID",
                      by.y = "LEAID", all.x = TRUE, all.y = FALSE)

################################################################################
# END OF FILE.
################################################################################