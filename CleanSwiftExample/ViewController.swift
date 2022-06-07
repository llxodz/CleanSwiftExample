import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    

    @IBAction func tapTable(_ sender: Any) {
        let vc = UIStoryboard(name: "ArticlesViewController", bundle: nil).instantiateViewController(withIdentifier: "ArticlesViewController")
        vc.modalPresentationStyle = .overCurrentContext
        
        present(vc, animated: true, completion: nil)
    }
}

