//
//  ShadowView.swift
//  andrey
//
//  Created by Andrey AG on 8/14/16.
//  Copyright © 2016 StartX. All rights reserved.
//

import UIKit



class ShadowView: UIView {

	override func drawRect(rect: CGRect) {
		super.drawRect(rect)
		
		self.layer.masksToBounds =  false
		self.layer.shadowColor = UIColor.blackColor().CGColor;
		self.layer.shadowOffset = CGSizeMake(0.0, 0.5)
		self.layer.shadowOpacity = 0.5
		
	}

}
