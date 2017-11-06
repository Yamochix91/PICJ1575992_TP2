import UIKit

class ViewController: UIViewController, UICollectionViewDataSource {
    
    // ou bien: Array<Dictionary<String,String>>
    var tableauDonnees=[Array<String>]()
    
 // lesAmisDeLaScienceData
    
    
    @IBOutlet weak var CVPub: UICollectionView!
    // *****************************************************
    override func viewDidLoad(){
        CVPub.dataSource = self
        super.viewDidLoad()
        //let uneImage = UIImageView(image: UIImage(named: lesAmisDeLaScienceData[0]["photo"]!))
        //view.addSubview(uneImage)

        let pathFichierPlist = Bundle.main.path(forResource: "lesDonnes", ofType: "plist")!
        print("#pathFichierPlist: \(pathFichierPlist)")
        // Voir documentation pour Array VS NSArray:
        // https://developer.apple.com/reference/swift/array
        // https://developer.apple.com/reference/foundation/nsarray
        tableauDonnees = NSArray(contentsOfFile: pathFichierPlist) as! Array
        
        
        
    } // viewDidLoad
    
    /*func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return lesAmisDeLaScienceData.count
    } // numberOfRowsInSection
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        print("#Construction de la cellule numéro: \(indexPath.row)")
        var uneCellule:Savant
        uneCellule = tableView.dequeueReusableCell(withIdentifier: "celluleSavant") as! Savant
        
        return uneCellule
    } // cellForRowAt indexPath*/
    
    //MARK:- Méthodes du protocole UICollectionViewDataSource
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return tableauDonnees.count
    } // numberOfItemsInSection
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        var celluleCourante:CVCPub
        
        celluleCourante = collectionView.dequeueReusableCell(withReuseIdentifier: "modeleCellulePub", for:indexPath) as! CVCPub
        celluleCourante.pubNom.text = tableauDonnees[indexPath.row][0]
        celluleCourante.pubImage.image = UIImage(named: tableauDonnees[(indexPath as NSIndexPath).row][1])
        
        return celluleCourante
    } // cellForItemAt indexPath
    
    
    
    
    
}  // ViewController
