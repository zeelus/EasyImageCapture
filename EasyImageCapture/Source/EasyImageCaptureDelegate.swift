//
//  EasyImageCaptureDelegate.swift
//  EasyImageCapture
//
//  Created by Gilbert Gwizdała on 26.11.2017.
//  Copyright © 2017 Gilbert Gwizdała. All rights reserved.
//

import Foundation
import AVFoundation
import UIKit

public protocol EasyImageCaptureDelegate {
    
    func capture(frame: CMSampleBuffer, atTime time: TimeInterval)
    
    func caputre(error: Error?)
    
    func capture(frame: CIImage, atTime time: TimeInterval)
    
    func capture(isPermission: Bool)
}

extension EasyImageCaptureDelegate {
    
    func caputre(error: Error?) {
        print("[EasyImageCapture]: Error - \(error?.localizedDescription ?? "Unknow error")")
    }
    
    func capture(frame: CMSampleBuffer, atTime time: TimeInterval) {
        guard let pixelbuffer = CMSampleBufferGetImageBuffer(frame) else { return }
        let ciImage = CIImage(cvImageBuffer: pixelbuffer)
        DispatchQueue.main.async {
            self.capture(frame: ciImage, atTime: time)
        }
    }
    
    func capture(frame: UIImage, atTime time: TimeInterval) { }
    
}
