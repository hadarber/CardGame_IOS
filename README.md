cardGame
A simple card game app for iOS, built in Swift. This game involves a player competing against a computer in a series of rounds where each draws a card, and the one with the higher card value wins the round.

Table of Contents
Overview
Controllers
Classes
Screenshots
Video Demo
Overview
This card game app allows a player to compete against the computer in a series of 10 rounds. The player and computer each draw a card, and the one with the higher value wins the round. The app keeps track of scores and declares the winner at the end of the game.

Controllers
MainViewController
Purpose: Manages the initial screen where the player enters their name and starts the game.
Functionality:
Loads the stored player name from UserDefaults.
Determines the player's side (east or west) based on their location.
Handles the transition to the GameViewController when the player starts the game.
GameViewController
Purpose: Manages the main gameplay, including drawing cards, displaying scores, and controlling the game flow.
Functionality:
Sets up the game by initializing the GameLogic and displaying the initial cards.
Updates the UI with player and computer scores, current round, and a countdown timer.
Handles card drawing and display, updates the UI, and determines when the game is over.
Transitions to the ResultViewController at the end of the game.
ResultViewController
Purpose: Displays the result of the game, including the winner and final score.
Functionality:
Shows the winner and final score.
Provides a button to return to the main menu, either by popping to the root view controller or presenting the main view controller modally.
Classes
Card
Purpose: Represents a playing card with a value and suit.
Functionality:
Provides methods to generate the card's image name based on its value and suit.
Includes static methods to extract card values from image names and create image names.
GameLogic
Purpose: Handles the core game logic, including scoring, card drawing, and round evaluation.
Functionality:
Maintains scores for the player and computer, and keeps track of rounds played.
Manages the deck of cards, shuffling and drawing cards as needed.
Evaluates each round and determines the game outcome.
LocationManager
Purpose: Manages location services for determining the player's side based on their geographic location.
Functionality:
Requests location permissions and updates location.
Determines the player's side based on longitude and provides this information to the MainViewController.
Screenshots
Add your screenshots here:

Video Demo
Watch a demo of the app here.

