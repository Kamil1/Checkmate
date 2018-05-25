//
//  CMDirectoryViewController.swift
//  Checkmate
//
//  Created by Kamil Khan on 2018-05-14.
//  Copyright © 2018 Kamil Khan. All rights reserved.
//

import UIKit

class CMDirectoryViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    private var directoryObj: CMDirectory
    
    private var directoryTableView: UITableView!
    
    init(directory: CMDirectory) {
        self.directoryObj = directory
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationBar()
        setupTableView()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func setupNavigationBar() {
        self.navigationItem.title = directoryObj.name
        
        // FIXME: Not calling addNewList.
        let newListButton = UIBarButtonItem.init(barButtonSystemItem: .add, target: CMNewListInteractor(), action: #selector(CMNewListInteractor.addNewList))
        self.navigationItem.rightBarButtonItem = newListButton
        
        // Only present search bar in root directory.
        if (directoryObj.parent == nil) {
            let searchBarButton = UIBarButtonItem.init(barButtonSystemItem: .search, target: self, action: #selector(CMDirectoryViewController.presentSearchVC))
            self.navigationItem.leftBarButtonItem = searchBarButton
        }
    }
    
    func setupTableView() {
        directoryTableView = UITableView()
        // TODO: Change cellID based on position in view stack?
        directoryTableView.register(CMMetadataTableViewCell.self, forCellReuseIdentifier: CMConstants.MetadataCellID)
        directoryTableView.delegate = self
        directoryTableView.dataSource = self
        view.addSubview(directoryTableView)

        directoryTableView.translatesAutoresizingMaskIntoConstraints = false
        
        directoryTableView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        directoryTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        directoryTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        directoryTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }
    
    @objc
    private func presentSearchVC() {
        let searchVC = CMSearchViewController()
        navigationController?.pushViewController(searchVC, animated: true)
    }
    
    // MARK: UITableViewDataSource code.
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        assert(section == 0)
        return directoryObj.items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        assert(indexPath.row >= 0)
        assert(indexPath.row < directoryObj.items.count)
        
        let cell = tableView.dequeueReusableCell(withIdentifier: CMConstants.MetadataCellID, for: indexPath) as! CMMetadataTableViewCell
        let itemAtRow = directoryObj.items[indexPath.row]
        cell.setMetadata(metadata: itemAtRow)

        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        assert(indexPath.row >= 0)
        assert(indexPath.row < directoryObj.items.count)
        
        let rowItem = directoryObj.items[indexPath.row]
        switch rowItem.type {
        case .directory:
            let subDirectoryVC = CMDirectoryViewController(directory: rowItem as! CMDirectory)
            self.navigationController?.pushViewController(subDirectoryVC, animated: true)
        case .list:
            // TODO
            break
        case .tag:
            // TODO
            break
        }
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
}
