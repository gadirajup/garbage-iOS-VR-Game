//
//  ViewController.swift
//  Garbage
//
//  Created by Prudhvi Gadiraju on 8/12/19.
//  Copyright © 2019 Prudhvi Gadiraju. All rights reserved.
//

import UIKit
import SceneKit
import ARKit

class ViewController: UIViewController, ARSCNViewDelegate {

    @IBOutlet var sceneView: ARSCNView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        sceneView.delegate = self
        sceneView.showsStatistics = true
        sceneView.debugOptions = [.showWorldOrigin, .showFeaturePoints]
        sceneView.autoenablesDefaultLighting = true
        
        drawSphere()
        drawBox()
        drawTorus()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        let configuration = ARWorldTrackingConfiguration()
        sceneView.session.run(configuration)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        sceneView.session.pause()
    }
    
    private func drawSphere() {
        let sphere = SCNNode(geometry: SCNSphere(radius: 0.05))
        sphere.geometry?.firstMaterial?.diffuse.contents = UIImage(named: "earth")
        sphere.geometry?.firstMaterial?.specular.contents = UIColor.white
        sphere.position = SCNVector3(0, 0, 0)
        sceneView.scene.rootNode.addChildNode(sphere)
    }
    
    private func drawBox() {
        let box = SCNNode(geometry: SCNBox(width: 0.1, height: 0.1, length: 0.1, chamferRadius: 0))
        box.geometry?.firstMaterial?.diffuse.contents = UIColor.orange
        box.geometry?.firstMaterial?.specular.contents = UIColor.white
        box.position = SCNVector3(0, 0.2, -0.3)
        sceneView.scene.rootNode.addChildNode(box)
    }
    
    private func drawTorus(){
        let torus = SCNNode(geometry: SCNTorus(ringRadius: 0.06, pipeRadius: 0.03))
        torus.geometry?.firstMaterial?.diffuse.contents = UIColor.purple
        torus.geometry?.firstMaterial?.specular.contents = UIColor.white
        torus.position = SCNVector3(-0.2, 0, 0)
        torus.eulerAngles = .init(90.toRadians(), 0, 0)
        sceneView.scene.rootNode.addChildNode(torus)
        
        let action = SCNAction.rotate(by: 360.toRadians(), around: .init(0, 1, 0), duration: 8)
        let repeatAction = SCNAction.repeatForever(action)
        
        torus.runAction(repeatAction)
    }
}
