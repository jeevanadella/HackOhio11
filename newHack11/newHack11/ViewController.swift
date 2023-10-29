//
//  ViewController.swift
//  newHack11
//
//  Created by Anirudh Kondapaneni on 10/28/23.
//

import UIKit
import SceneKit
import ARKit

class ViewController: UIViewController, ARSCNViewDelegate {

    @IBOutlet var sceneView: ARSCNView!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Set the view's delegate
        sceneView.delegate = self

        // Show statistics such as fps and timing information
        sceneView.showsStatistics = true

        // Create a new scene
        let scene = SCNScene(named: "art.scnassets/cone.scn")!

        // Set the scene to the view
        sceneView.scene = scene

        // Find the DummyShip node
        if let dummyShip = scene.rootNode.childNode(withName: "DummyShip", recursively: true) {
            // Create a bounce animation
            let bounceUp = SCNAction.moveBy(x: 0, y: 15.0, z: 0, duration: 1.0)
            let bounceDown = SCNAction.moveBy(x: 0, y: -15.0, z: 0, duration: 1.0)
            let bounceSequence = SCNAction.sequence([bounceUp, bounceDown])
            let bounceRepeat = SCNAction.repeatForever(bounceSequence)

            // Run the bounce animation on the DummyShip node
            dummyShip.runAction(bounceRepeat)
        }
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        // Create a session configuration
        let configuration = ARWorldTrackingConfiguration()

        // Run the view's session
        sceneView.session.run(configuration)
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)

        // Pause the view's session
        sceneView.session.pause()
    }
    
/*
    // Override to create and configure nodes for anchors added to the view's session.
    func renderer(_ renderer: SCNSceneRenderer, nodeFor anchor: ARAnchor) -> SCNNode? {
        let node = SCNNode()
     
        return node
    }
*/
    
    func session(_ session: ARSession, didFailWithError error: Error) {
        // Present an error message to the user
        
    }
    
    func sessionWasInterrupted(_ session: ARSession) {
        // Inform the user that the session has been interrupted, for example, by presenting an overlay
        
    }
    
    func sessionInterruptionEnded(_ session: ARSession) {
        // Reset tracking and/or remove existing anchors if consistent tracking is required
        
    }
}
