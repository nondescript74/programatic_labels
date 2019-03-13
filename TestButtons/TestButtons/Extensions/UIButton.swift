//
//  UIButton.swift
//  TestButtons
//
//  Created by Zahirudeen Premji on 3/13/19.
//  attributions to https://stackoverflow.com/questions/9887959/programmatically-set-image-and-text-on-uibutton
//

import Foundation
import UIKit

extension UIButton {
    func setAttributedTextWithImagePrefix(image: UIImage, text: String, for state: UIControl.State) {
        let fullString = NSMutableAttributedString()
        
        if let imageString = getImageAttributedString(image: image) {
            fullString.append(imageString)
        }
        
        fullString.append(NSAttributedString(string: "  " + text))
        
        self.setAttributedTitle(fullString, for: state)
    }
    
    func setAttributedTextWithImageSuffix(image: UIImage, text: String, for state: UIControl.State) {
        let fullString = NSMutableAttributedString(string: text + "  ")
        
        if let imageString = getImageAttributedString(image: image) {
            fullString.append(imageString)
        }
        
        self.setAttributedTitle(fullString, for: state)
    }
    
    fileprivate func getImageAttributedString(image: UIImage) -> NSAttributedString? {
        let buttonHeight = self.frame.height
        
        if let resizedImage = image.getResizedWithAspect(maxHeight: buttonHeight - 10) {  // if let resizedImage = image.getResizedWithAspect(maxHeight: buttonHeight - 10) {
            let imageAttachment = NSTextAttachment()
            imageAttachment.bounds = CGRect(x: 0, y: ((self.titleLabel?.font.capHeight)! - resizedImage.size.height).rounded() / 2, width: resizedImage.size.width, height: resizedImage.size.height)
            imageAttachment.image = resizedImage
            let image1String = NSAttributedString(attachment: imageAttachment)
            return image1String
        }
        
        return nil
    }
}
