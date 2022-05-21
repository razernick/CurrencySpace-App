

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var currentDateLabel: UILabel!
    @IBOutlet weak var currencyDatePicker: UIDatePicker!
    @IBOutlet weak var dateButton: UIButton!
    
    
    @IBOutlet weak var usdValueLabel: UILabel!
    @IBOutlet weak var eurValueLabel: UILabel!
    
    
    // Instance of network structure
    var nbuRate = NetworkManagerURL()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Set the current date to currentDateLabel
        currentDateLabel.text = self.currentDateValueLabel
        
        // Disable the future dates in UIDatePicker
        currencyDatePicker.maximumDate = Date()
        
        nbuRate.delegate = self
        nbuRate.networkFetchBankUrl(pickedDate: self.currentDateValueUrl)
        
        
    }
    //MARK: -  Show/Hidden DatePicker
    @IBAction func presentDatePickerButton(_ sender: Any) {
        
        if currencyDatePicker.isHidden{
            currencyDatePicker.isHidden = false
            dateButton.setTitle("Hide calendar", for: .normal)
        }else{
            currencyDatePicker.isHidden = true
            dateButton.setTitle("Choose date", for: .normal)
        }
        
    }
    //MARK: - DatePicker functionality
    @IBAction func datePicker(_ sender: UIDatePicker) {
        
        let formatDateApiUrl = DateFormatter()
        formatDateApiUrl.dateFormat = "yyyyMMdd"
        nbuRate.delegate = self
        nbuRate.networkFetchBankUrl(pickedDate: formatDateApiUrl.string(from: sender.date))
        
        
        let formatDatePeckedLabel = DateFormatter()
        formatDatePeckedLabel.dateFormat = "dd MM yyyy"
        currentDateLabel.text = formatDatePeckedLabel.string(from: sender.date)
        
    }
    
    
}

    //MARK: - Displaying data in the interface from delegate in main thread
extension ViewController: NetworkManagerURLDelegate{
    func updateUI(_: NetworkManagerURL, with currency: Currency) {
        
        DispatchQueue.main.async {
            self.usdValueLabel.text = currency.currencyRateUsdString
            self.eurValueLabel.text = currency.currencyRateEurString
        }
        
    }
    
    
}

