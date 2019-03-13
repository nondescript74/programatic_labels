//
//  UIImage.swift
//  TestButtons
//
//  Created by Zahirudeen Premji on 3/13/19.
//  Attributions to https://stackoverflow.com/questions/9887959/programmatically-set-image-and-text-on-uibutton 
//
//

import Foundation
import UIKit

extension UIImage {
    
    func getResized(size: CGSize) -> UIImage? {
        if UIScreen.main.responds(to: #selector(NSDecimalNumberBehaviors.scale)) {
            UIGraphicsBeginImageContextWithOptions(size, false, UIScreen.main.scale)
        } else {
            UIGraphicsBeginImageContext(size)
        }
        
        self.draw(in: CGRect(x: 0, y: 0, width: size.width, height: size.height))
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return newImage;
    }
    
    func getResizedWithAspect(scaledToMaxWidth width: CGFloat? = nil, maxHeight height: CGFloat? = nil) -> UIImage? {
        let oldWidth = self.size.width
        let oldHeight = self.size.height
        
        var scaleToWidth = oldWidth
        if let width = width {
            scaleToWidth = width
        }
        
        var scaleToHeight = oldHeight
        if let height = height {
            scaleToHeight = height
        }
        
        let scaleFactor = (oldWidth > oldHeight) ? scaleToWidth / oldWidth : scaleToHeight / oldHeight
        
        let newHeight = oldHeight * scaleFactor
        let newWidth = oldWidth * scaleFactor
        let newSize = CGSize(width: newWidth, height: newHeight)
        
        return getResized(size: newSize)
    }
}
