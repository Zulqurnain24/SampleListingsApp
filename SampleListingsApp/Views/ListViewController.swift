//
//  ViewController.swift
//  SampleListingsApp
//
//  Created by Muhammad Zulqurnain on 26/03/2023.
//

import UIKit

class ListViewController: UIViewController {
  let viewModel: ListViewModelProtocol
  let tableView = UITableView()

  init(viewModel: ListViewModelProtocol) {
    self.viewModel = viewModel
    super.init(nibName: nil, bundle: nil)
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setupView()
    setupTableView()
    viewModel.fetchListings {
      DispatchQueue.main.async {
        self.tableView.reloadData()
      }
    }
  }
  
  fileprivate func setupView() {
    title = "Listings"
    view.backgroundColor = .white
    navigationController?.navigationBar.prefersLargeTitles = true
  }
  
  fileprivate func setupTableView() {
    tableView.translatesAutoresizingMaskIntoConstraints = false
    tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
    tableView.dataSource = self
    tableView.delegate = self
    view.addSubview(tableView)
    NSLayoutConstraint.activate([
      tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
      tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
      tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
      tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
    ])
  }
}

extension ListViewController: UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return viewModel.listings.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
    let item = viewModel.listings[indexPath.row]
    cell.textLabel?.text = item.title
    cell.accessoryType = item.completed ? .checkmark : .none
    return cell
  }
}

extension ListViewController: UITableViewDelegate {
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    tableView.deselectRow(at: indexPath, animated: true)
    let item = viewModel.listings[indexPath.row]
    let detailVC = DetailViewController(item: item)
    navigationController?.pushViewController(detailVC, animated: true)
  }
}
