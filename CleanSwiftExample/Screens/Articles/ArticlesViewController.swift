import UIKit

protocol ArticlesDisplayLogic: AnyObject {
    func displayData()
}

class ArticlesViewController: UIViewController {
    
    // MARK: - External vars
    @IBOutlet private weak var tableView: UITableView!
    
    // MARK: - Internal vars
    private var interactor: ArticlesBusinessLogic?
    private var data = [String]()
    
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
        configureTableView()
        interactor?.fetchData()
    }
    
    private func configureTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.tableFooterView = UIView(frame: .zero)
    }
    
    private func setup() {
        let viewController = self
        let presenter = ArticlesPresenter()
        let interactor = ArticlesInteractor()
        interactor.presenter = presenter
        presenter.viewController = viewController
        viewController.interactor = interactor
    }
}

// MARK: - UITableViewDataSource & Delegate implementation
extension ArticlesViewController: UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
}

extension ArticlesViewController: ArticlesDisplayLogic {
    func displayData() {
        
    }
}
