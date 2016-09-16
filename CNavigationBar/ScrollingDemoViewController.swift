//
//  ScrollingDemoViewController.swift
//  CNavigationBar
//
//  Created by Victor on 7/29/16.
//  Copyright © 2016 Victor Sigler. All rights reserved.
//

import UIKit

class ScrollingDemoViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.navigationController?.navigationBar.reset()
    }
}

extension ScrollingDemoViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = "Text"
        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {

        let offsetY = scrollView.contentOffset.y
        
        if offsetY > 0 {
            offsetY >= 44 ? self.transformNavigationBarTransform(1) : self.transformNavigationBarTransform(offsetY / 44)
        }
        else {
            self.transformNavigationBarTransform(0)
            self.navigationController?.navigationBar.backIndicatorImage = UIImage()
        }
    }
    
    func transformNavigationBarTransform(_ progress: CGFloat) {
        self.navigationController?.navigationBar.setTranslationY(-44 * progress)
        self.navigationController?.navigationBar.setAlphaElements(1 - progress)
    }
}
