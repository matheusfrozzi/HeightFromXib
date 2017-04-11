//
//  ViewController.swift
//  Teste
//
//  Created by Matheus Frozzi Alberton on 10/04/17.
//  Copyright © 2017 720. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        tableView.tableFooterView = UIView()
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 140

        self.tableView.setNeedsLayout()
        self.tableView.layoutIfNeeded()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
            let header = BookTableViewCell.instanceFromNib()
            header.indexPath = indexPath
            header.loadCell()

            header.bounds.size.width = self.view.bounds.width
            header.bookBGView.bounds.size.width = self.view.bounds.width - 40
            header.setNeedsLayout()
            header.layoutIfNeeded()
            header.updateConstraints()
            header.setNeedsUpdateConstraints()
            header.updateConstraintsIfNeeded()
            let height = header.systemLayoutSizeFitting(UILayoutFittingExpandedSize).height + 1.0
            header.bounds.size.height = height
//            header.bounds.size.width = self.view.bounds.width

            cell.contentView.addSubview(header)
            
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell2", for: indexPath)
            
            if let label = cell.viewWithTag(22) as? UILabel {
                label.text = "Make sure you have set constraints within your tableview cell that will force it to expand to the height you want. If this doesn't work, you might try doing this in a prototype cell within one of your table view controllers, just to see if perhaps there is an issue using xibs for dynamic cells."
            }
            
            return cell
        }
    }

//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        return UITableViewAutomaticDimension
//    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let header = BookTableViewCell.instanceFromNib()
        header.indexPath = indexPath
        header.loadCell()

        header.bounds.size.width = self.view.bounds.width
        header.bookBGView.bounds.size.width = self.view.bounds.width - 40
        header.setNeedsLayout()
        header.layoutIfNeeded()
        header.updateConstraints()
        header.setNeedsUpdateConstraints()
        header.updateConstraintsIfNeeded()
        let height = header.systemLayoutSizeFitting(UILayoutFittingExpandedSize).height + 1.0

        return height
    }
}

