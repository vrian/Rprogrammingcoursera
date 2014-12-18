corr <- function(directory, threshold = 0) {
    ## 'directory' is a character vector of length 1 indicating
    ## the location of the CSV files
    
    ## 'threshold' is a numeric vector of length 1 indicating the
    ## number of completely observed observations (on all
    ## variables) required to compute the correlation between
    ## nitrate and sulfate; the default is 0
    
    ## Return a numeric vector of correlations

    # access the nobs member and get the complete rows 
    completeframe <- complete(directory)
    completerows <- completeframe$nobs
    ids <- completeframe[,"id"][completerows > threshold]

    # initialize an empty vector for correlation, and a counter
    crelation <- rep(0, length(ids))
    index <- 1
    
    # get all the files in the specified folder (ie. directory)
    files <- list.files(directory)
    
    # includes all files with directory to a variable
    filepaths <- paste(directory,"/", files, sep="")
	  
    # store the sum of the complete cases of specified group/s of filepath
    for (i in ids){
	  filedata <- read.csv(filepaths[i])
 	  # calculate and store the correlation between "sulfate" and "nitrate" column 
	  crelation[index] <- cor(filedata[, "sulfate"], filedata[, "nitrate"], use = "complete.obs")
	  index <- index + 1
    }

    return (crelation)
}

# for testing
# cr <- corr("specdata", 150)
# cr <- corr("specdata", 400)
# cr <- corr("specdata", 5000)
