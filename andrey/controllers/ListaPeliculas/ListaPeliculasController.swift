//
//  ListaPeliculasController.swift
//  andrey
//
//  Created by Andrey AG on 8/13/16.
//  Copyright © 2016 StartX. All rights reserved.
//

import UIKit
import MagicalRecord

class ListaPeliculasController: UITableViewController, ParentDelegate {

	func didFinishTask() {
		self.reloadTableData()

	}
	
	func reloadTableData(){
		listaPeliculas = Pelicula.MR_findAllSortedBy("fecha", ascending: true) as! [Pelicula]
		self.myTableView.reloadData()
	}
	
	@IBOutlet var myTableView: UITableView!
	
	var selectedPelicula:Pelicula?
	var listaPeliculas: [Pelicula] = [Pelicula]()
	
	
    override func viewDidLoad() {
        super.viewDidLoad()

		listaPeliculas = Pelicula.MR_findAllSortedBy("fecha", ascending: true) as! [Pelicula]
//		self.hideKeyboardWhenTappedAround()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

	override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return self.listaPeliculas.count
	}
	
	
	override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
		let cell:PeliculaCell = self.myTableView.dequeueReusableCellWithIdentifier("cellPelicula")! as! PeliculaCell
		cell.labelTitulo.text = self.listaPeliculas[indexPath.row].titulo;
		cell.labelCategoria.text = self.listaPeliculas[indexPath.row].categoria!.nombre;
		cell.labelRating.value = Utils.calcularRating(self.listaPeliculas[indexPath.row])
		return cell
	}
	
	override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
		print("You selected cell #\(indexPath.row)!")
		
		self.selectedPelicula = self.listaPeliculas[indexPath.row]
		
		dispatch_async(dispatch_get_main_queue()) {
			self.performSegueWithIdentifier("calificarSegue", sender: self);
		}
		self.myTableView.deselectRowAtIndexPath(indexPath, animated: true)
	}
	
	override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {

		if (segue.identifier == "addPeliculaSegue"){
			let addPelicula = (segue.destinationViewController as! AddPeliculaViewController)
			addPelicula.delegate = self
		}else if (segue.identifier == "calificarSegue"){
			let calificacion = (segue.destinationViewController as! CalificacionViewController)
			calificacion.pelicula = self.selectedPelicula!
			calificacion.delegate = self
		}

	}
	
	override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
		return true
	}
	
	override func tableView(tableView: UITableView, editActionsForRowAtIndexPath indexPath: NSIndexPath) -> [UITableViewRowAction]? {
		
		let deleteAction = UITableViewRowAction(style: .Default, title: "Eliminar") {action in
			//handle delete
			let pelicula:Pelicula = self.listaPeliculas[indexPath.row]
			pelicula.MR_deleteEntity()
			
			NSManagedObjectContext.MR_defaultContext().MR_saveToPersistentStoreAndWait()
			
			self.reloadTableData()
		}
		
//		let editAction = UITableViewRowAction(style: .Normal, title: "Edit") {action in
//			//handle edit
//		}
		
//		return [deleteAction, editAction]
		return [deleteAction]
	}
	

}
