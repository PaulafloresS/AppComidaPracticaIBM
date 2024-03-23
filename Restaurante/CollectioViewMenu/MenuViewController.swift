import UIKit

struct Menu {
    var img: String
    var time: String
    var name: String
    var price: String
}

class MenuViewController: UIViewController {
    let menuCollectionViewCelId = "MenuCollectionViewCell"
    var menu = [Menu]()
    var listmenu = [Product]()

    @IBOutlet weak var collectionViewMenu: UICollectionView!

    override func viewDidLoad() {
        super.viewDidLoad()
        collectionViewMenu.dataSource = self
        collectionViewMenu.delegate = self
        
        let nibCell = UINib(nibName: menuCollectionViewCelId, bundle: nil)
        collectionViewMenu.register(nibCell, forCellWithReuseIdentifier: menuCollectionViewCelId)
        
        let menu1 = Menu(img: "hamburguesa", time: "30 min", name: "Hamburguesa", price: "$30.00")
        let menu2 = Menu(img: "chile", time: "40 min", name: "Chile en Nogada", price: "$20.00")
        let menu3 = Menu(img: "elote", time: "10 min", name: "Elote con chilito", price: "$10.00")
        let menu4 = Menu(img: "ramen", time: "30 min", name: "Ramen", price: "$50.00")
        let menu5 = Menu(img: "taco", time: "20 min", name: "Tacos dorados", price: "$20.00")
        let menu6 = Menu(img: "sushi", time: "30 min", name: "Sushi empanizado", price: "$20.00")
        let menu7 = Menu(img: "pasta", time: "20 min", name: "Pastas", price: "$50.00")
        let menu8 = Menu(img: "alitas", time: "50 min", name: "Alitas", price: "$30.00")
        let menu9 = Menu(img: "hamburguesa", time: "20 min", name: "Hamburguesa", price: "$20.00")
        let menu10 = Menu(img: "chile", time: "50 min", name: "Chile en Nogada", price: "$30.00")
        let menu11 = Menu(img: "elote", time: "10 min", name: "Elote con chilito", price: "$20.00")
        let menu12 = Menu(img: "ramen", time: "50 min", name: "Ramen", price: "$50.00")
        menu = [menu1, menu2, menu3, menu4, menu5, menu6, menu7,menu8, menu9, menu10, menu11, menu12]
    }
}

extension MenuViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return menu.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionViewMenu.dequeueReusableCell(withReuseIdentifier: menuCollectionViewCelId, for: indexPath) as! MenuCollectionViewCell
        let menuItem = menu[indexPath.row]
        cell.img.image = UIImage(named: menuItem.img)
        cell.name.text = menuItem.name
        cell.price.text = menuItem.price
        cell.time.text = menuItem.time
        return cell
    }
}

extension MenuViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let collectionViewWidth = collectionView.bounds.width
        let cellWidth = (collectionViewWidth - 10) / 2 // Calcula el ancho de las celdas para dos columnas con un espaciado de 10 puntos entre ellas
        let cellHeight: CGFloat = 200 // Altura de las celdas
        
        return CGSize(width: cellWidth, height: cellHeight)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 1 // Espaciado entre las columnas de las celdas
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 10, left: 1, bottom: 10, right: 1) // Espaciado en los bordes de la sección
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 1 // Espaciado entre las filas de las celdas
    }
}

