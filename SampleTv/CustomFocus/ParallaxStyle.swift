//
//  ParallaxStyle.swift
//  SampleTv
//
//  Created by @karthi on 11/04/23.
//

import UIKit

/// Represents the tilting & shifting parallax effect when you nudge your thumb slightly on a focused UIView
public struct ParallaxStyle {
	/// The max amount by which center.x will shift.
	/// Use a negative number for a reverse effect.
	let shiftHorizontal: Double

	/// The max amount by which center.y will shift.
	/// Use a negative number for a reverse effect.
	let shiftVertical: Double

	/// The max amount by which the view will rotate side-to-side, in radians.
	/// Use a negative number for a reverse effect.
	let tiltHorizontal: Double

	/// The max amount by which the view will rotate up-and-down, in radians.
	/// Use a negative number for a reverse effect.
	let tiltVertical: Double

	/// The focused appearance for a view
	let focusStyle: FocusedStyle

	var motionEffectGroup: UIMotionEffectGroup {

		func toRadians(degrees: Double) -> Double {
            return degrees * .pi/2 / 180;
		}

        let shiftX = UIInterpolatingMotionEffect(keyPath: "center.x", type: .tiltAlongHorizontalAxis)
		shiftX.minimumRelativeValue = -shiftHorizontal
		shiftX.maximumRelativeValue = shiftHorizontal

        let shiftY = UIInterpolatingMotionEffect(keyPath: "center.y", type: .tiltAlongVerticalAxis)
		shiftY.minimumRelativeValue = -shiftVertical
		shiftY.maximumRelativeValue = shiftVertical

        let rotateX = UIInterpolatingMotionEffect(keyPath: "layer.transform.rotation.y", type: .tiltAlongHorizontalAxis)
        rotateX.minimumRelativeValue = toRadians(degrees: -tiltHorizontal)
        rotateX.maximumRelativeValue = toRadians(degrees: tiltHorizontal)

        let rotateY = UIInterpolatingMotionEffect(keyPath: "layer.transform.rotation.x", type: .tiltAlongVerticalAxis)
        rotateY.minimumRelativeValue = toRadians(degrees: -tiltVertical)
        rotateY.maximumRelativeValue = toRadians(degrees: tiltVertical)

		let motionGroup = UIMotionEffectGroup()
		motionGroup.motionEffects = [shiftX, shiftY, rotateX, rotateY]

		return motionGroup
	}
}
