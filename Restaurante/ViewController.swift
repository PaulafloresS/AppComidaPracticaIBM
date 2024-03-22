//
//  ViewController.swift
//  Restaurante
//
//  Created by Ana Paula Flores on 21/03/24.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return products.count
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        let inset: CGFloat = 10
        return UIEdgeInsets(top: inset, left: inset, bottom: inset, right: inset)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: productCollectionViewCelId, for: indexPath) as!
        ProductCollectionViewCell
        let product = products[indexPath.row]
        cell.product.image = UIImage(named: "hamburguesa")
        cell.price.text = product.name!
        cell.time.text = product.time!
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: UIScreen.main.bounds.width, height: 80)
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let product = products[indexPath.row]
        print("\(indexPath.row) - \(product.name!)")
    }
    @IBOutlet weak var collectionView: UICollectionView!{
        didSet{
            collectionView.register(UINib(nibName: "ProductCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "cell")
        }
    }
    let productCollectionViewCelId = "ProductCollectionViewCell"
    var products = [Producto]()
    override func awakeFromNib() {
        super.awakeFromNib()
    

    }
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.dataSource = self
        collectionView.delegate = self
        // Do any additional setup after loading the view.
        
        //MARK: REGISTER CELL
        let nibCell = UINib(nibName: productCollectionViewCelId, bundle: nil)
    
     
        // MARK: init data
        for _ in 1...25{
            let product = Producto()
//            product?.name = "Hamburguesa"
            product?.price = 20
            collectionView.reloadData()
            
        }
    }
    
        
    }
    

