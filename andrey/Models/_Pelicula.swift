// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to Pelicula.swift instead.

import Foundation
import CoreData

public enum PeliculaAttributes: String {
    case fecha = "fecha"
    case titulo = "titulo"
}

public enum PeliculaRelationships: String {
    case calificaciones = "calificaciones"
    case categoria = "categoria"
}

public class _Pelicula: NSManagedObject {

    // MARK: - Class methods

    public class func entityName () -> String {
        return "Pelicula"
    }

    public class func entity(managedObjectContext: NSManagedObjectContext) -> NSEntityDescription? {
        return NSEntityDescription.entityForName(self.entityName(), inManagedObjectContext: managedObjectContext)
    }

    // MARK: - Life cycle methods

    public override init(entity: NSEntityDescription, insertIntoManagedObjectContext context: NSManagedObjectContext?) {
        super.init(entity: entity, insertIntoManagedObjectContext: context)
    }

    public convenience init?(managedObjectContext: NSManagedObjectContext) {
        guard let entity = _Pelicula.entity(managedObjectContext) else { return nil }
        self.init(entity: entity, insertIntoManagedObjectContext: managedObjectContext)
    }

    // MARK: - Properties

    @NSManaged public
    var fecha: NSDate?

    @NSManaged public
    var titulo: String?

    // MARK: - Relationships

    @NSManaged public
    var calificaciones: NSSet

    @NSManaged public
    var categoria: Categoria?

}

extension _Pelicula {

    func addCalificaciones(objects: NSSet) {
        let mutable = self.calificaciones.mutableCopy() as! NSMutableSet
        mutable.unionSet(objects as Set<NSObject>)
        self.calificaciones = mutable.copy() as! NSSet
    }

    func removeCalificaciones(objects: NSSet) {
        let mutable = self.calificaciones.mutableCopy() as! NSMutableSet
        mutable.minusSet(objects as Set<NSObject>)
        self.calificaciones = mutable.copy() as! NSSet
    }

    func addCalificacionesObject(value: Calificacion) {
        let mutable = self.calificaciones.mutableCopy() as! NSMutableSet
        mutable.addObject(value)
        self.calificaciones = mutable.copy() as! NSSet
    }

    func removeCalificacionesObject(value: Calificacion) {
        let mutable = self.calificaciones.mutableCopy() as! NSMutableSet
        mutable.removeObject(value)
        self.calificaciones = mutable.copy() as! NSSet
    }

}

