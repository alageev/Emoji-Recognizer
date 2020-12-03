//
//  CameraViewController.swift
//  Emoji Recognizer
//
//  Created by Алексей Агеев on 03.12.2020.
//  Used code from https://medium.com/@gaspard.rosay/create-a-camera-app-with-swiftui-60876fcb9118
//

import UIKit
import SwiftUI

final class CameraViewController: UIViewController {
    let cameraController = CameraController()
    var previewView: UIView!
    
    override func viewDidLoad() {
        
        previewView = UIView(frame: CGRect(x:0, y:0, width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height))
        previewView.contentMode = UIView.ContentMode.scaleAspectFit
        view.addSubview(previewView)
        
        cameraController.prepare {(error) in
            if let error = error {
                print(error)
            }
            
            try? self.cameraController.displayPreview(on: self.previewView)
        }
        
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
