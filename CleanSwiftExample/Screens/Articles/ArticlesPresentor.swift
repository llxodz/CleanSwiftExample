import Foundation

protocol ArticlesPresentationLogic {
    func presentData()
}

class ArticlesPresenter {
    
    weak var viewController: ArticlesDisplayLogic?
}

// MARK: - Presentation logic
extension ArticlesPresenter: ArticlesPresentationLogic {
    func presentData() {
        
    }
}
