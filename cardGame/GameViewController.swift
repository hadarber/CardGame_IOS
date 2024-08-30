import UIKit

class GameViewController: UIViewController {
    @IBOutlet weak var playerNameLabel: UILabel!
    @IBOutlet weak var playerScoreLabel: UILabel!
    @IBOutlet weak var computerScoreLabel: UILabel!
    @IBOutlet weak var playerCardImageView: UIImageView!
    @IBOutlet weak var computerCardImageView: UIImageView!
    @IBOutlet weak var roundLabel: UILabel!
    @IBOutlet weak var timerLabel: UILabel!
    @IBOutlet weak var computerNameLabel: UILabel!

    var playerName: String = "Player"
    var playerSide: MainViewController.Side = .west
    private var gameLogic: GameLogic!
    private var timer: Timer?
    private var roundTimer: Timer?
    private var secondsRemaining: Int = 5

    override func viewDidLoad() {
        super.viewDidLoad()
        setupGame()
    }

    private func setupGame() {
        gameLogic = GameLogic()
        updatePlayerPositions()
        computerNameLabel.text = "PC"
        updateUI()
        drawAndDisplayNewCards()
        startRoundTimer()
        startGameTimer()
    }

    private func updatePlayerPositions() {
        if playerSide == .west {
            playerNameLabel.text = playerName
            playerNameLabel.textAlignment = .left
            playerScoreLabel.textAlignment = .left
            computerNameLabel.textAlignment = .right
            computerScoreLabel.textAlignment = .right
        } else {
            playerNameLabel.text = playerName
            playerNameLabel.textAlignment = .right
            playerScoreLabel.textAlignment = .right
            computerNameLabel.textAlignment = .left
            computerScoreLabel.textAlignment = .left
        }
    }

    private func startGameTimer() {
        timer = Timer.scheduledTimer(withTimeInterval: 5, repeats: true) { [weak self] _ in
            self?.playRound()
        }
    }

    private func playRound() {
        gameLogic.evaluateRound()
        updateUI()

        if gameLogic.isGameOver() {
            timer?.invalidate()
            roundTimer?.invalidate()
            endGame()
        } else {
            drawAndDisplayNewCards()
            startRoundTimer()
        }
    }

    private func drawAndDisplayNewCards() {
        gameLogic.drawNewCards()
        displayCards(animated: true)
    }

    private func displayCards(animated: Bool) {
        guard let playerCard = gameLogic.playerCard,
              let computerCard = gameLogic.computerCard else {
            print("Error: No cards to display")
            return
        }

        let displayBlock = { [weak self] in
            guard let self = self else { return }

            if let playerImage = UIImage(named: playerCard.imageName) {
                self.playerCardImageView.image = playerImage
            } else {
                print("Error: Could not load player card image: \(playerCard.imageName)")
                self.playerCardImageView.backgroundColor = .red
            }

            if let computerImage = UIImage(named: computerCard.imageName) {
                self.computerCardImageView.image = computerImage
            } else {
                print("Error: Could not load computer card image: \(computerCard.imageName)")
                self.computerCardImageView.backgroundColor = .red
            }
        }

        if animated {
            UIView.transition(with: playerCardImageView, duration: 0.3, options: .transitionFlipFromLeft, animations: displayBlock, completion: nil)
            UIView.transition(with: computerCardImageView, duration: 0.3, options: .transitionFlipFromRight, animations: displayBlock, completion: nil)
        } else {
            displayBlock()
        }

        print("Round: \(gameLogic.roundsPlayed), Player Card: \(playerCard.imageName), Computer Card: \(computerCard.imageName)")
    }

    private func startRoundTimer() {
        secondsRemaining = 5
        updateTimerLabel()
        roundTimer?.invalidate()
        roundTimer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { [weak self] _ in
            self?.updateRoundTimer()
        }
    }

    private func updateRoundTimer() {
        secondsRemaining -= 1
        updateTimerLabel()
        if secondsRemaining <= 0 {
            roundTimer?.invalidate()
        }
    }

    private func updateTimerLabel() {
        timerLabel.text = "Time: \(secondsRemaining)s"
    }

    private func updateUI() {
        playerScoreLabel.text = "Score: \(gameLogic.playerScore)"
        computerScoreLabel.text = "Score: \(gameLogic.computerScore)"
        roundLabel.text = "Round: \(gameLogic.roundsPlayed)/10"
    }

    private func endGame() {
        print("Entering endGame function")
        let winner = gameLogic.getWinner(playerName: playerName)
        let finalScore = "\(gameLogic.playerScore)-\(gameLogic.computerScore)"

        print("Winner: \(winner), Final Score: \(finalScore)")

        // Transition to result screen
        performSegue(withIdentifier: "showResult", sender: self)
    }

    private func showAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        print("Prepare for segue called. Identifier: \(segue.identifier ?? "nil")")
        if segue.identifier == "showResult",
           let resultVC = segue.destination as? ResultViewController {
            resultVC.winner = gameLogic.getWinner(playerName: playerName)
            resultVC.finalScore = "\(gameLogic.playerScore)-\(gameLogic.computerScore)"
            print("ResultViewController prepared with winner: \(resultVC.winner) and score: \(resultVC.finalScore)")
        }
    }

    func showResultViewController() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        if let resultVC = storyboard.instantiateViewController(withIdentifier: "ResultViewController") as? ResultViewController {
            resultVC.winner = gameLogic.getWinner(playerName: playerName)
            resultVC.finalScore = "\(gameLogic.playerScore)-\(gameLogic.computerScore)"
            navigationController?.pushViewController(resultVC, animated: true)
        }
    }
}
