//
//  Currency.swift
//  Currency Space
//


import Foundation

//MARK: - Seting values from CurrencyData Model
struct Currency{
    

    let currencyRateUsd: Double
    var currencyRateUsdString: String{
        return "\(round(currencyRateUsd * 100)/100)"
    }
    let currencyRateEur: Double
    var currencyRateEurString: String{
        return "\(round(currencyRateEur * 100)/100)"
    }
    
    var usdIndexApi: Int
    var eurIndexApi: Int
    
    init?(CurrencyData: Array<CurrencyData>, usdIndexApi: Int, eurIndexApi: Int){
        self.usdIndexApi = usdIndexApi
        self.eurIndexApi = eurIndexApi
        currencyRateUsd = CurrencyData[usdIndexApi].rate
        currencyRateEur = CurrencyData[eurIndexApi].rate
    }
    
     
}

    
    
    

