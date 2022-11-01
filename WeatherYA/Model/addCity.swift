//
//  addCity.swift
//  WeatherYA
//
//  Created by Ildar Garifullin on 01/11/2022.
//

import UIKit

extension UIViewController {
    
    func alertPlusCity(name: String, placeholder: String, completionHandler: @escaping (String) -> Void) {
        
        let alertController = UIAlertController(title: name, message: nil, preferredStyle: .alert)
        let alertOK = UIAlertAction(title: "Ok", style: .default) { (action) in
            
            let tftext = alertController.textFields?.first
            
            guard let text = tftext?.text else {
                return
            }
            completionHandler(text)
        }
        
        alertController.addTextField { (tf) in
            tf.placeholder = placeholder
        }
        
        let alertCancel = UIAlertAction(title: "Cancel", style: .default) { (_) in}
        
        alertController.addAction(alertOK)
        alertController.addAction(alertCancel)
        
        present(alertController, animated: true, completion: nil)
    }
}
