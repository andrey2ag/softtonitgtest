// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to Calificacion.swift instead.

import Foundation
import CoreData

public enum CalificacionAttributes: String {
    case enable = "enable"
    case fecha = "fecha"
    case valor = "valor"
}

public enum CalificacionRelationships: String {
    case pelicula = "pelicula"
}

public class _Calificacion: NSManagedObject {

    // MARK: - Class methods

    public class func entityName () -> String {
        return "Calificacion"
    }

    public class func entity(managedObjectContext: NSManagedObjectContext) -> NSEntityDescription? {
        return NSEntityDescription.entityForName(self.entityName(), inManagedObjectContext: managedObjectContext)
    }

    // MARK: - Life cycle methods

    public override init(entity: NSEntityDescription, insertIntoManagedObjectContext context: NSManagedObjectContext?) {
        super.init(entity: entity, insertIntoManagedObjectContext: context)
    }

    public convenience init?(managedObjectContext: NSManagedObjectContext) {
        guard let entity = _Calificacion.entity(managedObjectContext) else { return nil }
        self.init(entity: entity, insertIntoManagedObjectContext: managedObjectContext)
    }

    // MARK: - Properties

    @NSManaged public
    var enable: NSNumber?

    @NSManaged public
    var fecha: NSDate?

    @NSManaged public
    var valor: NSNumber?

    // MARK: - Relationships

    @NSManaged public
    var pelicula: Pelicula?

}

