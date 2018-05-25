//
//  CMSearchViewController.swift
//  Checkmate
//
//  Created by Kamil Khan on 2018-05-23.
//  Copyright © 2018 Kamil Khan. All rights reserved.
//

import UIKit

class CMSearchViewController: UIViewController, UISearchBarDelegate, UITableViewDelegate, UITableViewDataSource {
    
    private var searchBar: UISearchBar
    private var searchTableView: UITableView
    
    // TODO: Delete me.
    private var tags: [CMMetadata]
    private var results: [CMMetadata]
    private var isSearchEmpty: Bool
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        searchBar = UISearchBar()
        searchTableView = UITableView()
        
        // TODO: Delete me.
        let tag1 = CMTag(name: "Tag 1", color: .red)
        let tag2 = CMTag(name: "Tag 2", color: .blue)
        
        let cl1 = CMChecklist(name: "Checklist 1", directory: CMDirectory(name: "Home", parent: nil))
        let cl2 = CMChecklist(name: "Checklist 2", directory: CMDirectory(name: "Home", parent: nil))
        
        tag1.set(checklists: [cl1])
        tag2.set(checklists: [cl2])

        tags = [tag1, tag2]
        results = [cl1, cl2]
        isSearchEmpty = true
        
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .white
        self.navigationItem.title = "Search"
        
        searchBar.delegate = self
        
        view.addSubview(searchBar)
        searchBar.translatesAutoresizingMaskIntoConstraints = false
        searchBar.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        searchBar.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        searchBar.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        searchBar.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        view.addSubview(searchTableView)
        searchTableView.translatesAutoresizingMaskIntoConstraints = false
        searchTableView.topAnchor.constraint(equalTo: searchBar.bottomAnchor).isActive = true
        searchTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        searchTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        searchTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
        searchTableView.register(CMMetadataTableViewCell.self, forCellReuseIdentifier: CMConstants.MetadataCellID)
        searchTableView.delegate = self
        searchTableView.dataSource = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: UISearchbarDelegate code.
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        isSearchEmpty = searchText == ""
        if (isSearchEmpty) {
            // display tags
        } else {
            // display results
        }
        searchTableView.reloadData()
    }
    
    // MARK: UITableViewDatasource code.
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return isSearchEmpty ? 1 : 2
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case 0:
            return isSearchEmpty ? "Tags" : "Results"
        case 1:
            return "Tags"
        default:
            return ""
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch (section) {
        case 0:
            return isSearchEmpty ? tags.count : results.count
        case 1:
            return isSearchEmpty ? 0 : tags.count
        default:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // TODO: Test if I need to change the cell identifer to be unique from that of the directory views.
        let cell = tableView.dequeueReusableCell(withIdentifier: CMConstants.MetadataCellID, for: indexPath) as! CMMetadataTableViewCell

        
        if (isSearchEmpty) {
            cell.setMetadata(metadata: tags[indexPath.row])
            return cell
        } else {
            switch (indexPath.section) {
            case 0:
                cell.setMetadata(metadata: results[indexPath.row])
                return cell
            case 1:
                cell.setMetadata(metadata: tags[indexPath.row])
                return cell
            default:
                return cell
            }
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // TODO: Tapping Checklists.
        switch indexPath.section {
        case 0:
            if (isSearchEmpty) {
                let tagVC = CMTagViewController(tag: tags[indexPath.row] as! CMTag)
                navigationController?.pushViewController(tagVC, animated: true)
            } else {
                // TODO: Checklists...
                return
            }
        case 1:
            let tagVC = CMTagViewController(tag: tags[indexPath.row] as! CMTag)
            navigationController?.pushViewController(tagVC, animated: true)
        default:
            return
        }
        
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
}
