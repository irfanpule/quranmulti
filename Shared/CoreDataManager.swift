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
        persistenContainer = NSPersistentContainer(name: "CoreModelData")
        persistenContainer.loadPersistentStores { description, error in
            if let error = error {
                fatalError("Core Data store failed: \(error.localizedDescription)")
            }
        }
    }
    
    func bookmarkSave(surat: SuratModel, ayat: AyatModel) {
        let bookmark = BookMark(context: persistenContainer.viewContext)
        bookmark.nama_surat_ar = surat.nama
        bookmark.nama_surat_idn = surat.nama_latin
        bookmark.nomor_ayat = Int64(ayat.nomor)
        bookmark.nomor_surat = Int64(surat.nomor)
        
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
