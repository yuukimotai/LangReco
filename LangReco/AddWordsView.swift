//
//  AddWordsView.swift
//  LangReco
//
//  Created by 茂田井雄輝 on 2022/11/27.
//

import SwiftUI

struct AddWordsView: View {
    @Environment(\.managedObjectContext) private var ViewContext
    @Environment(\.presentationMode) var presentation
    @State private var word: String = ""
    
    var body: some View {
        VStack {
            TextField("英単語の追加", text: $word)
                .font(.body)
            Spacer()
        }
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button(action: {addWord()}) {
                    Text("保存")
                }
            }
        }
    }
    
    private func addWord() {
        let item = Words(context: ViewContext)
        item.word = word
        
        try? ViewContext.save()
        
        presentation.wrappedValue.dismiss()
    }
}

struct AddWordsView_Previews: PreviewProvider {
    static var previews: some View {
        AddWordsView()
    }
}
