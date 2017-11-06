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
    
    // Méthode exécutée automatiquement avant un segue
    //MARK:- Préparer le déplacement (segue)
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Note: Il faut avoir renseigné un @IBOutlet sur le UICollectionView
        
        // 1 - Déterminer l'index de la sélection à partir de la cellule reçue en paramètre (sender)
        let selection = CVSavant.indexPath(for: sender as! UICollectionViewCell)!.row
        yo(dans: String(selection))
        print("# Exécution de la méthode: prepareForSegue pour la cellule numéro: \(selection)\n")
        
        // 2 - Créer un objet pointant sur l'instance de classe de la destination
        let destination = segue.destination as! VCDetails
        
        // 3 - Passer les informations au controleur de destination
        destination.informationsDuSavantCourant = lesAmisDeLaScienceData[selection]
        
    } // prepare(for segue: ...)

    
    
    
    
}  // ViewController
