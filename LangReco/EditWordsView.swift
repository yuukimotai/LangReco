//
//  EditWordsView.swift
//  LangReco
//
//  Created by 茂田井雄輝 on 2022/11/28.
//

import SwiftUI

struct EditWordsView: View {
    @Environment(\.managedObjectContext) private var viewContext
    @State private var word: String
    
    init(word: String) {
        self.word = word
    }
    
    var body: some View {
        VStack {
            TextField("英単語の編集", text: $word)
                .font(.body)
            
            Spacer()
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
        self.word = word
        
        try? viewContext.save()
    }
}

struct EditWordsView_Previews: PreviewProvider {
    static var previews: some View {
        EditWordsView(word: String())
    }
}
