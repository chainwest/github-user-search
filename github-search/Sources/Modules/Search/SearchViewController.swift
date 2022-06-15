import UIKit
import RxSwift
import RxDataSources
import RxSwiftExt

final class SearchViewController: UIViewController {
    private let viewModel: SearchViewModel

    private let searchController = UISearchController()
    private let tableView = UITableView()

    private let disposeBag = DisposeBag()

    init(viewModel: SearchViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        assertionFailure()
        return nil
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        bind(to: viewModel)
        setup()
    }

    private func bind(to viewModel: SearchViewModel) {
        searchController.searchBar.rx.text
            .distinctUntilChanged()
            .debounce(.seconds(1), scheduler: MainScheduler.instance)
            .bind(to: viewModel.search)
            .disposed(by: disposeBag)

        viewModel.dataSource
            .drive(
                tableView.rx.items(
                    cellIdentifier: SearchCellView.reuseIdentifier, cellType: SearchCellView.self
                )
            ) { _, viewModel, cell in
                cell.configure(with: viewModel)
            }
            .disposed(by: disposeBag)

        viewModel.error.bind { [unowned self] error in
            self.showErrorMessage()
        }.disposed(by: disposeBag)
    }

    private func setup() {
        title = "GitHub Users"
        view.backgroundColor = .white
        setupTableView()
        setupSearchController()
    }

    private func setupTableView() {
        view.addSubview(tableView)
        tableView.register(SearchCellView.self, forCellReuseIdentifier: SearchCellView.reuseIdentifier)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }

    private func setupSearchController() {
        searchController.searchBar.sizeToFit()
        tableView.tableHeaderView = searchController.searchBar
        definesPresentationContext = true
    }

    private func showErrorMessage() {
        showAlert(withMessage: "There is some server error occurred.")
    }
}
