# CardGame

Welcome to the CardGame project! This iOS app is a fun card game where players compete against a computer opponent. Below you'll find information about the app, including descriptions of the controllers and classes, as well as space for screenshots and a video link.

## Screenshots

<img src="https://github.com/user-attachments/assets/bdfef915-c8f2-4aaa-85bd-f89cb5e945bd" alt="Screenshot 1" width="400"/>

<br/>

<img src="https://github.com/user-attachments/assets/042232da-a104-4149-bdcb-4387e8d68253" alt="Screenshot 2" width="400"/>

<br/>

<img src="https://github.com/user-attachments/assets/9c63c61d-b433-46e3-9d5d-74e268431040" alt="Screenshot 3" width="400"/>

## Video

[Watch the demo video here]([link_to_video)](https://drive.google.com/file/d/1dY5sOUM_S5lpn6IycGZdvveAHdDBCo4a/view?usp=sharing)

## Overview

### MainViewController

The `MainViewController` is the initial screen where users can enter their name and start the game. It also determines the player's side based on their location.

**Key Features:**
- Allows users to input their name.
- Displays the player's side (East or West) based on their location.
- Navigates to the `GameViewController` when the start button is tapped.

### GameViewController

The `GameViewController` manages the gameplay, including displaying cards, keeping track of scores, and managing the game timer.

**Key Features:**
- Displays player and computer scores.
- Shows player and computer cards with animation.
- Handles game logic and updates the UI.
- Manages round and game timers.

### ResultViewController

The `ResultViewController` shows the result of the game, including the winner and final score.

**Key Features:**
- Displays the winner and final score.
- Provides a button to return to the main menu.

## Classes

### Card

The `Card` struct represents a card with a value and suit. It includes methods to create card image names and retrieve card values from names.

**Key Features:**
- `value` and `suit`: Represents the card's attributes.
- `imageName`: Generates the image file name based on the card's value and suit.
- `getValue(from:)`: Extracts the value from a card's image name.
- `createImageName(value:suit:)`: Creates an image name based on value and suit.

### GameLogic

The `GameLogic` class handles the core game functionality, including managing the deck, drawing cards, and determining the winner.

**Key Features:**
- `playerScore` and `computerScore`: Tracks the scores for both players.
- `drawNewCards()`: Draws new cards for the player and computer.
- `evaluateRound()`: Evaluates the round and updates scores.
- `isGameOver()`: Checks if the game has ended.
- `getWinner(playerName:)`: Returns the winner based on scores.

### LocationManager

The `LocationManager` class handles location updates to determine the player's side in the game.

**Key Features:**
- `requestLocation(completion:)`: Requests the player's location.
- `stopUpdatingLocation()`: Stops location updates.
- `locationManager(_:didUpdateLocations:)`: Handles location updates.
- `locationManager(_:didFailWithError:)`: Handles errors in location updates.

## Installation

1. Clone the repository:
    ```bash
    git clone https://github.com/hadarber/cardGame.git
    ```
2. Open the project in Xcode.
3. Build and run the project on your simulator or device.

## Contributing

If you'd like to contribute to this project, please fork the repository and submit a pull request with your changes.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.
