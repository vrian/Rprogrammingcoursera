pollutantmean <- function(directory, pollutant = "sulfate", id = 1:332) {
    ## 'directory' is a character vector of length 1 indicating
    ## the location of the CSV files
    
    ## 'pollutant' is a character vector of length 1 indicating
    ## the name of the pollutant for which we will calculate the
    ## mean; either "sulfate" or "nitrate".
    
    ## 'id' is an integer vector indicating the monitor ID numbers
    ## to be used
    
    ## Return the mean of the pollutant across all monitors list
    ## in the 'id' vector (ignoring NA values)
    

    # initialize an empty vector for holding the pollutant data
    pollutantdata <- c()
    
    # get all the files in the specified folder (ie. directory)
    files <- list.files(directory)
    
    # includes all files with directory to a variable
    filepaths <- paste(directory,"/", files, sep="")
    
    # traverse through each of the file and store
    # concatenate the data of pollutant column
    for (i in id) {
        data <- read.csv(filepaths[i])
        pollutantdata <- c(pollutantdata, data[, pollutant])
    }
    
    # return the mean of pollutant data rounded to three decimal places
    return(round(mean(pollutantdata, na.rm=TRUE), 3)) 
}

# for testing
# pollutantmean("specdata", "sulfate", 1:10)   --> 4.064
# pollutantmean("specdata", "nitrate", 70:72)  --> 1.706
# pollutantmean("specdata", "nitrate", 23)     --> 1.281
