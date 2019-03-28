//
//  ViewController.swift
//  jsontext
//
//  Created by Артем Жорницкий on 28/03/2019.
//  Copyright © 2019 Артем Жорницкий. All rights reserved.
//

import UIKit

class Offer: Decodable {
    
    var name: String?
    var id: String?
    var description: String?
    var groupName: String?
    var productType: String?
    var imageURL: String?
    var price: Int?
    var discount: Float?
    
    
    init(name: String?, id: String?, description: String?, groupName: String?, productType: String?, imageURL: String?, price: Int?, discount: Float?) {
        self.name = name
        self.id = id
        self.description = description
        self.groupName = groupName
        self.productType = productType
        self.imageURL = imageURL
        self.price = price
        self.discount = discount
    }
}

class ViewController: UIViewController {
    var offers = [Offer]()
    override func viewDidLoad() {
        super.viewDidLoad()
        getData()
        


}
    func getData(){
        let offerJsonUrl = "file:///Users/Artem/Downloads/%D0%A2%D0%B5%D1%81%D1%82%D0%BE%D0%B2%D0%BE%D0%B5%20%D0%B7%D0%B0%D0%B4%D0%B0%D0%BD%D0%B8%D0%B5%20iOS%203/offers.json"
    
        guard let jsonUrl = URL(string: offerJsonUrl) else { return }
        let task = URLSession.shared.dataTask(with: jsonUrl) { (data, response, error) in
            do {
                if error == nil {
                    self.offers = try JSONDecoder().decode([Offer].self, from: data!)
                    for offer in self.offers {
                        print (offer.name!)
                    }
                }
            }
            catch {
                print("error")
            }
            
//            if let error = error {
//                print("Failed", error)
//                return
//            }
//            guard let d    ata = data else { return }
//            do {
//                let decoder = JSONDecoder()
            
//                self.offers = try decoder.decode([Offer].self, from: data)
//                print("do STUFF")
//            }
//            catch let jsonErr {
//                print("Error",jsonErr)
//            }
            }.resume()
        print(offers)
        print("Do SSSS")
        print("fuck")
    }
}
