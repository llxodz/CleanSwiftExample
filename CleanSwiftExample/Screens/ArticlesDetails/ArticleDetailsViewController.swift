import UIKit

class ArticleDetailsViewController: UIViewController {
    
    // MARK: - External vars
    private(set) var router: (ArticleDetailsRoutingLogic & ArticleDetailsDataPassingProtocol)?
    
    // MARK: - Internal vars
    private var interactor: (ArticleDetailsBusinessLogic & ArticleDetailsStoreProtocol)?
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        setup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        interactor?.fetchDetails()
    }
    
    private func setup() {
        let viewController = self
        let interactor = ArticleDetailsInteractor()
        let router = ArticleDetailsRouter()
        router.dataStore = interactor as? ArticleDetailsStoreProtocol
        viewController.interactor = interactor as? ArticleDetailsBusinessLogic & ArticleDetailsStoreProtocol
        viewController.router = router
    }
}
