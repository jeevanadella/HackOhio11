import UIKit
import CoreNFC

class ViewController: UIViewController, NFCNDEFReaderSessionDelegate {

    private var nfcSession: NFCNDEFReaderSession?

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }

    private func setupUI() {
        let launchARButton = UIButton()
        launchARButton.setTitle("Launch AR App", for: .normal)
        launchARButton.addTarget(self, action: #selector(startNFCSession), for: .touchUpInside)

        // Customize button appearance and layout as needed
        // ...

        view.addSubview(launchARButton)
        // Add layout constraints for the button
        // ...
    }

    @objc func startNFCSession() {
        nfcSession = NFCNDEFReaderSession(delegate: self, queue: nil)
        nfcSession?.begin()
    }

    func readerSession(_ session: NFCNDEFReaderSession, didDetectNDEFs messages: [NFCNDEFMessage]) {
        // Handle the NFC tag data here
        if let firstMessage = messages.first {
            // Check the tag's content and trigger the AR app launch if needed
            // Example: Check if the tag contains the required information to launch the AR app

            // If the condition to launch the AR app is met, launch the AR app
            if shouldLaunchARApp(fromNDEFMessage: firstMessage) {
                launchARApp()
            }
        }
    }

    func readerSession(_ session: NFCNDEFReaderSession, didInvalidateWithError error: Error) {
        // Handle errors or session invalidation here
    }

    // Function to check if the NFC tag data meets the criteria to launch the AR app
    func shouldLaunchARApp(fromNDEFMessage message: NFCNDEFMessage) -> Bool {
        // You can implement your logic to check if the NDEF message contains the required data.
        // If it does, return true to launch the AR app.
        // Otherwise, return false.
        return true // Change this condition as per your requirements
    }

    // Function to launch the AR app
    func launchARApp() {
        // Implement the code to launch your AR app here.
        // You can use URL schemes or other methods to launch your AR app.
        // Example:
        if let arAppURL = URL(string: "arapp://") {
            if UIApplication.shared.canOpenURL(arAppURL) {
                UIApplication.shared.open(arAppURL)
            } else {
                // Handle the case where the AR app is not installed or cannot be opened
            }
        }
    }
}
