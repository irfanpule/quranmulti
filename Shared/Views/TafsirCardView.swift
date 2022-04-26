//
//  TafsirCardView.swift
//  QuranMulti
//
//  Created by Muhammad Irfan on 26/04/22.
//

import SwiftUI

struct TafsirCardView: View {
    let tafsir: TafsirModel
    var body: some View {
        VStack(alignment: .leading) {
            HStack(alignment: .top) {
                Label("\(tafsir.surah) ", systemImage: "book")
                    .labelStyle(.trailingIcon)
                    .font(.caption)
                Text(tafsir.tafsir)
                    .multilineTextAlignment(.leading)
                    .lineSpacing(4)
            }
            #if os(macOS)
                Divider()
            #endif
        }
        .padding()
    }
}

struct TafsirCardView_Previews: PreviewProvider {
    static var previews: some View {
        TafsirCardView(tafsir: TafsirModel.dummy()[0])
    }
}
