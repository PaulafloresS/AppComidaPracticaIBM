
import UIKit

struct Product {
    var time: String
    var price: String
    var imageName: String
    var name: String
}

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    @IBOutlet weak var collectionView: UICollectionView! {
        didSet {
            collectionView.register(UINib(nibName: "ProductCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: productCollectionViewCelId)
        }
    }
    
    let productCollectionViewCelId = "ProductCollectionViewCell"
    var products = [Product]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.dataSource = self
        collectionView.delegate = self
        
   
        let nibCell = UINib(nibName: "ProductCollectionViewCell", bundle: nil)
        collectionView.register(nibCell, forCellWithReuseIdentifier: productCollectionViewCelId)
        
       
        let product1 = Product(time: "30 min", price: "$20.0", imageName: "hamburguesa", name: "Hamburguesa")
        let product2 = Product(time: "20 min", price: "$15.0", imageName: "hotcakes", name: "Hotcakes")
        let product3 = Product(time: "50 min", price: "$25.0", imageName: "hamburguesa", name: "Hamburguesa")
        
        products = [product1, product2, product3]
    }
    
    // MARK: CollectionView Data Source and Delegate Methods
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return products.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: productCollectionViewCelId, for: indexPath) as! ProductCollectionViewCell
        let product = products[indexPath.row]
        cell.product.image = UIImage(named: product.imageName)
        cell.price.text = "\(product.price)"
        cell.time.text = product.time
        cell.name.text = product.name
        return cell
    }
}
