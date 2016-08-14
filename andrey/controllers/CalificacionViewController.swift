//
//  CalificacionViewController.swift
//  andrey
//
//  Created by Andrey AG on 8/13/16.
//  Copyright © 2016 StartX. All rights reserved.
//

import UIKit
import HCSStarRatingView
import MagicalRecord

class CalificacionViewController: UIViewController {

	weak var delegate:ParentDelegate?
	
	@IBOutlet var labelTitulo: UILabel!
	@IBOutlet var labelCategoria: UILabel!
	@IBOutlet var labelNumCalificaciones: UILabel!
	@IBOutlet var labelCalificacionActual: HCSStarRatingView!
	@IBOutlet var nuevaCalificacion: HCSStarRatingView!
	
	var pelicula: Pelicula?
	
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
		
		labelTitulo.text = pelicula?.titulo
		labelCategoria.text = pelicula?.categoria?.nombre
		labelNumCalificaciones.text = "\(pelicula!.calificaciones.count) veces"
		

		labelCalificacionActual.value = Utils.calcularRating(pelicula!)

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
	
	
	@IBAction func guardarCalificacion(sender: AnyObject) {
		
		var cali:Calificacion!
		
		cali = Calificacion.MR_createEntity()
		cali.pelicula = self.pelicula
		cali.valor = nuevaCalificacion.value
		cali.fecha = NSDate()
		
		NSManagedObjectContext.MR_defaultContext().MR_saveToPersistentStoreAndWait()
		
		self.delegate?.didFinishTask()
		self.navigationController!.popViewControllerAnimated(true)
		
				
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
