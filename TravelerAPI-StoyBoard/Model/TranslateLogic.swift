//
//  Translate.swift
//  TravelerAPI-StoyBoard
//
//  Created by Marc-Antoine BAR on 2022-11-12.
//

import Foundation


final class TranslateLogic {
    
    private let apiKey = "24e4c008-11b5-3633-cfcf-25adfbedf2cf:fx"
    private let baseUrl = "https://api-free.deepl.com/v2/translate"
    
    func getTextTranslated(text: String, completionHandler: @escaping (Bool, Translate?) -> Void){
        
        var parameters: [(String,String)] {
            return [
                ("auth_key", apiKey),
                ("target_lang","EN"),
                ("text",text)]
        }
        
        guard let translateUrl: URL  = .init (string: baseUrl) else {return}
        let url: URL = URLEncodable.encode(with: translateUrl, and: parameters)
        
        let request = URLRequest(url: url)
        
        let session = URLSession(configuration: .default)
        let task = session.dataTask(with: request) { data, response, error in
            DispatchQueue.main.async {
                guard let data = data, error == nil else {
                    completionHandler(false, nil)
                    return
                }
                guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                    completionHandler(false, nil)
                    return
                }
                guard let responseJSON = try? JSONDecoder().decode(Translate.self, from: data) else {
                    completionHandler(false, nil)
                    return
                }
                completionHandler(true,responseJSON)
            }
        }
        task.resume()
    }
}

