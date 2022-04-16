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
            }
            Spacer(minLength: 20)
            HStack {
                Text(ayat.idn)
                Spacer()
            }
            .font(.caption)
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
