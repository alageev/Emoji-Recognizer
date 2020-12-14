//
//  Emoji.swift
//  Emoji Recognizer
//
//  Created by Алексей Агеев on 03.12.2020.
//

import Foundation
import ARKit

struct Emoji {
    init(image: String,
         leftBrow: ARFaceAnchor.BlendShapeLocation? = nil,
         rightBrow: ARFaceAnchor.BlendShapeLocation? = nil,
         leftEye: ARFaceAnchor.BlendShapeLocation? = nil,
         rightEye: ARFaceAnchor.BlendShapeLocation? = nil,
         leftMouth: ARFaceAnchor.BlendShapeLocation? = nil,
         rightMouth: ARFaceAnchor.BlendShapeLocation? = nil,
         tongue: ARFaceAnchor.BlendShapeLocation? = nil,
         jaw: ARFaceAnchor.BlendShapeLocation? = nil) {
        
        self.image = image
        self.leftBrow = leftBrow
        self.rightBrow = rightBrow
        self.leftEye = leftEye
        self.rightEye = rightEye
        self.leftMouth = leftMouth
        self.rightMouth = rightMouth
        self.tongue = tongue
        self.jaw = jaw
    }
    let image: String
    let leftBrow: ARFaceAnchor.BlendShapeLocation?
    let rightBrow: ARFaceAnchor.BlendShapeLocation?
    let leftEye: ARFaceAnchor.BlendShapeLocation?
    let rightEye: ARFaceAnchor.BlendShapeLocation?
    let leftMouth: ARFaceAnchor.BlendShapeLocation?
    let rightMouth: ARFaceAnchor.BlendShapeLocation?
    let tongue: ARFaceAnchor.BlendShapeLocation?
    let jaw: ARFaceAnchor.BlendShapeLocation?
    
    var probability = 0.0
    
    mutating func compute(shapes: [ARFaceAnchor.BlendShapeLocation : NSNumber]) {
        let coefficient = 0.0
        var value = 0.0
        
        if leftBrow != nil {
            value += shapes[leftBrow!]?.doubleValue ?? coefficient
        } else {
            value += coefficient
        }
        if rightBrow != nil {
            value += shapes[rightBrow!]?.doubleValue ?? coefficient
        } else {
            value += coefficient
        }
        if leftEye != nil {
            value += shapes[leftEye!]?.doubleValue ?? coefficient
        } else {
            value += coefficient
        }
        if rightEye != nil {
            value += shapes[rightEye!]?.doubleValue ?? coefficient
        } else {
            value += coefficient
        }
        if leftMouth != nil {
            value += shapes[leftMouth!]?.doubleValue ?? coefficient
        } else {
            value += coefficient
        }
        if rightMouth != nil {
            value += shapes[rightMouth!]?.doubleValue ?? coefficient
        } else {
            value += coefficient
        }
        
        if tongue == .tongueOut {
            value += shapes[tongue!]?.doubleValue ?? coefficient
        } else {
            value += 1.0 - (shapes[.tongueOut]?.doubleValue ?? 0.0)
        }
        
        if jaw == .jawOpen {
            value += shapes[jaw!]?.doubleValue ?? 0.0
        } else {
            value += 1.0 - (shapes[.jawOpen]?.doubleValue ?? 0.0)
        }
        self.probability = value
    }
}
