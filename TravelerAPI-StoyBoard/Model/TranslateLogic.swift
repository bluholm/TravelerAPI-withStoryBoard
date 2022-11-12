//
//  Translate.swift
//  TravelerAPI-StoyBoard
//
//  Created by Marc-Antoine BAR on 2022-11-12.
//

import Foundation


final class TranslateLogic {
    
    private let url = "https://api-free.deepl.com/v2/translate?auth_key=24e4c008-11b5-3633-cfcf-25adfbedf2cf:fx&text=Hello%20World&target_lang=FR"
    
    
    func getTextTranslated(completionHandler: @escaping (Bool, Translate?) -> Void){
        print("aa")
        guard let deeplUrl = URL(string: url) else {
            print("sfd")
            return
        }
        print("bb")
        let request = URLRequest(url: deeplUrl)
        
        let session = URLSession(configuration: .default)
        let task = session.dataTask(with: request) { data, response, error in
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
        
        task.resume()
        
    }
    
    
}

extension URL {
    init?(_ string: String) {
        guard string.isEmpty == false else {
            return nil
        }
        if let url = URL(string: string) {
            self = url
        } else if let urlEscapedString = string.addingPercentEncoding(withAllowedCharacters: CharacterSet.urlQueryAllowed),
                  let escapedURL = URL(string: urlEscapedString) {
            self = escapedURL
        } else {
            return nil
        }
    }
}

