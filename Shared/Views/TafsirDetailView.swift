//
//  TafsirDetailView.swift
//  QuranMulti
//
//  Created by Muhammad Irfan on 26/04/22.
//

import SwiftUI


struct TafsirDetailView: View {
    @Environment(\.presentationMode) var presentationMode
    @State var surat: SuratModel
    @State var tafsirs: [TafsirModel] = [TafsirModel]()
    @State private var isLoading = false
    
    var body: some View {
        ZStack {
            VStack {
                HStack {
                    Button(action: {
                        presentationMode.wrappedValue.dismiss()
                    }) {
                        Image(systemName: "xmark.circle")
                    }
                    Text(surat.nama_latin)
                    Text(surat.nama)
                }
                .padding()
                
                List(tafsirs, id: \.id) { tafsir in
                    TafsirCardView(tafsir: tafsir)
                }
                .onAppear {
                    getData()
                }
            }
            
            if isLoading {
                LoadingView()
            }
        }
        #if os(macOS)
            .frame(minWidth: 600, minHeight: 700)
        #endif
    }
    
    func getData() {
        isLoading = true
        APIService().getTafsir(nomor_surat: surat.nomor) { tafsir in
            self.tafsirs = tafsir.tafsir
            isLoading = false
        }
    }
}

struct TafsirDetailView_Previews: PreviewProvider {
    static var previews: some View {
        TafsirDetailView(surat: SuratModel.dummy()[0])
    }
}
