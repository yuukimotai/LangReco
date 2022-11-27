//
//  ContentView.swift
//  LangReco
//
//  Created by 茂田井雄輝 on 2022/11/26.
//

import SwiftUI
import CoreData

struct ContentView: View {
    @Environment(\.managedObjectContext) private var viewContext

    @FetchRequest(
        entity: Words.entity(),
        sortDescriptors: [NSSortDescriptor(keyPath: \Words.word, ascending: true)],
        animation: .default) var fetchedWordsList: FetchedResults<Words>

    var body: some View {
        NavigationView {
            List {
                ForEach(fetchedWordsList) { item in
                    VStack {
                        Text(item.word ?? "")
                            .frame(width: .infinity,alignment: .leading)
                    }
                }
            }
            .navigationTitle("Words")
            .navigationBarTitleDisplayMode(.automatic)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    NavigationLink(destination: AddWordsView()) {
                        Text("単語の新規追加")
                    }
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
