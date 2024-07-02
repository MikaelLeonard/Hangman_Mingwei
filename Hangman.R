#Hangman Project 

#Prepare a dictionary of words to choose from and save it in a txt file (one column) and save it in the project directory
#Read the word list from your program.
#Choose a random element from the list. Hint: You may want to check sample() and sample.int()  functions. There are many different ways of doing this. You are welcome to experiment.
#Inform the user on the length of the secret word. Hint: You may test nchar()
#Inform the user about the number of wrong guesses/tries allowed. You decide on the rule here and implement it. Please comment your code appropriately.
#Ask for user input. The user is expected to enter one character only, check for this.
#Optional; check if the character is a letter
#Optional: make sure that both lower and upper case letters are acceptable and treated as equivalent
#Check to see if the user input is in the secret word.
#If yes, notify user and ask for next letter
#If not, notify user.
#If user has not exhausted the available tries, ask for the next letter.
#If tries are exhausted, notify user that they’ve lost. Reveal secret and exit.
#Make sure that your code never goes into an infinite loop, and always manages to exit gracefully (ie without throwing an error)
#Always notify the user about the correct letters/wrong letters, remaining tries.

allword<- unlist(read.csv("Words.txt"))

word <- sample(allword,1)

split_w <- unlist(strsplit(word, ""))

split_g<- replace(split_w, 1:length_w, "_")

length_w <- length(split_w)

W_display <- c()

for (i in 1:length_w){
  W_display <- paste(W_display, "_")
}

cat("Welcome to Hangman! 
For each round you get to make seven unsuccessful attempt
If you are unbale to guess the word before using up all seven attemtps the men would be hanged :)
Your word has",length_w, "characters", W_display, 
"Have fun!")

i <- 1

while(i < 8) {
  guess <- readline("Please make your guess:")
  if (grepl(guess,word,ignore.case = TRUE)){
    locate <- grep(guess, split_w, ignore.case = TRUE)
    split_g <- replace(split_g, locate, guess)
    cat(split_g, "Your guess is correct,it is in the word.")
    }else if(grepl(guess,word) == FALSE){
      cat(guess, "is not in the word, you have",7 - i, "attempts left")
      i <- i + 1
    }else if(guess == word){
      cat("You have found the word! The word is", word)
    }
}
  
cat("You have depleted all 7 attempts, the word was",word,".Down for another round?")

