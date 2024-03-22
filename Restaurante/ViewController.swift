
import UIKit

struct Product {
    var time: String
    var price: String
    var imageName: String
    var name: String
}
struct FirstButtom {
    var image: String
    var title: String
    var secondimage: String
}

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return firstbuttom.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "ButtomCollectionViewCell", for: indexPath) as! ButtomCollectionViewCell
        let buttom = firstbuttom[indexPath.row]
        
        cell.title.text = buttom.title
        cell.images.image = UIImage(named: buttom.image)
        cell.secondimage.image = UIImage(named: buttom.secondimage)
        
        // Configura el accesorio de la celda con el estilo de flecha estándar
        cell.accessoryType = .disclosureIndicator
        // Cambiar el color de fondo de la celda y el color del texto
        cell.title.textColor = UIColor.white
        // Cambiar el color del accesorio a blanco
        cell.tintColor = UIColor.white
        return cell
        
    }

    
    
    @IBOutlet weak var tableView: UITableView!{
            didSet{
                   collectionView.register(UINib(nibName: "ButtomCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "ButtomCollectionViewCell")
        }
    }
    @IBOutlet weak var collectionView: UICollectionView! {
        didSet {
            collectionView.register(UINib(nibName: "ProductCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: productCollectionViewCelId)
        }
    }
    
    let productCollectionViewCelId = "ProductCollectionViewCell"
    var products = [Product]()
    var firstbuttom = [FirstButtom]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        collectionView.dataSource = self
        collectionView.delegate = self
        // Configurar separador para TableView
            tableView.separatorStyle = .singleLine
        tableView.separatorInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        tableView.separatorColor = .white
                

        // Register cell nib for table view
        let nibcell2 = UINib(nibName: "ButtomCollectionViewCell", bundle: nil)
            tableView.register(nibcell2, forCellReuseIdentifier: "ButtomCollectionViewCell")
        let nibCell = UINib(nibName: "ProductCollectionViewCell", bundle: nil)
        collectionView.register(nibCell, forCellWithReuseIdentifier: productCollectionViewCelId)
        let buttom1 = FirstButtom(image: "estrella", title: "Más popular", secondimage: "hotcakes")
        let buttom2 = FirstButtom(image: "estrella", title: "Desaynos", secondimage: "hotcakes")
        let buttom3 = FirstButtom(image: "estrella", title: "Ensaladas", secondimage: "hotcakes")
        let buttom4 = FirstButtom(image: "estrella", title: "Sopas", secondimage: "hotcakes")
        let buttom5 = FirstButtom(image: "estrella", title: "Postres", secondimage: "hotcakes")
        let buttom6 = FirstButtom(image: "estrella", title: "Mariscos", secondimage: "hotcakes")
       
        let product1 = Product(time: "30 min", price: "$20.0", imageName: "hamburguesa", name: "Hamburguesa")
        let product2 = Product(time: "20 min", price: "$15.0", imageName: "hotcakes", name: "Hotcakes")
        let product3 = Product(time: "50 min", price: "$25.0", imageName: "hamburguesa", name: "Hamburguesa")
        firstbuttom = [buttom1, buttom2, buttom3, buttom4, buttom5, buttom6]
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
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        // Color verde personalizado en formato hexadecimal #209A02
        let customGreen = UIColor(red: 32.0/255.0, green: 154.0/255.0, blue: 2.0/255.0, alpha: 1.0)
        cell.separatorInset = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
        // Aplicar el color de fondo a la celda
        cell.backgroundColor = customGreen
     
    }

}


