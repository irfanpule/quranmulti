//
//  AyatCardView.swift
//  QuranMulti
//
//  Created by Muhammad Irfan on 16/04/22.
//

import SwiftUI

struct AyatCardView: View {
    let ayat: AyatModel
    var body: some View {
        VStack(alignment: .trailing) {
            HStack(alignment: .top) {
                Label("\(ayat.nomor) ", systemImage: "book")
                    .labelStyle(.trailingIcon)
                    .font(.caption)
                Text(ayat.ar)
                    .multilineTextAlignment(.trailing)
                    .lineSpacing(4)
                    #if os(macOS)
                    .font(.system(size: 24))
                    #else
                    .font(.body)
                    #endif
            }
            Spacer(minLength: 15)
            HStack {
                Text(ayat.idn)
                Spacer()
            }
            .font(.caption)
            #if os(macOS)
                Divider()
            #endif
        }
        .padding()
    }
}

struct AyatCardView_Previews: PreviewProvider {
    static var previews: some View {
        AyatCardView(ayat: AyatModel.dummy()[0])
            .previewLayout(.fixed(width: 400, height: 200))
    }
}
