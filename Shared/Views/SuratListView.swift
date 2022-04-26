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
    
    var body: some View {
        ZStack {
            List(surats, id: \.nomor) { surat in
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
    }
    
    func getData() {
        isLoading = true
        APIService().getSurat { surats in
            self.surats = surats
            isLoading = false
        }
    }
}

struct SuratListView_Previews: PreviewProvider {
    static var previews: some View {
        SuratListView(surats: SuratModel.dummy())
    }
}
