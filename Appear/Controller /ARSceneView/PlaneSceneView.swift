
//
//  PlaneSceneView.swift
//  ARKitSpitfire
//
//  Created by Christopher Webb-Orenstein on 10/12/17.
//  Copyright © 2017 Christopher Webb-Orenstein. All rights reserved.
//
import ARKit
import SceneKit
import CoreLocation
import GLKit


@available(iOS 11.0, *)
class PlaneSceneView: ARSCNView {

    var planeNode: SCNNode!
    
    func setupPlane() {
        let text = SCNText(string: "The samudra manthana \n(Sanskrit: समुद्रमन्थन, lit. \nChurning of the ocean) \n is one of the best-known \nepisodes in the Hindu mythology, \nnarrated in the Bhagavata Purana, \n in the Mahabharata and in the Vishnu Purana. \nThe samudra manthana explains the origin of amrita, the nectar of immortality.",extrusionDepth:1)
        let material = SCNMaterial()
        material.diffuse.contents = UIColor.green

        text.font.withSize(12)  
        text.materials = [material]
        let node = SCNNode()
        node.position = SCNVector3(0,0,-0.5)
        node.scale = SCNVector3(x:0.01,y:0.01,z:0.01)
        node.geometry = text
      
        scene.rootNode.addChildNode(node)
        planeNode = scene.rootNode
       
    }
    
}


