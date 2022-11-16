//
//  CurrencyViewController.swift
//  TravelerAPI-StoyBoard
//
//  Created by Marc-Antoine BAR on 2022-11-12.
//

import UIKit

class CurrencyViewController : UIViewController, SymbolDelegate {
   
    //MARK: Properties
    @IBOutlet var finalSymbolLabel: UILabel!
    @IBOutlet var currencyTextField: UITextField!
    @IBOutlet var oneDollarLabel: UILabel!
    private var symbols = SymbolsViewController()
    @IBOutlet var resultTextField: UIView!
    let model = CurrencyLogic()
    
    //MARK: override
    override func viewDidLoad() {
        super.viewDidLoad()
        symbols.delegate = self
        model.getSymbols { result in
            switch result {
            case .success(let currencyREsult):
                print("sucess \(currencyREsult)")
            case .failure(.BadUrl):
                print("badURL")
            case .failure(.decoderJSON):
                print("decoder JSon not working")
            case .failure(.StatusCode200):
                print("statuscode200")
            case .failure(.ErrorNil):
                print("errorNil")
            }
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        (segue.destination as! SymbolsViewController).delegate = self
    }
    
    //MARK: Actions
    @IBAction func didTappedConvertButton(_ sender: Any) {
    }
    
    //MARK: SymbolModelDelegate
    func didSelectSymbol(symbol: String) {
        finalSymbolLabel.text = symbol
    }
}
