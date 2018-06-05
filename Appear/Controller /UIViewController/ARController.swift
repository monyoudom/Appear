//
//  ViewController.swift
//  ARAnimation
//
//  Created by Esteban Herrera on 7/11/17.
//  Copyright © 2017 Esteban Herrera. All rights reserved.
//

import UIKit
import ARKit

class ARController: UIViewController {
    
    @IBOutlet weak var sceneView: ARSCNView!
    var check : Bool = false
    
    @IBOutlet weak var switchBtn: UISwitch!
    
    
    @IBOutlet weak var AddObject: UIButton!
    lazy var fadeAction: SCNAction = {
        return .sequence([
            .fadeOpacity(by: 0.8, duration: 0.3),
            .wait(duration: 100),
            .fadeOut(duration: 3)
            ])
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Angkor AR"
        AddObject.isHidden = true
        switchBtn.isOn = false
        sceneView.allowsCameraControl = false
        addTapGestureToSceneView()
        
        configureLighting()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setUpSceneView()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        sceneView.session.pause()
    }
    
    func setUpSceneView() {
        if #available(iOS 11.3, *) {
            guard let referenceImages = ARReferenceImage.referenceImages(inGroupNamed: "AR Resources", bundle: nil) else { return }
            let configuration = ARWorldTrackingConfiguration()
            configuration.planeDetection = .horizontal
            configuration.detectionImages = referenceImages
            sceneView.debugOptions = [ARSCNDebugOptions.showFeaturePoints]
            sceneView.session.run(configuration,options: [.resetTracking, .removeExistingAnchors])
            sceneView.delegate = self
        } 
        
    }
    
    func configureLighting() {
        sceneView.autoenablesDefaultLighting = true
        sceneView.automaticallyUpdatesLighting = true
    }
    @objc func addShipToSceneView(withGestureRecognizer recognizer: UIGestureRecognizer) {
        let tapLocation = recognizer.location(in: sceneView)
        let hitTestResults = sceneView.hitTest(tapLocation, types: .existingPlaneUsingExtent)
        
        guard let hitTestResult = hitTestResults.first else { return }
        let translation = hitTestResult.worldTransform.translation
        let x = translation.x
        let y = translation.y
        let z = translation.z
        
        guard let shipScene = SCNScene(named: "angkorwat.scn"),
            let shipNode = shipScene.rootNode.childNode(withName: "angkorwat", recursively: false)
            else {
                print("Why")
                
                return }
        
        shipNode.eulerAngles.x = -.pi/2
        shipNode.eulerAngles.y = -.pi/2
        shipNode.position = SCNVector3(x,y,z)
        sceneView.scene.rootNode.addChildNode(shipNode)
    }
    
    func addTapGestureToSceneView() {
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(ARController.addShipToSceneView(withGestureRecognizer:)))
        sceneView.addGestureRecognizer(tapGestureRecognizer)
    }
    
    
    
    
    @IBAction func SwitchAction(_ sender: UISwitch) {
        
        if sender.isOn {
            self.switchBtn.isOn = true
            
        } else {
            self.switchBtn.isOn = false
        }
    }
    
    
}

extension float4x4 {
    var translation: float3 {
        let translation = self.columns.3
        return float3(translation.x, translation.y, translation.z)
    }
}

extension UIColor {
    open class var transparentLightBlue: UIColor {
        return UIColor(red: 90/255, green: 200/255, blue: 250/255, alpha: 0.50)
    }
}

extension ARController: ARSCNViewDelegate {
    func renderer(_ renderer: SCNSceneRenderer, didAdd node: SCNNode, for anchor: ARAnchor) {
        // 1
        
       
        if anchor.isMember(of: ARPlaneAnchor.self) {
            if switchBtn.isOn {
                if !check {
                    check = true
                    guard let planeAnchor = anchor as? ARPlaneAnchor else { return }
                    
                    // 2
                    let width = CGFloat(planeAnchor.extent.x)
                    let height = CGFloat(planeAnchor.extent.z)
                    let plane = SCNPlane(width: width, height: height)
                    
                    // 3
                    plane.materials.first?.diffuse.contents = UIColor.transparentLightBlue
                    
                    // 4
                    let planeNode = SCNNode(geometry: plane)
                    
                    // 5
                    let x = CGFloat(planeAnchor.center.x)
                    let y = CGFloat(planeAnchor.center.y)
                    let z = CGFloat(planeAnchor.center.z)
                    planeNode.position = SCNVector3(x,y,z)
                    planeNode.eulerAngles.x = -.pi / 2
                    
                    // 6
                    node.addChildNode(planeNode)
                    
                }
            }
        } else {
            let when = DispatchTime.now() + 1// change 2 to desired number of seconds
            DispatchQueue.main.asyncAfter(deadline: when) {
                self.AddObject.isHidden = false
            }
            let imageAnchor = anchor as? ARImageAnchor
            
            // TODO: Comment out code
            let planeNode = self.getPlaneNode(withReferenceImage: (imageAnchor?.referenceImage)!)
            planeNode.opacity = 0.0
            planeNode.eulerAngles.x = -.pi / 2
            planeNode.runAction(self.fadeAction)
            node.addChildNode(planeNode)
            
            guard let shipScene = SCNScene(named: "win.scn"),
                let shipNode = shipScene.rootNode.childNode(withName: "temple", recursively: false)
                else {
                    print("Why")
                    
                    return }
            
            shipNode.position = SCNVector3(0.01,0.01,0.01)

            shipNode.eulerAngles.x = -.pi/2
            shipNode.eulerAngles.y = -.pi/2
            sceneView.scene.rootNode.addChildNode(shipNode)
            
        }

  
    }
    
    
    func getPlaneNode(withReferenceImage image: ARReferenceImage) -> SCNNode {
        let plane = SCNPlane(width: image.physicalSize.width,
                             height: image.physicalSize.height)
        let node = SCNNode(geometry: plane)
        return node
    }
}




extension ARController: UIPopoverPresentationControllerDelegate {
    
    enum SegueIdentifier: String {
        case showSettings
        case showObjects
    }
    
    // MARK: - Interface Actions
    
    @IBAction func chooseObject(_ button: UIButton) {
        
        //textManager.cancelScheduledMessage(forType: .contentPlacement)
        performSegue(withIdentifier: SegueIdentifier.showObjects.rawValue, sender: button)
    }
    
    
    func adaptivePresentationStyle(for controller: UIPresentationController) -> UIModalPresentationStyle {
        return .none
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        // All popover segues should be popovers even on iPhone.
        if let popoverController = segue.destination.popoverPresentationController, let button = sender as? UIButton {
            popoverController.delegate = self
            popoverController.sourceRect = button.bounds
        }
    }
    
}

