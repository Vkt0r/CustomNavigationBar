//
//  DemoViewController.swift
//  CNavigationBar
//
//  Created by Victor on 7/29/16.
//  Copyright © 2016 Victor Sigler. All rights reserved.
//

import UIKit

let NAVBAR_CHANGE_POINT: CGFloat = 50

class DemoViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.navigationController?.navigationBar._setBackgroundColor(UIColor.clear)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.scrollViewDidScroll(self.tableView)
        self.navigationController?.navigationBar.shadowImage = UIImage()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.navigationController?.navigationBar.reset()
    }
}

extension DemoViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = "Text"
        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Section \(section)"
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let color = UIColor(colorLiteralRed: 0, green: 175/255, blue: 240/255, alpha: 1)
        let offsetY = scrollView.contentOffset.y
        
        if offsetY > NAVBAR_CHANGE_POINT {
            let alpha = min(1, 1 - ((NAVBAR_CHANGE_POINT + 64 - offsetY) / 64))
            self.navigationController?.navigationBar._setBackgroundColor(color.withAlphaComponent(alpha))
        }
        else {
            self.navigationController?.navigationBar._setBackgroundColor(color.withAlphaComponent(0))
        }
    }
}
