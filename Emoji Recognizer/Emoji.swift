//
//  Emoji.swift
//  Emoji Recognizer
//
//  Created by Алексей Агеев on 03.12.2020.
//

import Foundation

struct Emoji: Hashable {
    var image:            String     //изображение
    var leftBrow:         BrowState  //состояние левой брови
    var rightBrow:        BrowState  //состояние правой брови
    var leftEye:          EyeState   //состояние левого глаза
    var rightEye:         EyeState   //состояние правого глаза
    var leftMouthCorner:  MouthState //состояние левого уголка губ
    var rightMouthCorner: MouthState //состояние правого уголка губ
    var tongueOut:        Bool       //состояние языка
    
    enum BrowState {
        case browDown    //downward movement of the outer portion of the eyebrow.
        case browInnerUp //upward movement of the inner portion of both eyebrows.
        case browOuterUp //upward movement of the outer portion of the eyebrow.
    }
    
    enum EyeState {
        case eyeBlink    //closure of the eyelids over the eye
        case eyeLookDown //movement of the eyelids consistent with a downward gaze
        case eyeLookIn   //movement of the eyelids consistent with a inward gaze
        case eyeLookOut  //movement of the eyelids consistent with an outward gaze.
        case eyeLookUp   //movement of the eyelids consistent with an upward gaze.
        case eyeSquint   //contraction of the face around the eye.
        case eyeWide     //widening of the eyelids around the eye.
    }
    
    enum MouthState {
        case mouthClose         //closure of the lips independent of jaw position.
        case mouthFunnel        //contraction of both lips into an open shape.
        case mouthPucker        //contraction and compression of both closed lips.
        case mouthSide          //sideward movement of both lips together.
        case mouthSideSmile     //upward movement of the corner of the mouth.
        case mouthFullSmile     //upward movement of both corners of the mouth.
        case mouthSideFrown     //downward movement of the corner of the mouth.
        case mouthFullFrown     //downward movement of both corners of the mouth.
        case mouthDimpleSide    //backward movement of the corner of the mouth.
        case mouthDimpleFull    //backward movement of both corners of the mouth.
        case mouthStretchSide   //sideward movement of the corner of the mouth.
        case mouthStretchFull   //sideward movement of both corners of the mouth.
        case mouthRollLower     //movement of the lower lip toward the inside of the mouth.
        case mouthRollUpper     //movement of the upper lip toward the inside of the mouth.
        case mouthShrugLower    //outward movement of the lower lip.
        case mouthShrugUpper    //outward movement of the upper lip.
        case mouthPressSide     //upward compression of the lower lip on one side.
        case mouthPressFull     //upward compression of the lower lip on both sides.
        case mouthLowerDownSide //downward movement of the lower lip on one side.
        case mouthLowerDownFull //downward movement of the lower lip on both sides.
        case mouthUpperUpSide   //upward movement of the upper lip on one side.
        case mouthUpperUpFull   //upward movement of the upper lip on both sides.
    }
    
    enum JawState {
        case jawForward      //forward movement of the lower jaw.
        case jawLeft         //leftward movement of the lower jaw.
        case jawRight        //rightward movement of the lower jaw.
        case jawOpen         //opening of the lower jaw.
    }
    
    enum CheekState {
        case cheekPuff       //outward movement of both cheeks.
        case cheekSquintSide //upward movement of the cheek around and below the eye.
        case cheekSquintFull //upward movement of both cheeks around and below the eyes.
    }
    
    enum NoseState {
        case noseSneerSide   //raising of one side of the nose around the nostril.
        case noseSneerFull   //raising of both sides of the nose around the nostrils.
    }
}
