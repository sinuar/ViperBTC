//
//  MainModuleView.swift
//  CBViewChecker
//
//  Created by Heber Raziel Alvarez Ruedas on 18/04/22.
//

import UIKit

class MainModuleView: UIViewController {
    // MARK: - MainModulePresenterProtocol properties
    var presenter: MainModulePresenterProtocol?
    var tableView: UITableView!
    
    // MARK: - PRIVATE PROPERTIES
    var rates: [BTCRate]
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        self.rates = []
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setView()
    }
    
    private func setTableView() {
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 8),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -8),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    
    private func setView() {
        view.backgroundColor = .white
        presenter?.loadData()
        tableView = UITableView()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(tableView!)
        setTableView()
        tableView.register(CriptoCell.self, forCellReuseIdentifier: Constants.cellIdentifier)
    }
}


extension MainModuleView: MainModuleViewProtocol {
    func loadedView(data: [BTCRate]) {
        self.rates = data
    }
}

extension MainModuleView: UITableViewDelegate { }

extension MainModuleView: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return rates.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell: CriptoCell = tableView.dequeueReusableCell(withIdentifier: Constants.cellIdentifier) as? CriptoCell else {
            return CriptoCell()
        }
        cell.title.text = "\(rates[indexPath.row].cripto)\n\(rates[indexPath.row].parity)"
        return cell
    }
}


