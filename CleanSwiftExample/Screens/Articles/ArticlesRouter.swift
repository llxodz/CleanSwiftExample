import Foundation
import UIKit

protocol ArticlesRoutingLogic {
    func navigateToDetails(articleId: Int)
}

class ArticlesRouter {
    
    weak var viewController: UIViewController?
}

extension ArticlesRouter: ArticlesRoutingLogic {
    func navigateToDetails(articleId: Int) {
        let vc = UIStoryboard(name: "ArticleDetailsViewController", bundle: nil).instantiateViewController(withIdentifier: "ArticleDetailsViewController")
        
        viewController?.present(vc, animated: true, completion: nil)
    }
}
