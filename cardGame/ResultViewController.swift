import UIKit

class ResultViewController: UIViewController {
    @IBOutlet weak var winnerLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    
    var winner: String = ""
    var finalScore: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        winnerLabel.text = "Winner: \(winner)"
        scoreLabel.text = "Final Score: \(finalScore)"
    }
    
    @IBAction func backToMenuTapped(_ sender: UIButton) {
           print("Back to menu button tapped")
           if let navigationController = self.navigationController {
               print("NavigationController found, attempting to pop to root")
               navigationController.popToRootViewController(animated: true)
           } else {
               print("NavigationController not found, attempting to present MainViewController")
               presentMainViewController()
           }
       }
       
       private func presentMainViewController() {
           let storyboard = UIStoryboard(name: "Main", bundle: nil)
           if let mainVC = storyboard.instantiateInitialViewController() {
               mainVC.modalPresentationStyle = .fullScreen
               present(mainVC, animated: true) {
                   print("MainViewController presented")
               }
           } else {
               print("Failed to instantiate MainViewController")
           }
       }
}
