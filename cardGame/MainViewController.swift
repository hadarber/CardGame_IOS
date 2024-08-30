import UIKit

class MainViewController: UIViewController {
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var welcomeLabel: UILabel!
    @IBOutlet weak var sideLabel: UILabel!
    @IBOutlet weak var startButton: UIButton!
    
    private var playerSide: Side = .west
    
    enum Side {
        case east, west
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadStoredName()
        requestLocation()
    }
    
    private func loadStoredName() {
        if let storedName = UserDefaults.standard.string(forKey: "playerName") {
            nameTextField.isHidden = true
            welcomeLabel.text = "Hi \(storedName)"
        }
    }
    
    private func requestLocation() {
        LocationManager.shared.requestLocation { [weak self] location in
            guard let self = self else { return }
            self.playerSide = location.coordinate.longitude > 34.817549168324334 ? .east : .west
            self.sideLabel.text = "\(self.playerSide == .east ? "East" : "West") Side"
            self.startButton.isEnabled = true
        }
    }
    
    @IBAction func startButtonTapped(_ sender: UIButton) {
        if let name = nameTextField.text, !name.isEmpty {
            UserDefaults.standard.set(name, forKey: "playerName")
        }
        performSegue(withIdentifier: "startGame", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "startGame",
           let gameVC = segue.destination as? GameViewController {
            gameVC.playerName = UserDefaults.standard.string(forKey: "playerName") ?? "Player"
            gameVC.playerSide = playerSide
        }
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("MainViewController appeared")
    }
    
}
