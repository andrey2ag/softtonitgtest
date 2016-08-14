// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to Categoria.swift instead.

import Foundation
import CoreData

public enum CategoriaAttributes: String {
    case fecha = "fecha"
    case nombre = "nombre"
}

public enum CategoriaRelationships: String {
    case peliculas = "peliculas"
}

public class _Categoria: NSManagedObject {

    // MARK: - Class methods

    public class func entityName () -> String {
        return "Categoria"
    }

    public class func entity(managedObjectContext: NSManagedObjectContext) -> NSEntityDescription? {
        return NSEntityDescription.entityForName(self.entityName(), inManagedObjectContext: managedObjectContext)
    }

    // MARK: - Life cycle methods

    public override init(entity: NSEntityDescription, insertIntoManagedObjectContext context: NSManagedObjectContext?) {
        super.init(entity: entity, insertIntoManagedObjectContext: context)
    }

    public convenience init?(managedObjectContext: NSManagedObjectContext) {
        guard let entity = _Categoria.entity(managedObjectContext) else { return nil }
        self.init(entity: entity, insertIntoManagedObjectContext: managedObjectContext)
    }

    // MARK: - Properties

    @NSManaged public
    var fecha: NSDate?

    @NSManaged public
    var nombre: String?

    // MARK: - Relationships

    @NSManaged public
    var peliculas: NSSet

}

extension _Categoria {

    func addPeliculas(objects: NSSet) {
        let mutable = self.peliculas.mutableCopy() as! NSMutableSet
        mutable.unionSet(objects as Set<NSObject>)
        self.peliculas = mutable.copy() as! NSSet
    }

    func removePeliculas(objects: NSSet) {
        let mutable = self.peliculas.mutableCopy() as! NSMutableSet
        mutable.minusSet(objects as Set<NSObject>)
        self.peliculas = mutable.copy() as! NSSet
    }

    func addPeliculasObject(value: Pelicula) {
        let mutable = self.peliculas.mutableCopy() as! NSMutableSet
        mutable.addObject(value)
        self.peliculas = mutable.copy() as! NSSet
    }

    func removePeliculasObject(value: Pelicula) {
        let mutable = self.peliculas.mutableCopy() as! NSMutableSet
        mutable.removeObject(value)
        self.peliculas = mutable.copy() as! NSSet
    }

}

