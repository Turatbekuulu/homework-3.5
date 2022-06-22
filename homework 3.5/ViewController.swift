//
//  ViewController.swift
//  homework 3.5
//
//  Created by Mac on 18/6/22.
//

import UIKit

class ViewController: UIViewController {
    
    var korzina: [Int] = []
    
    
    var food: [Shop] = [
        Shop(image: UIImage(named: "marshmello")!, price: 128),
        Shop(image: UIImage(named: "coke")!, price: 69),
        Shop(image: UIImage(named: "sugar")!, price: 55),
        Shop(image: UIImage(named: "chips")!, price: 139),
        Shop(image: UIImage(named: "croissant")!, price: 32),
        Shop(image: UIImage(named: "meat")!, price: 400)
    ]
    
    var sum = 0
    
    
    @IBOutlet weak var myCollectionView: UICollectionView!
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        myCollectionView.dataSource = self
        myCollectionView.delegate = self
        // Do any additional setup after loading the view.
    }


}

extension ViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return food.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "collectionCell", for: indexPath) as! myCollectionViewCell
        cell.imageCell.image = food[indexPath.row].image
        cell.labelCell.tag = food[indexPath.row].price
        return cell
    }
    
    
}


extension ViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize.init(width: 128, height: 128)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        korzina.append(food[indexPath.row].price)
        print(korzina)
        
        let number = food[indexPath.row].price
        sum += number
        print(sum)
    }
}


