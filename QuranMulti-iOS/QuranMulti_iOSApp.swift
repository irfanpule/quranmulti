//
//  QuranMulti_iOSApp.swift
//  QuranMulti-iOS
//
//  Created by Muhammad Irfan on 12/02/22.
//

import SwiftUI

@main
struct QuranMulti_iOSApp: App {
    let coreDM = CoreDataManager()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, coreDM.persistenContainer.viewContext)
        }
    }
}
