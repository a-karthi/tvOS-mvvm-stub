//
//  CustomFocusableButton.swift
//  SampleTv
//
//  Created by @karthi on 11/04/23.
//

import UIKit

/// An implementation of CustomParallaxView that implements a pressDown state when Select is clicked.
/// Particularly useful for non-roundrect button shapes.
public class CustomFocusableButton: UIButton {
    
    public var focusedStyle: FocusedStyle = AppTheme.CustomFocus.defaultFocusedStyle

    public func setFocusStyle(focusedStyle: FocusedStyle) {
        self.focusedStyle = focusedStyle
        view.layer.shadowColor = focusedStyle.shadowColor
        view.layer.shadowOffset = focusedStyle.shadowOffset
        view.layer.shadowRadius = focusedStyle.shadowRadius
    }

	// MARK: Focus Engine Stuff

	// MARK: Animating selection - buttons should shrink & all that when they're clicked!
    public override func pressesBegan(_ presses: Set<UIPress>, with event: UIPressesEvent?) {
        super.pressesBegan(presses, with: event)
        guard presses.count == 1 else { return } // If you press multiple buttons at the same time, that shouldn't trigger a pressDown() animation.

        for press in presses where press.type == .select {
            pressDown()
        }
    }
    
    public override func pressesEnded(_ presses: Set<UIPress>, with event: UIPressesEvent?) {
        super.pressesEnded(presses, with: event)

        for press in presses where press.type == .select {
            pressUp()
        }
    }
    
    public override func pressesCancelled(_ presses: Set<UIPress>, with event: UIPressesEvent?) {
        super.pressesCancelled(presses, with: event)

        for press in presses where press.type == .select {
            pressUp()
        }
    }

	private func pressDown() {
        UIView.animate(withDuration: 0.1,
			delay: 0.0, usingSpringWithDamping: 0.9,
			initialSpringVelocity: 0.0,
                       options: .beginFromCurrentState,
			animations: { () -> Void in
            self.displayAsFocused(focused: false)
			}, completion: nil)
	}

	private func pressUp() {
        UIView.animate(withDuration: 0.2,
			delay: 0,
			usingSpringWithDamping: 0.9,
			initialSpringVelocity: 0,
                       options: .beginFromCurrentState,
			animations: { () -> Void in
            self.displayAsFocused(focused: true)
			}, completion: nil)
	}
}

extension CustomFocusableButton: CustomFocusableViewType {
	public var view: UIView { return self }
}






struct AppTheme {
    struct Colors {
        static let whiteColor = UIColor.white
        static let blueColor = UIColor.blue
        static let greenColor = UIColor.green

        static let backgroundColor = UIColor.yellow
    }

    struct Shadows {
        static let shadowColor = AppTheme.Colors.backgroundColor.cgColor
        static let shadowOpacity: Float = 0.4
        static let shadowRadius: CGFloat = 5
        static let shadowOffset = CGSizeZero

        static func applyShadowToLayer(layer: CALayer) {
            layer.shadowColor = Shadows.shadowColor
            layer.shadowOpacity = Shadows.shadowOpacity
            layer.shadowRadius = Shadows.shadowRadius
            layer.shadowOffset = Shadows.shadowOffset
        }
    }

    struct CustomFocus {
        static let defaultFocusedStyle = FocusedStyle(
            transform: CGAffineTransformMakeScale(1.1, 1.1),
            shadowColor: UIColor.black.withAlphaComponent(0.3).cgColor,
            shadowOffset: CGSize(width: 0, height: 16),
            shadowRadius: 25)

        static let defaultParallaxStyle = ParallaxStyle(
            shiftHorizontal: 4,
            shiftVertical: 4,
            tiltHorizontal: 10,
            tiltVertical: 10,
            focusStyle: CustomFocus.defaultFocusedStyle)
    }
}
