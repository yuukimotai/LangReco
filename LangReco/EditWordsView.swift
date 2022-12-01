//
//  EditWordsView.swift
//  LangReco
//
//  Created by 茂田井雄輝 on 2022/11/28.
//

import SwiftUI

struct EditWordsView: View {
    @Environment(\.managedObjectContext) private var viewContext
    @State private var english: String
    @State private var japanese: String
    private var words: Words
    
    
    init(words: Words) {
        self.words = words
        self.english = words.englishWord ?? ""
        self.japanese = words.japaneseWord ?? ""
    }
    
    var body: some View {
        VStack {
            TextField("英単語の編集", text: $english)
                .font(.body)
            Spacer()
            TextField("意味の編集", text: $japanese)
                .font(.body)
        }
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button(action: {saveWord()}) {
                    Text("更新")
                }
            }
        }
    }
    
    private func saveWord() {
        self.english = english
        self.japanese = japanese
        
        try? viewContext.save()
    }
}

struct EditWordsView_Previews: PreviewProvider {
    static var previews: some View {
        EditWordsView(words: Words())
    }
}
