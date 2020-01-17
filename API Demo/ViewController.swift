//
//  ViewController.swift
//  API Demo
//
//  Created by MacStudent on 2020-01-17.
//  Copyright © 2020 MacStudent. All rights reserved.
//


import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var weatherLbl: UILabel!
    @IBOutlet weak var txtCity: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    @IBAction func selecCity(_ sender: Any) {
           
                let url = URL(string: "https://api.openweathermap.org/data/2.5/weather?q=\(txtCity.text!)&appid=67fe70c6947b77644c5ad027c2fdd3ed")!
                
                let task  = URLSession.shared.dataTask(with: url) {(data, response , error) in
                    if let error  = error {
                        print(error)
                    }else {
                        if let urlContent = data{
                            do {
                                let jsonResult = try JSONSerialization.jsonObject(with: urlContent, options: JSONSerialization.ReadingOptions.mutableContainers) as! NSDictionary
                                print(jsonResult)
        //                        print(jsonResult["name"] as! String)
                                
                                if let description = ((jsonResult["weather"] as? NSArray)?[0] as? NSDictionary)?["description"] as? String{
                                    print(description)
                                    DispatchQueue.main.async {
                                        self.weatherLbl.text=description as!String
                                    }
                                }
                                
                                

                            }catch {
                                print(error)
                            }
                        }
                    }
                }
                //start the task
                task.resume()
            }
    }
    


