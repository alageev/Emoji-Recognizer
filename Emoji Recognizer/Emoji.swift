//
//  Emoji.swift
//  Emoji Recognizer
//
//  Created by Алексей Агеев on 03.12.2020.
//

import ARKit

struct Emoji: Identifiable {
    
    let id: UUID
    let image: String
    private let leftBrow: ARFaceAnchor.BlendShapeLocation?
    private let rightBrow: ARFaceAnchor.BlendShapeLocation?
    private let leftEye: ARFaceAnchor.BlendShapeLocation?
    private let rightEye: ARFaceAnchor.BlendShapeLocation?
    private let leftMouth: ARFaceAnchor.BlendShapeLocation?
    private let rightMouth: ARFaceAnchor.BlendShapeLocation?
    private let tongue: ARFaceAnchor.BlendShapeLocation?
    private let jaw: ARFaceAnchor.BlendShapeLocation?
    
    var probability = 0.0
    
    init(image: String,
         leftBrow: ARFaceAnchor.BlendShapeLocation? = nil,
         rightBrow: ARFaceAnchor.BlendShapeLocation? = nil,
         leftEye: ARFaceAnchor.BlendShapeLocation? = nil,
         rightEye: ARFaceAnchor.BlendShapeLocation? = nil,
         leftMouth: ARFaceAnchor.BlendShapeLocation? = nil,
         rightMouth: ARFaceAnchor.BlendShapeLocation? = nil,
         tongue: ARFaceAnchor.BlendShapeLocation? = nil,
         jaw: ARFaceAnchor.BlendShapeLocation? = nil) {
        self.id = UUID()
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
    
    mutating func compute(shapes: [ARFaceAnchor.BlendShapeLocation: NSNumber]) {
        let threshold = 0.4
        
        var probabilities: Set<Double> = []
        
        if leftBrow != nil, let leftBrow = shapes[leftBrow!]?.doubleValue, leftBrow > threshold {
            probabilities.insert(leftBrow)
        }

        if rightBrow != nil, let rightBrow = shapes[rightBrow!]?.doubleValue, rightBrow > threshold {
            probabilities.insert(rightBrow)
        }
        
        if leftEye != nil, let leftEye = shapes[leftEye!]?.doubleValue, leftEye > threshold {
            probabilities.insert(leftEye)
        }
        
        if rightEye != nil, let rightEye = shapes[rightEye!]?.doubleValue, rightEye > threshold {
            probabilities.insert(rightEye)
        }
        
        if leftMouth != nil, let leftMouth = shapes[leftMouth!]?.doubleValue, leftMouth > threshold {
            probabilities.insert(leftMouth)
        }
        
        if rightMouth != nil, let rightMouth = shapes[rightMouth!]?.doubleValue, rightMouth > threshold {
            probabilities.insert(rightMouth)
        }
        
        let tongueValue = shapes[.tongueOut]!.doubleValue
        
        if tongue != nil {
            probabilities.insert(tongueValue)
        } else {
            probabilities.insert(1 - tongueValue)
        }
        
        let jawValue = shapes[.jawOpen]!.doubleValue
        
        if jaw != nil {
            probabilities.insert(5 * jawValue)
        } else {
            probabilities.insert(1 - jawValue)
        }
        
        self.probability = computeDistance(probabilities)
    }
    
    private func computeDistance(_ values: Set<Double>) -> Double {
        var distance = 0.0
        //Euclidean metric
        for value in values {
            distance += value * value
        }
        return sqrt(distance)
    }
}
