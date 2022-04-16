//
//  CardView.swift
//  QuranMulti-iOS
//
//  Created by Muhammad Irfan on 16/04/22.
//

import SwiftUI

struct SuratCardView: View {
    let surat: SuratModel
    var body: some View {
        VStack(alignment: .leading) {
            Text("\(surat.nomor). \(surat.nama_latin)")
                .font(.headline)
                .accessibilityAddTraits(.isHeader)
            Spacer()
            HStack {
                Label("\(surat.jumlah_ayat)", systemImage: "book")
                Spacer()
                Text(surat.nama)
            }
            .font(.caption)
            #if os(macOS)
                Divider()
            #endif
        }
        .padding()
    }
}

struct SuratCardView_Previews: PreviewProvider {
    static var previews: some View {
        SuratCardView(surat: SuratModel.dummy()[0])
            .previewLayout(.fixed(width: 400, height: 60))
    }
}
