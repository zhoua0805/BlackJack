/*
Alice Zhou
April 9th, 2018
Blackjack: this program creates and operates an edited version of the famous card game Blackjack.
Revision: None
*/

import Foundation    //import the Foundation module for generating random numbers


//this is a function to convert the cards to their respective values
func Convertvalue (x: Array<String>, a: Int) -> Int {
  var b: Int
  if x[a] == "D2" || x[a]=="H2" || x[a]=="S2" || x[a]=="C2" {            //if the cards are number 2s, they have a value of 2
    b = 2
  }else if x[a]=="D3" || x[a]=="H3" || x[a]=="S3" || x[a]=="C3" {        //if the cards are number 3s, they have a value of 3
    b = 3
  }else if x[a] == "D4" || x[a]=="H4" || x[a]=="S4" || x[a]=="C4" {      //if the cards are number 4s, they have a value of 4
    b = 4
  }else if x[a] == "D5" || x[a]=="H5" || x[a]=="S5" || x[a]=="C5" {      //if the cards are number 5s, they have a value of 5
    b = 5
  }else if x[a] == "D6" || x[a]=="H6" || x[a]=="S6" || x[a]=="C6" {      //if the cards are number 6s, they have a value of 6
    b = 6
  }else if x[a] == "D7" || x[a]=="H7" || x[a]=="S7" || x[a]=="C7" {      //if the cards are number 7s, they have a value of 7
    b = 7
  }else if x[a] == "D8" || x[a]=="H8" || x[a]=="S8" || x[a]=="C8" {      //if the cards are number 8s, they have a value of 8
    b = 8
  }else if x[a] == "D9" || x[a]=="H9" || x[a]=="S9" || x[a]=="C9" {      //if the cards are number 9s, they have a value of 9
    b = 9
  }else if x[a] == "DA" || x[a]=="HA" || x[a]=="SA" || x[a]=="CA" {      //if the cards are Aces, they have a value of 1
    b = 1
  }else {                                                                //else(cards are face cards), they have a value of 10
    b = 10
  }
  return b                                                               //return the value b
}




var you: Array<String> = []                 //set up array variables "you" and "me" for storing cards data
var me: Array<String> = []
var yoursum: Int = 0                        //set up integer variables "yoursum" and "mysum" for calculating the sums
var mysum: Int = 0
var count: Int = 0                          //create a counter


//create an array variable "cards" which contains all the cards in a 52 standard deck
var cards = ["D2", "H2", "S2", "C2", "D3", "H3", "S3", "C3", "D4", "H4", "S4", "C4", "D5", "H5", "S5", "C5", "D6", "H6", "S6", "C6", "D7", "H7", "S7", "C7", "D8", "H8", "S8", "C8", "D9", "H9", "S9", "C9", "D10", "H10", "S10", "C10", "DJ", "HJ", "SJ", "CJ", "DQ", "HQ", "SQ", "CQ", "DK", "HK", "SK", "CK", "DA", "HA", "SA", "CA"]

//print out the introduction and rules
print ("Hi, welcome to the Blackjack game.",
       "You may have heard of this game before, but today we are going to do something cooler.",
       "First we will both receive two random cards from a 52 standard deck.",
       "They will be denoted in two letters:",
       "the first letter represents the suite(D, H, S or C), while the second letter represents the card(A for Ace, J for Jack and etc.).",
       "The number cards are counted as their respective values from 2 to 10, while the face cards all have the value of 10.",
       "HOWEVER, IN THIS GAME ACE CAN ONLY BE COUNTED AS 1 BUT NOT 11.",
       "After we both receive our cards, you are allowed to see the value of one of my cards.",
       "You get to decide whether to withdraw more cards from the deck or not.",
       "You can withdraw as many times as you want. However, if the sum of your cards surpasses 21, you lose the game.",
       "After you finish choosing your cards, I start to play. I WILL ONLY WITHDRAW ONCE OR NONE. After that, we compare our values.",
       "If my sum surpasses 21, I lose; if my sum is less than 21 but greater than your sum, I win;",
       "however, if our sums are the same, it is a tie.")
print ("Good luck!")
print ()

sleep(1)                                   //sleep for 1 second
print("Generating random cards...")        //print "Generating random cards..."
sleep(1)                                   //sleep for another second

print ("Your two cards are:")
for z in 0...1 {                     //this loop runs twice which generates the user's two cards
  var m : Int = clock()%(52-z)           //generate a random integer in the range of the total number of cards
  var n: Int = Convertvalue(x: cards, a: m)       //convert the card to its value
  yoursum = yoursum + n                           //add the value to the user's sum
  you.append(cards[m])                            //add the card name to the array "you"
  print (cards[m])                                //print out the card name on screen 
  cards.remove(at: m)                             //remove that card from the deck
}
print ("Your sum is \(yoursum)")                     //print out the user's sum
print ()

print ("One of my cards is:")                 
var m: Int = clock()%50                  //generate a random integer in the range of the total number of cards
var n: Int = Convertvalue(x: cards, a: m)           //convert the card to its value
mysum = mysum + n                                   //add the value to the my sum
me.append(cards[m])                                 //add the card name to the array "me"
print (cards[m])                                    //print out the card name on screen
cards.remove(at: m)                                 //remove that card from the deck
print ("My sum is \(mysum)+")                       //print out mysum with a "+" sign (the user is not allowed to know the other card value)
print ()

//generate another random integer again, add the card to array "me" and add the card value to mysum, then remove that card from the deck
//(the user does not get to see what the card is this time)
m = clock()%49                               
n = Convertvalue(x: cards, a: m)
mysum = mysum + n
me.append(cards[m])
cards.remove(at: m)



while true {          //this loop repeats forever until it breaks --for checking invalid inputs
  print ("Do you want to get more cards? Yes: 1; No: 2. ")   //ask the user whether to withdraw more cards
  var y = readLine()!                                        //read in the user input 
  
  if y == "1" {           //if the user says yes:
    count = count + 1     //increase count by 1 
    m = clock()%(49 - count)    //generate a random integer in the range of the total number of cards
    n = Convertvalue(x: cards, a: m)    //convert the card to its value
    yoursum = yoursum + n               //add the value to the user's sum
    you.append(cards[m])                //add the card name to the array "you"
    cards.remove(at: m)                 //remove that card from the deck
    print ("your cards are \(you), your new sum is \(yoursum)")   //print out the new card collections and the new sum
    
  }else if y == "2"{         //if the user says no:
    print ("Time for me to play!")    //print "Time for me to play!"  --it is my turn now :)
    print ()
    sleep (1)                         //sleep for 1 second
    
    if mysum < 21 {         //if my sum is less than 21:
      //generate another random integer again, add the card to array "me" and add the card value to mysum, then remove that card from the deck
      count = count + 1
      m = clock()%(49 - count)
      n = Convertvalue(x: cards, a: m)
      mysum = mysum + n
      me.append(cards[m])
      cards.remove(at: m)
      print(me)           //print out my card collections
    }
    
    if mysum > 21 {         //if my sum is greater than 21:
      print("My sum is \(mysum) which is greater than 21, you won!")    //print out mysum and show that I lose and the user wins
      break                                                             //break the loop and exit the game
    }
    
    if yoursum < mysum  {                         //if the user's sum is less than my sum
      print ("My sum is \(mysum) and your sum is \(yoursum), you lost!")  //print out both sums and show that I win and the user loses
      break                                                               //break the loop and exit the game
    }else if yoursum == mysum  {                  //if the user's sum is equal to my sum
      print ("My sum is \(mysum) and your sum is \(yoursum), it's a tie!")  //print out both sums and show that it is a tie
      break                                                                 //break the loop and exit the game
    }else {                                      //else(the user's sum is greater than my sum),
      print ("My sum is \(mysum) and your sum is \(yoursum), you won!")  //print out both sums and show that I lose and the user wins 
      break                                                              //break the loop and exit the game
    }
    
  }else {    //else(the user inputs in a value other than "1" or "2" --which is invalid),
    print ("Invalid input. Please input again.")    //indicate that the input is invalid
  }
  
  if yoursum > 21  {                     //if the user's sum surpasses 21 before I play 
    print ("Your sum is greater than 21, you lost!")  //print that the user's sum is greater than 21 and therefore he/she loses
    break                                                     //break the loop and exit the game
  }
  //go back to the beginning of the loop if it didn't break somewhere above
}
