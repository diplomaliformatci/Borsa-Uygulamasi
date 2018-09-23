//
//  BorsanomiVC.swift
//  Deneme
//
//  Created by Can KINCAL on 23/08/2017.
//  Copyright © 2017 Can KINCAL. All rights reserved.
//

import UIKit

class BorsanomiVC: UIViewController , UICollectionViewDelegate , UICollectionViewDataSource , UICollectionViewDelegateFlowLayout {

    @IBOutlet weak var borsanomiCollectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        borsanomiCollectionView.delegate = self
        borsanomiCollectionView.dataSource = self
        
        
            // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            let image = UIImage(named: "top-view-baby-cat-white-background-25400601")
            let text  = "Test"
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "BorsanomiCell", for: indexPath) as? BorsanomiCell {
            cell.configureCell(image: image!, title: text)
            return cell
        }
        
        return UICollectionViewCell()
        
        
        
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1;
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 20;
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.size.width / 5 , height: collectionView.frame.size.height / 5)
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
