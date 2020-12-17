//
//  CameraViewController.swift
//  Emoji Recognizer
//
//  Created by Алексей Агеев on 03.12.2020.
//  Used code from https://medium.com/@gaspard.rosay/create-a-camera-app-with-swiftui-60876fcb9118
//

import SwiftUI
import ARKit

final class CameraViewController: UIViewController, ARSessionDelegate {
    
    var sceneView: ARSCNView!
    
    var contentNode: SCNNode?
    
    var currentFaceAnchor: ARFaceAnchor?
    
    override func viewDidLoad() {
        sceneView = ARSCNView(frame: CGRect(x:0, y:0, width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height))
        
        sceneView.contentMode = UIView.ContentMode.scaleAspectFit
        view.addSubview(sceneView)
        
        sceneView.delegate = self
        sceneView.session.delegate = self
        sceneView.automaticallyUpdatesLighting = true
    }
    
    override func viewDidAppear(_ animated: Bool) {
        resetTracking()
    }
    
    /// - Tag: ARFaceTrackingSetup
    func resetTracking() {
        guard ARFaceTrackingConfiguration.isSupported else { return }
        let configuration = ARFaceTrackingConfiguration()
        configuration.isLightEstimationEnabled = true
        sceneView.session.run(configuration, options: .resetTracking)
    }
    
}

extension CameraViewController: UIViewControllerRepresentable {
    public typealias UIViewControllerType = CameraViewController
    
    public func makeUIViewController(context: UIViewControllerRepresentableContext<CameraViewController>) -> CameraViewController {
        return CameraViewController()
    }
    
    public func updateUIViewController(_ uiViewController: CameraViewController, context: UIViewControllerRepresentableContext<CameraViewController>) {
    }
}

extension CameraViewController: ARSCNViewDelegate {
    func renderer(_ renderer: SCNSceneRenderer, didAdd node: SCNNode, for anchor: ARAnchor) {
        guard let faceAnchor = anchor as? ARFaceAnchor else { return }
        currentFaceAnchor = faceAnchor
        
        let faceGeometry = ARSCNFaceGeometry(device: sceneView.device!)!
        
        contentNode = SCNNode(geometry: faceGeometry)
        
        
        DispatchQueue.main.sync {
            for i in 0 ..< EmojiSet.shared.emojiArray.count {
                EmojiSet.shared.emojiArray[i].compute(shapes: self.currentFaceAnchor!.blendShapes)
            }
        }
        
    }
    
    /// - Tag: ARFaceGeometryUpdate
    func renderer(_ renderer: SCNSceneRenderer, didUpdate node: SCNNode, for anchor: ARAnchor) {
        guard anchor == currentFaceAnchor else {
            return
        }
        
        guard let faceAnchor = anchor as? ARFaceAnchor else { return }
        
        DispatchQueue.main.sync {
            for i in 0 ..< EmojiSet.shared.emojiArray.count {
                EmojiSet.shared.emojiArray[i].compute(shapes: faceAnchor.blendShapes)
            }
        }
    }
}
