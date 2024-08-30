import Foundation

class GameLogic {
    var playerScore = 0
    var computerScore = 0
    var playerCard: Card?
    var computerCard: Card?
    var roundsPlayed = 0
    
    private var deck: [Card] = []
    
    init() {
        createDeck()
    }
    
    private func createDeck() {
        let suits = ["clubs", "diamonds", "hearts", "spades"]
        for suit in suits {
            for value in 2...13 {
                deck.append(Card(value: value, suit: suit))
            }
        }
        deck.shuffle()
    }
    
    func drawNewCards() {
        if deck.count < 2 {
            createDeck()  // Recreate and shuffle the deck if there aren't enough cards
        }
        
        playerCard = deck.removeFirst()
        computerCard = deck.removeFirst()
    }
    
    func evaluateRound() {
        guard roundsPlayed < 10, let playerCard = playerCard, let computerCard = computerCard else { return }
        
        if playerCard.value > computerCard.value {
            playerScore += 1
        } else if computerCard.value > playerCard.value {
            computerScore += 1
        }
        
        roundsPlayed += 1
    }
    
    func isGameOver() -> Bool {
        return roundsPlayed >= 10
    }
    
    func getWinner(playerName: String) -> String {
        if playerScore > computerScore {
            return playerName
        } else if computerScore > playerScore {
            return "Computer"
        } else {
            return "Tie"
        }
    }
}
