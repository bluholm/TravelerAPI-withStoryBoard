//
//  TranslateViewController.swift
//  TravelerAPI-StoyBoard
//
//  Created by Marc-Antoine BAR on 2022-11-12.
//

import UIKit

class TranslateViewController : UIViewController {
    
    //MARK: Properties
    @IBOutlet var labelTextField: UITextView!
    @IBOutlet var buttonTranslate: UIButton!
    @IBOutlet var labelTextTranslated: UITextView!
    
    let model = TranslateLogic()
    
    //MARK: Life Cycle Method
    override func viewDidLoad() {
        super.viewDidLoad()
        loadMyView()
    }
    
    //MARK: User Actions
    @IBAction func didButtonTranslateTapped(_ sender: Any) {
        guard let text = labelTextField.text else { return }
        translateText(text: text)
    }
    
    //MARK: Privates
    func translateText(text: String) {
        model.getTextTranslated(text: text) { sucess, value in
            guard let value = value else { return }
            let traduc = value.translations[0].text
                self.labelTextTranslated.text = String(traduc)
        }
    }
}
