//
//  NetworkManager.swift
//  Currency Space
//

import Foundation

protocol NetworkManagerURLDelegate{
    func updateUI(_: NetworkManagerURL, with currency: Currency)
}

struct NetworkManagerURL{
    
   
//MARK: - Get data from NBU API https://bank.gov.ua/ua/open-data/api-dev
  
    var delegate: NetworkManagerURLDelegate?
    
    func networkFetchBankUrl(pickedDate: String){
        let bankUrl = "https://bank.gov.ua/NBUStatService/v1/statdirectory/exchange?date=\(pickedDate)&json"
        guard let url = URL(string: bankUrl) else { return }
        let session = URLSession(configuration: .default)
        let task = session.dataTask(with: url) { data, response, error in
            if let data = data {
        
                if let currency = self.parseJson(withData: data){
                    self.delegate?.updateUI(self, with: currency)
                //print(currency.currencyRateUsdString)
                    
                }
            }
        }
        task.resume()
        
    }
    
   
//MARK: - Parsing JSON
    func parseJson(withData data: Data) -> Currency?{
        // Starting values of CurrencyData Array
        var usd: Int = 0
        var eur: Int = 0
    do{
     let parsedJsonValues = try JSONDecoder().decode([CurrencyData].self, from: data )
        
        
//MARK: - Checking actual data from NBU API
        var indexApi = Currency(CurrencyData: parsedJsonValues, usdIndexApi: 0, eurIndexApi: 0)
         for (index, item) in parsedJsonValues.enumerated(){
             if item.cc == "USD"{
                usd = index
             }else if item.cc == "EUR"{
                 indexApi?.eurIndexApi = index
                 eur = index
             }
         }
        
        guard let currency = Currency(CurrencyData: parsedJsonValues, usdIndexApi: usd, eurIndexApi: eur) else{
            return nil
        }
        return currency
   
    }catch{
        print(error)
    }
        return nil
    }
    
}
