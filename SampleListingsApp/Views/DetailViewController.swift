//
//  DetailViewController.swift
//  SampleListingsApp
//
//  Created by Muhammad Zulqurnain on 26/03/2023.
//

import UIKit

class DetailViewController: UIViewController {
  private let item: Listing
  let viewModel: DetailViewModel
  
  private let titleLabel: UILabel = {
    let label = UILabel()
    label.translatesAutoresizingMaskIntoConstraints = false
    label.font = UIFont.systemFont(ofSize: 18, weight: .bold)
    label.numberOfLines = 0
    return label
  }()
  
  private let imageView: UIImageView = {
    let imageView = UIImageView()
    imageView.translatesAutoresizingMaskIntoConstraints = false
    imageView.contentMode = .scaleAspectFit
    return imageView
  }()
  
  private let descriptionLabel: UILabel = {
    let label = UILabel()
    label.translatesAutoresizingMaskIntoConstraints = false
    label.font = UIFont.systemFont(ofSize: 16, weight: .regular)
    label.numberOfLines = 0
    return label
  }()
  
  let likeButton: UIButton = {
    let button = UIButton(type: .system)
    button.translatesAutoresizingMaskIntoConstraints = false
    button.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .bold)
    return button
  }()
  
  init(item: Listing) {
    self.item = item
    self.viewModel = DetailViewModel(item: item)
    super.init(nibName: nil, bundle: nil)
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = .white
    setupViews()
    bindViewModel()
    setupButtonAction()
  }
  
  func setupButtonAction() {
    likeButton.addAction(UIAction(handler: { _ in
      self.likeButtonTapped()
    }), for: .touchUpInside)
  }
  
  fileprivate func setupConstraints() {
    NSLayoutConstraint.activate([
      titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16),
      titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
      titleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
      
      imageView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 16),
      imageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
      imageView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
      imageView.heightAnchor.constraint(equalToConstant: 200),
      
      descriptionLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 16),
      descriptionLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
      descriptionLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
      
      likeButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
      likeButton.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 16),
    ])
  }
  
  private func setupViews() {
    view.addSubview(titleLabel)
    view.addSubview(imageView)
    view.addSubview(descriptionLabel)
    view.addSubview(likeButton)
    
    setupConstraints()
  }
  
  private func bindViewModel() {
    titleLabel.text = viewModel.title
    descriptionLabel.text = viewModel.description
    Task {
      imageView.image = await viewModel.image
    }
    likeButton.setTitle(viewModel.likeButtonTitle, for: .normal)
    likeButton.setTitleColor(viewModel.likeButtonColor, for: .normal)
  }
  
  private func likeButtonTapped() {
    viewModel.toggleLike()
    likeButton.setTitle(viewModel.likeButtonTitle, for: .normal)
    likeButton.setTitleColor(viewModel.likeButtonColor, for: .normal)
  }
}
