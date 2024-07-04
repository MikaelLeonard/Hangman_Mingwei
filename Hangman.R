#Hangman Project 

## MG: Great work! I tried running your game and was able to play it. However,
##     I noticed that after guessing all the letters correctly, It asks for another
##     guess before congratulating it.

## MG: I also notice that your input confuses some special characters like spaces,
##     \, and | doesn't work.

allword<- unlist(read.csv("Words.txt"))
#Reading the dictionary file that is stored in the same folder/repo
#sample() cannot process list as an input we therefore had to unlist the dictionary

## MG: Great use of the sample() function to choose a word
word <- sample(allword,1)
#choosing 1 word from the dictionary that we just made into a vector 

## MG: This is really smart. I think splitting the word into a string of characters 
##     allow for an easier manipulation such as for comparison and chekcing if a 
##     letter is in the word.
split_w <- unlist(strsplit(word, ""))
#The word is then separated into a string of characters with strsplit() 
#strsplit() gives a list as an output but I don't like that, it makes subsequent design difficult
#So i unlisted it :)

length_w <- length(split_w)
#The length of split_w that is required for the subsequent replace()

## MG: Nice work here, its nice being able to see the progress so far
split_g<- replace(split_w, 1:length_w, "_")
#g stands for game, in oppose to w which stands for words. 
#I am replacing each character in split_g with a _ to be displayed during the game. 

## MG: Great introduction to the game and the rules!
cat("Welcome to Hangman! 
For each round you get to make seven unsuccessful attempt
If you are unable to guess the word before using up all seven attemtps the men would be hanged :( 
To exit the game type Exit when being promted your guess.
Your word has",length_w, "characters", split_g, 
"Have fun!")


i <- 1
#i is set to 1 to in the beginning of the while loop
while(i < 8){
  guess <- readline("Please make your guess:")
  if (guess == "Exit"){
    break #This is if someone got trapped and wanted to leave.
  }
  if (grepl(paste(split_w,collapse=";"), paste(split_g,collapse=";"), ignore.case = TRUE)){
    cat("You have found the word!") #if all empty lots in split_g has been filled, the answer would be revealed
    break
  }
  if (grepl(paste(split_w,collapse=";"), guess, ignore.case = TRUE)){
    cat("You have found the word!") #if someone found the word!
    break 
  }else if (guess != word & nchar(guess) > 1){
    cat("You have inserted more than one letter and guessed the wrong word. Please try again.")
    #if someone inserted the wrong word.
  }else if (grepl(guess,word,ignore.case = TRUE)){
    locate <- grep(guess, split_w, ignore.case = TRUE)
    split_g <- replace(split_g, locate, guess)
    cat(split_g, "Your guess is correct,it is in the word.")
    #the guess is in the word, grep() gives the indices 
    #replace takes those indices and replaces blank spots in split_g with the guessed letter
  }else if(grepl(guess,word,ignore.case = TRUE) == FALSE){
      cat(guess, "is not in the word, you have",7 - i, "attempts left")
      i <- i + 1 #If the guessed letter is not in the actual word, 1- attempts are left 
  }
}

cat("The word was",word," .Down for another round?")

#Yayyy! Thank you for reviewing my R script

