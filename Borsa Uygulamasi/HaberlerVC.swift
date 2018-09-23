//
//  HaberlerVC.swift
//  Deneme
//
//  Created by Can KINCAL on 18/08/2017.
//  Copyright © 2017 Can KINCAL. All rights reserved.
//

import UIKit

class HaberlerVC: UIViewController , UITableViewDelegate , UITableViewDataSource {
    
    @IBOutlet weak var haberlerTableView: UITableView!
    var haberArray : Array<Haber> = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        haberlerTableView.delegate = self
        haberlerTableView.dataSource = self
        
        // Do any additional setup after loading the view.
    }
    
    
    func downloadUrlText() -> String {
     return ""
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = haberlerTableView.dequeueReusableCell(withIdentifier: "HaberCell" , for: indexPath) as? HaberCell else {
            fatalError("The dequeued cell is not an instance of haber cell")
        }
        
        let text = "İşte dünyanın dört bir yanından en güzel ünlü adayları TC Candler her sene binlerce kişi arasından dünyanın en güzel yüze sahip insanlarını seçiyor. Dünyanın en güzel ünlülerinin olduğu liste aslında aralık ayında görücüye çıkıyor ancak adaylar şimdiden belli oldu bile! İşte dünyanın dört bir yanından en güzel ünlü adayları "
        let image = UIImage(named: "top-view-baby-cat-white-background-25400601")
        cell.configurecell(text: text, image: image!)
    
        return cell
    }
    
    
    
    
//    guard let cell = tableView.dequeueReusableCell(withIdentifier: "KurumsalCell", for: indexPath) as? KurumsalCell  else {
//    fatalError("The dequeued cell is not an instance of MealTableViewCell.")
//    }
//    
//    // Fetches the appropriate meal for the data source layout.
//    let description = self.descriptions[indexPath.row]
//    cell.configureCell(description: description)
//    return cell
//}








    
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 5;
    }
    
    
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
