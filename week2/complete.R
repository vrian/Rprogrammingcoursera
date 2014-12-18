complete <- function(directory, id = 1:332) {
        ## 'directory' is a character vector of length 1 indicating
        ## the location of the CSV files

        ## 'id' is an integer vector indicating the monitor ID numbers
        ## to be used
        
        ## Return a data frame of the form:
        ## id nobs
        ## 1  117
        ## 2  1041
        ## ...
        ## where 'id' is the monitor ID number and 'nobs' is the
        ## number of complete cases

	      # initialize an empty vector
        nobs <- c()
    
        # get all the files in the specified folder (ie. directory)
        files <- list.files(directory)
    
        # includes all files with directory to a variable
        filepaths <- paste(directory,"/", files, sep="")
	  
	      # store the sum of the complete cases of specified group/s of filepath
	      for (i in id){
		        file <- read.csv(filepaths[i])
 		        nobs <- c(nobs, sum(complete.cases(file)))
 	      }

	      # return the data frame
	      return (data.frame(id = id, nobs = nobs))
}

# for testing
# complete("specdata", 1)
# complete("specdata", c(2, 4, 8, 10, 12))
# complete("specdata", 30:25)
# complete("specdata", 3)
