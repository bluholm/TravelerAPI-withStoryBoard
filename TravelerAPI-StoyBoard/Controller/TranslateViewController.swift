//
//  TranslateViewController.swift
//  TravelerAPI-StoyBoard
//
//  Created by Marc-Antoine BAR on 2022-11-12.
//

import UIKit

final class TranslateViewController : UIViewController {
    
    //MARK: Properties
    @IBOutlet var labelTextField: UITextView!
    @IBOutlet var buttonTranslate: UIButton!
    
    @IBOutlet var labelTextTranslated: UILabel!
    private let modelTranslateLogic = TranslateLogic()
    
    //MARK: Life Cycle Method
    override func viewDidLoad() {
        super.viewDidLoad()
        //code
        
    }
    
    //MARK: Privates
    @IBAction func didButtonTranslateTapped(_ sender: Any) {
        self.modelTranslateLogic.getTextTranslated { sucess, value in
            guard let value = value else { return }
            let traduc = value.translations[0].text
            print(traduc)
            DispatchQueue.main.async {
                self.labelTextTranslated.text = String(traduc)
            }
            
            
        }
    }
    
    
        
}
