import Foundation

protocol ArticlesBusinessLogic {
    func fetchData()
}

class ArticlesInteractor {
    
    var presenter: ArticlesPresentationLogic?
}

// MARK: - Business logic
extension ArticlesInteractor: ArticlesBusinessLogic {
    
    func fetchData() {
        presenter?.presentData()
    }
}
