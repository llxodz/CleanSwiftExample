import Foundation

protocol ArticleDetailsRoutingLogic {
    
}

protocol ArticleDetailsDataPassingProtocol {
    var dataStore: ArticleDetailsStoreProtocol? { get }
}

class ArticleDetailsRouter: ArticleDetailsDataPassingProtocol {
    
    weak var dataStore: ArticleDetailsStoreProtocol?
}

extension ArticleDetailsRouter: ArticleDetailsRoutingLogic {
    
}
