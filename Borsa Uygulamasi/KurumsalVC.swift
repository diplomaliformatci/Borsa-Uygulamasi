//
//  KurumsalVC.swift
//  Deneme
//
//  Created by Can KINCAL on 16/08/2017.
//  Copyright © 2017 Can KINCAL. All rights reserved.
//

import UIKit

class KurumsalVC: UIViewController , UITableViewDelegate , UITableViewDataSource {
    
    @IBOutlet weak var kurumsalTableView: UITableView!
    var descriptions: Array<String> = ["Baskanin Mesaji" , "Kurulus ve Tarihce" , "Kanunlar ve Yonetmelikler" , "Hizmet Standartlari" , "Bilgi Edinme " , "Ister ve Oneriler"]
    var textToSend: String!
    var details: String!
    override func viewDidLoad() {
        super.viewDidLoad()
        kurumsalTableView.delegate = self
        kurumsalTableView.dataSource = self
        
        // Do any additional setup after loading the view.
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return descriptions.count;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "KurumsalCell", for: indexPath) as? KurumsalCell  else {
            fatalError("The dequeued cell is not an instance of MealTableViewCell.")
        }
        
        // Fetches the appropriate meal for the data source layout.
        let description = self.descriptions[indexPath.row]
        cell.configureCell(description: description)
        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1;
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        self.details = descriptions[indexPath.row]
        let message = KurumsalDetailModel()
        message.text = details
        
        performSegue(withIdentifier: "KurumsalDetails", sender: message)
   
    }
//    
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if (segue.identifier == "KurumsalDetails") {
//            let vc = segue.destination as! KurumsalDetailVC
//            vc.detailTextField.text = details
//        }
//    }

}
