//
//  ViewController.swift
//  Deneme
//
//  Created by Can KINCAL on 16/08/2017.
//  Copyright © 2017 Can KINCAL. All rights reserved.
//

import UIKit

class MainVC: UIViewController  , UICollectionViewDelegate , UICollectionViewDataSource , UICollectionViewDelegateFlowLayout{

    @IBOutlet weak var collectionLayer: UIView!
    @IBOutlet weak var mainCollectionView: UICollectionView!
    
    let menuArr: Array<String> = ["Kurumsal" , "Borsanomi" , "Haberler", "Bultenler" ,"Iletisim ","Borsam"]
    
    var l: CALayer {
        return collectionLayer.layer
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mainCollectionView.delegate = self
        mainCollectionView.dataSource = self

        
        // Do any additional setup after loading the view, typically from a nib.
    
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
       print("kk")
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "mainCell", for: indexPath) as? mainCell
        {
            let name = menuArr[indexPath.row]
            cell.configureCell(name: name)
            print("a cell created")
            return cell
        }
            
        else {
            print("Error cell cannot create")
            return UICollectionViewCell()
        }
    }

    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 6;
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1;
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: l.frame.size.width / 3 , height: l.frame.size.height / 4)
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        var identifier = ""
        switch indexPath.row {
        case 0:
            identifier = "KurumsalVC"
        case 1:
            identifier = "BorsanomiVC"
        case 2:
            identifier = "HaberlerVC"
        case 3:
            identifier = "BultenlerVC"
        case 4:
            identifier = "IletisimVC"
        case 5:
            identifier = "BorsamVC"
        default:
            print("Error main Collection View Selection")
        }
        
        performSegue(withIdentifier: identifier, sender: nil)
        
    }

}


