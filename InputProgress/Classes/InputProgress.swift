//
//  InputProgress.swift
//  InputProgress
//
//  Created by Juliano Rotta on 04/10/17.
//

import UIKit

public class InputProgress {
    
    // MARK: Private Properties
    
    private let viewBarIdentifier = 9742164358
    private let textfieldBarIdentifier = 395629421
    private let placeholderAccessoryViewIdentifier = 822563522
    
    // MARK: Public Properties
    
    public var presentingView: UIView
    public var textFields: [UITextField]
    
    public var progress: CGFloat = 0 {
        didSet {
            setProgress(progress)
        }
    }
    
    public var progressBarColor: UIColor = #colorLiteral(red: 0.3294117647, green: 0.6392156863, blue: 1, alpha: 1) {
        didSet {
            setProgress(progress)
        }
    }
    
    public var progressBarHeight: CGFloat = 5 {
        didSet {
            setProgress(progress)
        }
    }
    
    public var shouldDisplayBarView: Bool = true {
        didSet {
            setProgress(progress)
        }
    }
    
    // MARK: Init
    
    public init(presentingView: UIView, textFields: [UITextField]) {
        self.presentingView = presentingView
        self.textFields = textFields
    }
    
    // MARK: Public Methods
    
    
    /// Setup the progress bar view. For a custom progress abr, this
    /// method should be overriden
    ///
    /// - Parameters:
    ///   - frame: The frame of the progress bar
    ///   - color: The color of the progress bar
    /// - Returns: The progress bar `UIView`
    private func setupProgressBar(frame: CGRect, color: UIColor) -> UIView {
        let progressView = UIView(frame: frame)
        progressView.backgroundColor = color
        return progressView
    }
    
    
    /// Adds the progress bar `UIView` on the bottom of the presentingView
    /// and on the top of each one of the textFields provided
    ///
    /// - Parameter progress: A `CGFloat` value between 0 and 1 representing
    /// the percentage of the progress bar to be filled
    public func setProgress(_ progress: CGFloat) {
        let progressBarWidth: CGFloat = progress * presentingView.bounds.width
        
        // Add the progress bar to the bottom of the the view
        if shouldDisplayBarView {
            let progressView = setupProgressBar(frame: CGRect(x: 0, y: presentingView.frame.height - progressBarHeight, width: progressBarWidth, height: progressBarHeight), color: progressBarColor)
            presentingView.addSubview(progressView)
        }
        
        // Add the progress bar for each one of the text fields
        textFields.forEach { textField in
            
            // The progress bar is presented over the textField accessory view, out of its frame
            var barOffset: CGFloat = -progressBarHeight
            
            // The first accessory view must take all the view width, so if there's no
            // accessory view we add a transparent accessory view pefore appending the progress bar
            if textField.inputAccessoryView == nil {
                let placeholderAccessoryView = UIView(frame: CGRect(x: 0, y: -progressBarHeight, width: 0, height: progressBarHeight))
                placeholderAccessoryView.backgroundColor = .clear
                placeholderAccessoryView.tag = placeholderAccessoryViewIdentifier
                textField.inputAccessoryView = placeholderAccessoryView
            }
            
            // If the textField contains an accessory view, but this view is our invisible placeholder view,
            // there's no need to offset the progress bar
            if textField.inputAccessoryView?.tag == placeholderAccessoryViewIdentifier {
                barOffset = 0
            }
            
            // Remove any previous progress bar, in case of the progress is being updated
            textField.inputAccessoryView?.viewWithTag(textfieldBarIdentifier)?.removeFromSuperview()
            
            // Add the progress bar
            let progressBar = setupProgressBar(frame: CGRect(x: 0, y: barOffset, width: progressBarWidth, height: progressBarHeight), color: progressBarColor)
            progressBar.tag = textfieldBarIdentifier
            textField.inputAccessoryView?.addSubview(setupProgressBar(frame: CGRect(x: 0, y: barOffset, width: progressBarWidth, height: progressBarHeight), color: progressBarColor))
        }
    }
}
