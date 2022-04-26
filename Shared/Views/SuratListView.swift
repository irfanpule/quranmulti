//
//  SuratListView.swift
//  QuranMulti-iOS
//
//  Created by Muhammad Irfan on 12/02/22.
//

import SwiftUI

struct SuratListView: View {
    @State var surats: [SuratModel] = []
    @State private var isLoading = false
    @State var searchQuery = ""
    
    var body: some View {
        ZStack {
            List(searchResults, id: \.nomor) { surat in
                NavigationLink(
                    destination: SuratDetailView(surat: surat),
                    label: {
                        SuratCardView(surat: surat)
                    })
            }
            .navigationTitle("Quran")
            .frame(minWidth: 280)
            .onAppear {
                getData()
            }
            
            if isLoading {
                LoadingView()
            }
            
        }
        .searchable(text: $searchQuery, prompt: "Cari dengan nama surat")
    }
    
    func getData() {
        isLoading = true
        APIService().getSurat { surats in
            self.surats = surats
            isLoading = false
        }
    }
    
    var searchResults: [SuratModel] {
            if searchQuery.isEmpty {
                return self.surats
            } else {
                return self.surats.filter { $0.nama_latin.contains(searchQuery) }
            }
        }
}

struct SuratListView_Previews: PreviewProvider {
    static var previews: some View {
        SuratListView(surats: SuratModel.dummy())
            .previewDevice("iPhone Xs")
    }
}
