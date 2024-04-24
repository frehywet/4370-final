
#the function i will be creating is called count_vowels_and_visualize, 
#that reads a given sentence and counts the number of vowels in the sentence and also creates a wordcloud of the vowels frequency. 
#i used hilary parker's example to write my R package from scratch.

#first step is to install packages needed to develop my own
#install.packages("devtools")
#devtools::install_github("klutometis/roxygen")
library(roxygen2)
library(devtools)
#install.packages("lorem")
library(lorem)
library(wordcloud)

# next set the directory and create a folder. the folder contains files for description, man, rproj, namespace and R code. 
setwd("/Users/frey/4370")
create("myRPackageFinal")

#add comments about the function before the code
#' count_vowels_and_visualize Function 
#' This function returns the number of vowels in a given sentence
#' @return returns a numeric
#' @keywords vowels count, wordcloud,
#' @export
#' @examples
#' total_vowels()
#' vowel_freq()
#' 

#write code for function

count_vowels_and_visualize <- function(sentence) {
  vowels <- c("a", "e", "i", "o", "u", "A", "E", "I", "O", "U")
  vowel_freq <- table(tolower(unlist(strsplit(sentence, ""))))
  vowel_freq <- vowel_freq[names(vowel_freq) %in% vowels]
  
  # Create a word cloud for the frequency of each vowel
  wordcloud(names(vowel_freq), freq = vowel_freq, colors = brewer.pal(8, "Dark2"))
  
  # Calculate total number of vowels
  total_vowels <- sum(vowel_freq)
  
  # Return total number of vowels
  return(total_vowels)
}

#generate a random sentence
sentence <- as.character(ipsum(1))
sentence

#use the function created above to return wordcloud visualization and the total number of vowels. 
total_vowels <- count_vowels_and_visualize(sentence)
total_vowels
#set working directory to the new file and document
setwd("./myRPackageFinal")
document()

#install our newly created package
setwd("..")
install("myRPackageFinal")

#run the function
count_vowels(sentence)
