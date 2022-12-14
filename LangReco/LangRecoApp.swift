//
//  LangRecoApp.swift
//  LangReco
//
//  Created by 茂田井雄輝 on 2022/11/26.
//

import SwiftUI

@main
struct LangRecoApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
