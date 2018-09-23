//
//  BultenlerController.swift
//  Deneme 1
//
//  Created by Can KINCAL on 14/08/2017.
//  Copyright © 2017 Can KINCAL. All rights reserved.
//

import UIKit
import Alamofire
class BultenlerVC: UIViewController , UITableViewDelegate , UITableViewDataSource{
    
    
    @IBOutlet weak var LoadingView: UIActivityIndicatorView!
    @IBOutlet weak var segmentedControllRef: UISegmentedControl!
    var bultens = Array<Bulten>() // sorting problems no more
    @IBOutlet weak var tableView: UITableView!
    static var cellCache: NSCache<NSString ,UITableViewCell > = NSCache()
    var sections: Array<String> = Array<String>()
    var sectionDictionary: Dictionary<String , Int> = [:]
    var sectionNames: Array<String> = []
    var sectionNumbers: Array<Int> = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        //  self.downloadJsonWithURL(urlString: BULTENURL + "BultenAnlik.ashx")
        
        userInteractionDisabled()
        downloadData(url: "BultenAnlik.ashx")
        userInteractionEnable()
        tableView.reloadData()
        
 
    }
    
    

    
    func downloadData(url : String) {
        DataService.getBultenDataWithSuccess(url: BULTENURL + url) { (data) -> Void in
            print("JSooon")
            guard let json = try? JSONSerialization.jsonObject(with: data, options: []) as? [String : Any] else {
                print("Error")
                return
            }
            var temp = "Bulten"
            if url == "BultenAnlik.ashx" {
                temp = "AnlikBulten"
            }
            if let results = json?[temp] as? [[String : Any]] {
                for result in results{
                    if let bulten = try? Bulten(dict: result) {
                        print(bulten._altGrup)
                        self.bultens.append(bulten)
                    }
                    
                }
                
            }
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
            
        }
    }
    
    
    func userInteractionDisabled() {
        LoadingView.isHidden = false
        segmentedControllRef.isHidden = true
        LoadingView.frame.size = CGSize(width: view.frame.width / 4, height: view.frame.height / 4)
        LoadingView.startAnimating()
        tableView.isUserInteractionEnabled = false
    }
    
    func userInteractionEnable() {
        LoadingView.isHidden = true
        LoadingView.stopAnimating()
        tableView.isUserInteractionEnabled = true
        segmentedControllRef.isHidden = false
    }
    
    
    
    
    
    
    override func viewDidAppear(_ animated: Bool) {
        userInteractionDisabled()
        tableView.reloadData()
        userInteractionEnable()
        //        downloadBultenData(bultenUrl: BULTENURL + "BultenAylik.ashx") {
        //            print("Data Downloading ")
        //            self.tableView.reloadData()
        //        }
        //
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //
    //
    //    let queue = DispatchQueue(label: "com.cnoon.response-queue", qos: .utility, attributes: [.concurrent])
    //
    //    Alamofire.request(bultenDataUrl, parameters: ["foo": "bar"])
    //    .response(
    //    queue: queue,
    //    responseSerializer: DataRequest.jsonResponseSerializer(),
    //    completionHandler: { response in
    //    // You are now running on the concurrent `queue` you created earlier.
    //    print("Parsing JSON on thread: \(Thread.current) is main thread: \(Thread.isMainThread)")
    //
    //    // Validate your JSON response and convert into model objects if necessary
    //    print(response.result.value)
    //
    //    // To update anything on the main thread, just jump back on like so.
    //    DispatchQueue.main.async {
    //    print("Am I back on the main thread: \(Thread.isMainThread)")
    //    }
    //    }
    //    )
    
    func sectioncounts(dict: Dictionary<String,Array<Dictionary<String,String>>>) -> Dictionary<String , Int> {
        var sectionsValue: Dictionary<String,Int> = [:]
        var keyy = "Bulten"
        if segmentedControllRef.selectedSegmentIndex == 0 {
            keyy = "AnlikBulten"
        }
        
        if let dictt = dict[keyy] {
            for dict in dictt {
                if let section = dict["ANAGRUP"] {
                    if sectionsValue.keys.contains(section) {
                        sectionsValue[section] = sectionsValue[section]! + 1
                        
                    } else if !sectionsValue.keys.contains(section) {
                        sectionsValue[section] = 1
                    } //////////////
                }/////////////not working
            }//////////
        }///////
        
        for (key , value) in sectionsValue {
            if !sectionNames.contains(key) {
                self.sectionNames.append(key)
                self.sectionNumbers.append(value)
            }
            
        }
        
        
        print("PRINTING SECTION VALUES ++ \(sectionNames) ++ \(sectionNames) ")
        print(sectionsValue.keys)
        
        
        
        return sectionsValue
    } // calculate section list for numberofrowsinsection
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    //    func downloadJsonWithURL(urlString: String) {
    //        bultens = []
    //        let url = NSURL(string: urlString)
    //        URLSession.shared.dataTask(with: (url as URL?)!, completionHandler: {(data, response, error) -> Void in
    //           // self.userInteractionDisabled()
    //            if let jsonObj = try? JSONSerialization.jsonObject(with: data!, options: .allowFragments) as? NSDictionary {
    //
    //                if let  temp = jsonObj as? Dictionary<String,Array<Dictionary<String,String>>> {
    //                    self.sectionDictionary = [:]
    //                    self.sectionDictionary = self.sectioncounts(dict: temp)
    //
    //                    //     print("\(result.value)")
    //                    //            print("\(temp)")
    //                    //  print("\(temp["Bulten"])")
    //                    //               var i: Int = 0;
    //                    var section: String = ""
    //                    var key = "Bulten"
    //                    if urlString == BULTENURL + "BultenAnlik.ashx" {
    //                        key = "AnlikBulten"
    //                    }
    //
    //                    if let dictt = temp[key] {
    //                        for dict in dictt {
    //                            var bultenTemp = Bulten()
    //                            print("FOR LOOOP")
    //                            if let anaGrup = dict["ANAGRUP"] as? String {
    //                                bultenTemp._anaGrup = anaGrup
    //                                if key == "AnlikBulten" {
    //                                    print("BULTEN ITEM \(anaGrup)")
    //                                }
    //                            }
    //                            if let anaGrup_ENG = dict["GRAIN"] as? String {
    //                                bultenTemp._anaGrup_ENG = anaGrup_ENG
    //                                print("\(anaGrup_ENG)")
    //                            }
    //                            if let anaGrup_ISP = dict["ANAGRUP_ISP"] as? String {
    //                                bultenTemp._anaGrup_ISP = anaGrup_ISP
    //                                print("\(anaGrup_ISP)")
    //                            }
    //
    //                            if let altGrup = dict["ALTGRUP"] as? String {
    //                                bultenTemp._altGrup = altGrup
    //                                print("\(altGrup)")
    //                            }
    //
    //                            if let altGrup_ENG = dict["ALTGRUP_ENG"] as? String {
    //                                bultenTemp._altGrup_ENG = altGrup_ENG
    //                                print("\(altGrup_ENG)")
    //                            }
    //
    //                            if let altGrup_ISP = dict["ALTGRUP_ISP"] as? String {
    //                                bultenTemp._altGrup_ISP = altGrup_ISP
    //                                print("\(bultenTemp.altGrup_ISP)")
    //                            }
    //
    //                            if let mal = dict["MAL"] as? String {
    //                                bultenTemp._mal = mal
    //                                print("\(bultenTemp.mal)")
    //                            }
    //
    //                            if let mal_ENG = dict["MAL_ENG"] as? String {
    //                                bultenTemp._mal_ENG = mal_ENG
    //                                print("\(bultenTemp.mal_ENG)")
    //                            }
    //
    //                            if let mal_ISP = dict["MAL_ISP"] as? String {
    //                                bultenTemp._mal_ISP = mal_ISP
    //                                print("\(bultenTemp.mal_ISP)")
    //                            }
    //
    //                            if let malKod = dict["MALKOD"] as? String {
    //                                bultenTemp._malKod = malKod
    //                                print("\(bultenTemp.malKod)")
    //                            }
    //
    //                            if let anaKod = dict["ANAKOD"] as? String {
    //                                bultenTemp._anaKod = anaKod
    //                                print("\(bultenTemp.anaKod)")
    //                            }
    //
    //                            if let altKod = dict["ALTKOD"] as? String {
    //                                bultenTemp._altKod = altKod
    //                                print("\(bultenTemp.altKod)")
    //                            }
    //
    //                            if let esasBirim = dict["ESASBRM"] as? String {
    //                                bultenTemp._esasBirim = esasBirim
    //                                print("\(bultenTemp.esasBirim)")
    //                            }
    //
    //                            if let yardBirim = dict["YARDBRM"] as? String {
    //                                bultenTemp._yardBRM = yardBirim
    //                                print("\(bultenTemp.yardBRM)")
    //                            }
    //
    //                            if let minFiyat = dict["MINFIYAT"] as? String {
    //                                bultenTemp._minFiyat = minFiyat
    //                                print("\(bultenTemp.minFiyat)")
    //                            }
    //
    //                            if let maxFiyat = dict["MAXFIYAT"] as? String {
    //                                bultenTemp._maxFiyat = maxFiyat
    //                                print("\(bultenTemp.maxFiyat)")
    //                            }
    //
    //                            if let ortFiyat = dict["ORTFIYAT"] as? String {
    //                                bultenTemp._ortFiyat = ortFiyat
    //                                print("\(bultenTemp.ortFiyat)")
    //                            }
    //
    //                            if let miktar = dict["MIKTAR"] as? String {
    //                                bultenTemp._miktar = miktar
    //                                print("\(bultenTemp.miktar)")
    //                            }
    //
    //                            if let ilkMiktar = dict["ILKMIKTAR"] as? String {
    //                                bultenTemp._ilkMiktar = ilkMiktar
    //                                print("\(bultenTemp.ilkMiktar)")
    //                            }
    //                            if let tutar = dict["TUTAR"] as? String {
    //                                bultenTemp._tutar = tutar
    //                                print("\(bultenTemp.tutar)")
    //                            }
    //
    //                            if let satis = dict["SATIS"] as? String {
    //                                bultenTemp._satis = satis
    //                                print("\(bultenTemp.satis)")
    //                            }
    //
    //                            if let muamele = dict["MUAMELE"] as? String {
    //                                bultenTemp._muamele = muamele
    //                                print("\(bultenTemp.muamele)")
    //                            }
    //                            self.bultens.append(bultenTemp)
    //                        }
    //                    }
    //                }
    //                OperationQueue.main.addOperation({
    //                    self.tableView.reloadData()
    //                })
    //            }
    //        }).resume()
    //    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    //    func downloadBultenData(bultenUrl: String , completed: DownloadComplete){
    //        let bultenDataUrl = URL(string: bultenUrl)!
    //        print("Downloading bulten Data")
    //        let queue = DispatchQueue(label: BULTENURL, qos: .utility, attributes: [.concurrent])
    //        Alamofire.request(bultenDataUrl)
    //            .response(
    //                queue: queue,
    //                responseSerializer: DataRequest.jsonResponseSerializer(),
    //                completionHandler: { response in
    //                    let result = response.result
    //                    if let  temp = result.value as? Dictionary<String,Array<Dictionary<String,String>>> {
    //                        self.sectionDictionary = self.sectioncounts(dict: temp)
    //
    //                        //     print("\(result.value)")
    //                        //            print("\(temp)")
    //                        //  print("\(temp["Bulten"])")
    //                        //               var i: Int = 0;
    //                        var section: String = ""
    //                        if let dictt = temp["Bulten"] {
    //                            for dict in dictt {
    //                                var bultenTemp = Bulten()
    //                                print("FOR LOOOP")
    //                                if let anaGrup = dict["ANAGRUP"] as? String {
    //                                    bultenTemp._anaGrup = anaGrup
    //                                    print("\(anaGrup)")
    //                                }
    //                                if let anaGrup_ENG = dict["GRAIN"] as? String {
    //                                    bultenTemp._anaGrup_ENG = anaGrup_ENG
    //                                    print("\(anaGrup_ENG)")
    //                                }
    //                                if let anaGrup_ISP = dict["ANAGRUP_ISP"] as? String {
    //                                    bultenTemp._anaGrup_ISP = anaGrup_ISP
    //                                    print("\(anaGrup_ISP)")
    //                                }
    //
    //                                if let altGrup = dict["ALTGRUP"] as? String {
    //                                    bultenTemp._altGrup = altGrup
    //                                    print("\(altGrup)")
    //                                }
    //
    //                                if let altGrup_ENG = dict["ALTGRUP_ENG"] as? String {
    //                                    bultenTemp._altGrup_ENG = altGrup_ENG
    //                                    print("\(altGrup_ENG)")
    //                                }
    //
    //                                if let altGrup_ISP = dict["ALTGRUP_ISP"] as? String {
    //                                    bultenTemp._altGrup_ISP = altGrup_ISP
    //                                    print("\(bultenTemp.altGrup_ISP)")
    //                                }
    //
    //                                if let mal = dict["MAL"] as? String {
    //                                    bultenTemp._mal = mal
    //                                    print("\(bultenTemp.mal)")
    //                                }
    //
    //                                if let mal_ENG = dict["MAL_ENG"] as? String {
    //                                    bultenTemp._mal_ENG = mal_ENG
    //                                    print("\(bultenTemp.mal_ENG)")
    //                                }
    //
    //                                if let mal_ISP = dict["MAL_ISP"] as? String {
    //                                    bultenTemp._mal_ISP = mal_ISP
    //                                    print("\(bultenTemp.mal_ISP)")
    //                                }
    //
    //                                if let malKod = dict["MALKOD"] as? String {
    //                                    bultenTemp._malKod = malKod
    //                                    print("\(bultenTemp.malKod)")
    //                                }
    //
    //                                if let anaKod = dict["ANAKOD"] as? String {
    //                                    bultenTemp._anaKod = anaKod
    //                                    print("\(bultenTemp.anaKod)")
    //                                }
    //
    //                                if let altKod = dict["ALTKOD"] as? String {
    //                                    bultenTemp._altKod = altKod
    //                                    print("\(bultenTemp.altKod)")
    //                                }
    //
    //                                if let esasBirim = dict["ESASBRM"] as? String {
    //                                    bultenTemp._esasBirim = esasBirim
    //                                    print("\(bultenTemp.esasBirim)")
    //                                }
    //
    //                                if let yardBirim = dict["YARDBRM"] as? String {
    //                                    bultenTemp._yardBRM = yardBirim
    //                                    print("\(bultenTemp.yardBRM)")
    //                                }
    //
    //                                if let minFiyat = dict["MINFIYAT"] as? String {
    //                                    bultenTemp._minFiyat = minFiyat
    //                                    print("\(bultenTemp.minFiyat)")
    //                                }
    //
    //                                if let maxFiyat = dict["MAXFIYAT"] as? String {
    //                                    bultenTemp._maxFiyat = maxFiyat
    //                                    print("\(bultenTemp.maxFiyat)")
    //                                }
    //
    //                                if let ortFiyat = dict["ORTFIYAT"] as? String {
    //                                    bultenTemp._ortFiyat = ortFiyat
    //                                    print("\(bultenTemp.ortFiyat)")
    //                                }
    //
    //                                if let miktar = dict["MIKTAR"] as? String {
    //                                    bultenTemp._miktar = miktar
    //                                    print("\(bultenTemp.miktar)")
    //                                }
    //
    //                                if let ilkMiktar = dict["ILKMIKTAR"] as? String {
    //                                    bultenTemp._ilkMiktar = ilkMiktar
    //                                    print("\(bultenTemp.ilkMiktar)")
    //                                }
    //                                if let tutar = dict["TUTAR"] as? String {
    //                                    bultenTemp._tutar = tutar
    //                                    print("\(bultenTemp.tutar)")
    //                                }
    //
    //                                if let satis = dict["SATIS"] as? String {
    //                                    bultenTemp._satis = satis
    //                                    print("\(bultenTemp.satis)")
    //                                }
    //
    //                                if let muamele = dict["MUAMELE"] as? String {
    //                                    bultenTemp._muamele = muamele
    //                                    print("\(bultenTemp.muamele)")
    //                                }
    //
    //                                print("\(bultenTemp._altGrup)")
    //                                print("am here ")
    //                                print("Bultens. count  = (\(self.bultens.count)")
    //                                self.bultens.append(bultenTemp)
    //                                //                        self.bultens.sort{ $0.anaGrup.compare($1.anaGrup, options: .numeric) == .orderedAscending }
    //                                //                        DispatchQueue.main.async {
    //                                //                            print("Am I back on the main thread: \(Thread.isMainThread)")
    //                                //                            print("PRINTING BULTENS \(self.bultens)")
    //
    //                                //                        }
    //
    //                            }
    //
    //                        }
    //                        //  self.tableView.reloadData()
    //
    //                    }
    //                    DispatchQueue.main.async {
    //                        self.tableView.reloadData()
    //                    }
    //            }
    //
    //        )
    //
    //    }
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
        
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
//        
//        print(section)
//        print("SECTION NAMES: \(self.sectionNames[section])")
//        return  sectionNames[section]
        
        return "Test"
        
    }
    
    //                func sectionIndexTitles(for tableView: UITableView) -> [String]? {
    //                    print("SECTION INDEX TITLE \(sectionNames)")
    //                    return self.sectionNames
    //                }
    
    //    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
    //        let vw = UIView()
    //        vw.backgroundColor = UIColor.red
    //
    //        return vw
    //    }
    //
    
    
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return bultens.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if bultens.count > 0 {
            
            if let cell = tableView.dequeueReusableCell(withIdentifier: "BultenCell", for: indexPath) as? BultenCell {
                let bulten = bultens[indexPath.row]
                cell.configureCell(bulten: bulten)
                return cell
                
                
            }
                
            else {
                return UITableViewCell()
                
            }
        }
        
        return UITableViewCell()
    }
    
    
    @IBAction func segmentedControllerChanged(_ sender: UISegmentedControl) {
        
        var oldBultens: Array<Bulten> = bultens
        
        //                    var i = 0
        //                    for bulten in bultens {
        //                        for oldbulten in oldBultens {
        //                            if bulten === oldbulten {
        //                                bultens.remove(at: i)
        //                            }
        //
        //                            i = i + 1
        //                        }
        //
        //                    }
        switch self.segmentedControllRef.selectedSegmentIndex {
            
        case 0:
            self.bultens.removeAll()
            downloadData(url: "BultenAnlik.ashx")
            break;
        case 1:
            self.bultens.removeAll()
            downloadData(url: "BultenAylik.ashx")
            break;
        case 2:
            self.bultens.removeAll()
            self.downloadData(url: "BultenYillik.ashx")
            break;
        default:
            print("Error --- Segmented Controll Changed Action")
        }
        
        
        
    }
    
    
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
    }
    
    
}
