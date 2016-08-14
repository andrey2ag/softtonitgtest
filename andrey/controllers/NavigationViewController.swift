//
//  NavigationViewController.swift
//  andrey
//
//  Created by Andrey AG on 8/13/16.
//  Copyright © 2016 StartX. All rights reserved.
//

import UIKit
import MagicalRecord

extension UIViewController {
	func hideKeyboardWhenTappedAround() {
		let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
		view.addGestureRecognizer(tap)
	}
	
	func dismissKeyboard() {
		view.endEditing(true)
	}
}

class NavigationViewController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
		
		MagicalRecord.enableShorthandMethods()
		self.preloadData()
    }
	
	
	func preloadData(){
		
//		let lista:[Pelicula] = Pelicula.MR_findAll() as! [Pelicula]
//		print("Lista Peliculas")
//		for cat in lista {
//			print(cat.categoria?.nombre)
//		}
		
		if (!App.isInitialLoadCompleted()){
		
			let categoryList: [String] = ["Acción", "Historia", "Animadas", "Suspenso", "Terror" ]
			
			var categoria:Categoria!
			for category in categoryList {
				categoria = Categoria.MR_createEntity()
				categoria.nombre = category
				categoria.fecha = NSDate()
				
			}
			NSManagedObjectContext.MR_defaultContext().MR_saveToPersistentStoreAndWait()
			
			

			App.setInitialLoadCompleted(true)
			
		}
		
	}
	

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
