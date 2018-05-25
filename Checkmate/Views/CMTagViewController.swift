//
//  CMTagViewController.swift
//  Checkmate
//
//  Created by Kamil Khan on 2018-05-23.
//  Copyright © 2018 Kamil Khan. All rights reserved.
//

import UIKit

class CMTagViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    private var tagObj: CMTag
    
    private var listsTableView: UITableView
    
    init(tag: CMTag) {
        self.tagObj = tag
        listsTableView = UITableView()
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = tagObj.name
        
        view.addSubview(listsTableView)
        listsTableView.translatesAutoresizingMaskIntoConstraints = false
        listsTableView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        listsTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        listsTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        listsTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
        // TODO: Different cellID?
        listsTableView.register(CMMetadataTableViewCell.self, forCellReuseIdentifier: CMConstants.MetadataCellID)
        listsTableView.delegate = self
        listsTableView.dataSource = self
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: UITableView code.
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tagObj.checklists.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CMConstants.MetadataCellID, for: indexPath) as! CMMetadataTableViewCell
        cell.setMetadata(metadata: tagObj.checklists[indexPath.row])
        return cell
    }


}
