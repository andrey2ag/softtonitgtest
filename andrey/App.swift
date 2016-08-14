//
//  App.swift
//  andrey
//
//  Created by Andrey AG on 8/13/16.
//  Copyright © 2016 StartX. All rights reserved.
//

import UIKit

class App: NSObject {

	static let INITIAL_LOAD:String = "initial_load";
	
	internal static func isInitialLoadCompleted() -> Bool! {
		let defaults = NSUserDefaults.standardUserDefaults()
		
		let value = defaults.objectForKey(App.INITIAL_LOAD) as? Bool
		
		if (value == nil){
			return false
		}
		return value;
	}
	
	internal static func setInitialLoadCompleted(value:Bool) {
		
		let defaults = NSUserDefaults.standardUserDefaults()
		defaults.setObject(value, forKey: App.INITIAL_LOAD)
		
	}
	
}
