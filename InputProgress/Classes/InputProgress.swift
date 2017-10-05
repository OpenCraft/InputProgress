//
//  InputProgress.swift
//  InputProgress
//
//  Created by Juliano Rotta on 04/10/17.
//

import UIKit

public class InputProgress {
    
    public var presentingView: UIView
    public var textFields: [UITextField]
    
    public init(presentingView: UIView, textFields: [UITextField]) {
        self.presentingView = presentingView
        self.textFields = textFields
    }
    
    private func setupProgressBar(frame: CGRect, color: UIColor) -> UIView {
        let progressView = UIView(frame: frame)
        progressView.backgroundColor = color
        return progressView
    }
    
    public func setProgress(_ progress: CGFloat) {
        let barWidth: CGFloat = progress * presentingView.bounds.width
        let barHeight: CGFloat = 5
        let progressView = setupProgressBar(frame: CGRect(x: 0, y: presentingView.frame.height - barHeight, width: barWidth, height: barHeight), color: #colorLiteral(red: 0.3294117647, green: 0.6392156863, blue: 1, alpha: 1))
        presentingView.addSubview(progressView)
        
        textFields.forEach { textField in
            var barOffset: CGFloat = -barHeight
            if textField.inputAccessoryView == nil {
                textField.inputAccessoryView = setupProgressBar(frame: CGRect(x: 0, y: -barHeight, width: 0, height: barHeight), color: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0))
                barOffset = 0
            }
            
            textField.inputAccessoryView?.addSubview(setupProgressBar(frame: CGRect(x: 0, y: barOffset, width: barWidth, height: barHeight), color: #colorLiteral(red: 0.3294117647, green: 0.6392156863, blue: 1, alpha: 1)))
        }
    }
}
