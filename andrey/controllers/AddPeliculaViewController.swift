//
//  AddPeliculaViewController.swift
//  andrey
//
//  Created by Andrey AG on 8/13/16.
//  Copyright © 2016 StartX. All rights reserved.
//

import UIKit
import SkyFloatingLabelTextField
import MagicalRecord



protocol ParentDelegate: class {
	func didFinishTask()
}

class AddPeliculaViewController: UIViewController,UIPickerViewDataSource,UIPickerViewDelegate  {

	weak var delegate:ParentDelegate?
	
	@IBOutlet var txtTitulo: SkyFloatingLabelTextField!
	@IBOutlet var pickerCategoria: UIPickerView!
	

	var pickerData:[Categoria] = []
	var currentCategory:Categoria?
	
	override func viewDidLoad() {
		super.viewDidLoad()
		view.backgroundColor = UIColor(colorLiteralRed: 0.0, green: 0.0, blue: 0.0, alpha: 0.80)
		view.opaque = false
		// Do any additional setup after loading the view.
		pickerData = Categoria.MR_findAll() as! [Categoria]
		if (pickerData.count > 0){
			self.currentCategory = pickerData[0]
		}
		
		pickerCategoria.dataSource = self
		pickerCategoria.delegate = self
		
		
		self.hideKeyboardWhenTappedAround()
	}
	
	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}
	
	
	
	
	//MARK: - Delegates and data sources
	//MARK: Data Sources
	func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
		return 1
	}
	func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
		return pickerData.count
	}
	
	//MARK: Delegates
	func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
		return pickerData[row].nombre
	}
 
	func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
		currentCategory = pickerData[row]
	}
	
	// MARK: Actions
	
	@IBAction func closeModal(sender: AnyObject) {
		self.hideModal()
	}
	
	func hideModal(){
		self.dismissViewControllerAnimated(true) {}
		self.delegate?.didFinishTask()
	}
	
	@IBAction func save(sender: AnyObject) {
		
		if let text = txtTitulo.text {
			//			if let floatingLabelTextField = txtTitulo as? SkyFloatingLabelTextField {
			if(text.isEmpty ) {
				txtTitulo.errorMessage = "Completar Título"
			}
			else {
				// The error message will only disappear when we reset it to nil or empty string
				txtTitulo.errorMessage = ""
				
				var peli:Pelicula!
				
				peli = Pelicula.MR_createEntity()
				peli.titulo = txtTitulo.text
				peli.categoria = currentCategory
				peli.fecha = NSDate()
				
				NSManagedObjectContext.MR_defaultContext().MR_saveToPersistentStoreAndWait()
				self.hideModal()
				
			}
			
		}
		
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
