//
//  Utils.swift
//  andrey
//
//  Created by Andrey AG on 8/13/16.
//  Copyright © 2016 StartX. All rights reserved.
//

import UIKit

class Utils: NSObject {

	
	static func calcularRating(peli:Pelicula) -> CGFloat {
		
		let list:[Calificacion] = peli.calificaciones.allObjects as! [Calificacion]
		if(list.count > 0){
			var total:Double = 0.0
			for cal in list {
				total += (cal.valor?.doubleValue)!
			}
			
			let average: Double = (total/Double(list.count))
			return CGFloat(average)
		}else{
			return 0.0
		}
	}
	
}
