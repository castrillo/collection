#Prep artist and artwork datasets for visualization

  #Load packages
  library(dplyr)    # summarize data
  library(reshape2) # data manipulation
  library(sqldf)   # write sql queries in R
  library(ggplot2) # Graphs
  library(scales)  # Format numbers in axes

  #library(stringr) # string operations (str_match)

  # Setup
  wd <- paste0(getwd())
  input <- paste(wd, "/", sep="")
  output <- paste(wd, "/R Output/", sep="")
  input
  output


  #load data
  filename <- paste0(input, "artist_data.csv")
  artists <- read.csv(filename, stringsAsFactors=FALSE)
  head(artists)
  nrow(artists)

  filename <- paste0(input, "artwork_data.csv")
  artworks <- read.csv(filename, stringsAsFactors=FALSE)
  head(artworks)
  nrow(artworks)
  
  
  
#Data Processing  
  #Top countries for artists
  artistCountry <-  artists %>% 
    group_by(birthCountryEnglish) %>%  
    select(birthCountryEnglish) %>%  
    summarise(n=n()) %>%
    arrange(desc(n))
    
  artistCountry
  
  #Artist gender by country
  artistCountryGender <-  artists %>% 
    group_by(birthCountryEnglish, gender) %>%  
    select(birthCountryEnglish, gender) %>%  
    summarise(n=n()) %>%
    arrange(desc(n))
  
  head(artistCountryGender)
  
  #Export datasets for visualization
  filename <- paste0(output, "artistCountry.csv")
  write.csv(artistCountry, filename)

  filename <- paste0(output, "artistCountryGender.csv")
  write.csv(artistCountryGender, filename)

#Data Processing - artworks
  #Clean up medium and keep only desired categories

  #Summarise number of artworks by artist
  
  
#Import raw data for artists and artworks
