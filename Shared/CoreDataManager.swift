//
//  CoreDataManager.swift
//  QuranMulti
//
//  Created by Muhammad Irfan on 30/04/22.
//

import Foundation
import CoreData

class CoreDataManager {
    let persistenContainer: NSPersistentContainer
    
    init() {
        persistenContainer = NSPersistentContainer(name: "BookMark")
        persistenContainer.loadPersistentStores { description, error in
            if let error = error {
                fatalError("Core Data store failed: \(error.localizedDescription)")
            }
        }
    }
    
    func bookmarkSave() {
        let bookmark = BookMark(context: persistenContainer.viewContext)
        bookmark.nama_surat_ar = "arabnya"
        bookmark.nama_surat_idn = "Al - Fatihah"
        bookmark.nomor_ayat = 3
        bookmark.nomor_surat = 1
        
        do {
            try persistenContainer.viewContext.save()
        } catch {
            print("Failed save \(error)")
        }
    }
    
    func getAllBookmark() -> [BookMark] {
        let fetchRequest: NSFetchRequest<BookMark> = BookMark.fetchRequest()
        
        do {
            return try persistenContainer.viewContext.fetch(fetchRequest)
        } catch {
            return []
        }
    }
}
