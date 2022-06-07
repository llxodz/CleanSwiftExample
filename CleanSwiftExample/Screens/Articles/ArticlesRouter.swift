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
        let storyboard = UIStoryboard.init(name: "ArticleDetailsViewController", bundle: nil)
        guard let articleVC = storyboard.instantiateViewController(withIdentifier: "ArticleDetailsViewController") as? ArticleDetailsViewController else { return }
        
        articleVC.router?.dataStore?.articleId = articleId
        
        viewController?.present(articleVC, animated: true, completion: nil)
    }
}
