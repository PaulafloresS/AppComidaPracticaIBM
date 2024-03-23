import UIKit

struct Product {
    var time: String
    var price: String
    var imageName: String
    var name: String
}

class ViewController: UIViewController {
    // MARK: VARIABLES
    let productCollectionViewCelId = "ProductCollectionViewCell"
    var products = [Product]()
    var menu = [Menu]()
    var listmenu = [Product]()

    // MARK: OUTLETS
    @IBOutlet weak var collectionView: UICollectionView!

    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.dataSource = self
        collectionView.delegate = self
        
        let nibCell = UINib(nibName: productCollectionViewCelId, bundle: nil)
        collectionView.register(nibCell, forCellWithReuseIdentifier: productCollectionViewCelId)

        let product1 = Product(time: "30 min", price: "$20.0", imageName: "hamburguesa", name: "Hamburguesa")
        let product2 = Product(time: "20 min", price: "$15.0", imageName: "hotcakes", name: "Hotcakes")
        let product3 = Product(time: "50 min", price: "$25.0", imageName: "taco", name: "Tacos dorados")
        let product4 = Product(time: "30 min", price: "$20.0", imageName: "ramen", name: "Ramen")
        let product5 = Product(time: "20 min", price: "$15.0", imageName: "alitas", name: "Alitas")
        let product6 = Product(time: "50 min", price: "$25.0", imageName: "sushi", name: "Sushi")
        products = [product1, product2, product3, product4, product5, product6]
    }

    @IBAction func clickMenuButton(_ sender: Any) {
        performSegue(withIdentifier: "navFoodScreen", sender: nil)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "navFoodScreen" {
            let dvc = segue.destination as! MenuViewController
            dvc.listmenu = products
        }
    }
}

// MARK: COLLECTIONVIEW Data Source and Delegate Methods
extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
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

