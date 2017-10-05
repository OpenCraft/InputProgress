//
//  InputProgress.swift
//  InputProgress
//
//  Created by Juliano Rotta on 04/10/17.
//

import UIKit

/// Sets up and handle both the bottom view and `UITextField` bars
public class InputProgress {
    
    // MARK: Private Properties
    
    /// Internal identifier tag for the bottom view bar
    private let viewBarIdentifier = 974216
    
    /// Internal identifier tag for the `UITextField` accessory view progress bars
    private let textfieldBarIdentifier = 395629
    
    /// Internal identifier for an auxiliar accessory view necessary when there's no accessory view on the `UITextField`
    private let placeholderAccessoryViewIdentifier = 822563
    
    // MARK: Public Properties
    
    /// The view which the bottom progress bar should be displayed
    public var presentingView: UIView
    
    /// The `UITextField` objects that should display the progress bars
    public var textFields: [UITextField]
    
    /// The current progress to be displayed. This value should be between 0 and 1. The default value is 0
    public var progress: CGFloat = 0 {
        didSet {
            updateBarState()
        }
    }
    
    /// The fill color of the progress bar. The default value is a light blue
    public var progressBarColor: UIColor = #colorLiteral(red: 0.3294117647, green: 0.6392156863, blue: 1, alpha: 1) {
        didSet {
            updateBarState()
        }
    }
    
    /// The height of the progress bar. The default value is 5
    public var progressBarHeight: CGFloat = 5 {
        didSet {
            updateBarState()
        }
    }
    
    /// Determines if the bottom progress bar should be displayed or not. The default value is true
    public var shouldDisplayBottomViewBar: Bool = true {
        didSet {
            updateBarState()
        }
    }
    
    // MARK: Init
    
    /// Class initializer
    public init(presentingView: UIView, textFields: [UITextField]) {
        self.presentingView = presentingView
        self.textFields = textFields
    }
    
    // MARK: Public Setup Methods
    
    /// Setup the progress bar view. For a custom progress abr, this
    /// method should be overriden
    ///
    /// - Parameters:
    ///   - frame: The frame of the progress bar
    ///   - color: The color of the progress bar
    /// - Returns: The progress bar `UIView`
    func setupProgressBar(frame: CGRect) -> UIView {
        let progressView = UIView(frame: frame)
        progressView.backgroundColor = progressBarColor
        return progressView
    }
    
    
    /// Setup the bottom view progress bar. By default, this bar is
    /// the same as the accessory view progress bar. Override this method
    /// for the implementation of a different bar for the view.
    ///
    /// - Parameters:
    ///   - frame: The frame of the progress bar
    ///   - color: The color of the progress bar
    /// - Returns: The progress bar `UIView`
    func setupBottomViewBar(frame: CGRect) -> UIView {
        let progressView = setupProgressBar(frame: frame)
        return progressView
    }
    
    // MARK: Private methods
    
    /// Adds the progress bar `UIView` on the bottom of the presentingView
    /// and on the top of each one of the textFields provided
    ///
    /// - Parameter progress: A `CGFloat` value between 0 and 1 representing
    /// the percentage of the progress bar to be filled
    private func updateBarState() {
        let progressBarWidth: CGFloat = progress * presentingView.frame.width
        
        // Add the progress bar to the bottom of the the view
        presentingView.viewWithTag(viewBarIdentifier)?.removeFromSuperview()
        if shouldDisplayBottomViewBar {
            let bottomBar = setupBottomViewBar(frame: CGRect(x: 0, y: presentingView.frame.height - progressBarHeight, width: progressBarWidth, height: progressBarHeight))
            bottomBar.tag = viewBarIdentifier
            presentingView.addSubview(bottomBar)
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
            let progressBar = setupProgressBar(frame: CGRect(x: 0, y: barOffset, width: progressBarWidth, height: progressBarHeight))
            progressBar.tag = textfieldBarIdentifier
            textField.inputAccessoryView?.addSubview(progressBar)
        }
    }
}
