//
//  CurrencyData.swift
//  Currency Space
//

//MARK: -  JSON Structure of National Bank of Ukraine

import Foundation

struct CurrencyData: Decodable{
    
    let r030: Int
    let txt: String
    let rate: Double
    let cc: String
    let exchangedate: String
    
}



/*
 "r030": 36,
 "txt": "Австралійський долар",
 "rate": 20.5208,
 "cc": "AUD",
 "exchangedate": "12.05.2022"
 */
