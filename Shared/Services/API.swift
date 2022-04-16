//
//  API.swift
//  QuranMulti-iOS
//
//  Created by Muhammad Irfan on 16/04/22.
//

import Foundation

class APIService {
    func getSurat(completion: @escaping ([SuratModel]) -> ()) {
        guard let url = URL(string: "https://equran.id/api/surat") else {return}
        
        URLSession.shared.dataTask(with: url) { (data, response , error) in
            do {
                let surats = try JSONDecoder().decode([SuratModel].self, from: data!)
                print(surats)
                DispatchQueue.main.async {
                    completion(surats)
                }
            }
            catch {
                print("JSONSerialization error:", error)
            }
        }
        .resume()
    }
    
    func getAyat(nomor_surat: Int, completion: @escaping (SuratDetailModel) -> ()) {
        guard let url = URL(string: "https://equran.id/api/surat/\(nomor_surat)") else {return}
        
        URLSession.shared.dataTask(with: url) { (data, response , error) in
            do {
                let suratDetail = try JSONDecoder().decode(SuratDetailModel.self, from: data!)
                print(suratDetail)
                DispatchQueue.main.async {
                    completion(suratDetail)
                }
            }
            catch {
                print("JSONSerialization error:", error)
            }
        }
        .resume()
    }
}
