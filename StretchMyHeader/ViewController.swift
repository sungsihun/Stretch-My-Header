//
//  ViewController.swift
//  StretchMyHeader
//
//  Created by NICE on 2018-09-11.
//  Copyright © 2018 NICE. All rights reserved.
//

import UIKit

struct NewsItem {
  let category: String
  let headline: String
  
  init(category: String, headline: String) {
    self.category = category
    self.headline = headline
  }
}

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UIScrollViewDelegate {
  
  @IBOutlet weak var header: UIView!
  @IBOutlet weak var dateLabel: UILabel!
  @IBOutlet weak var tableView: UITableView!
  
  private let kTableHeaderHeight: CGFloat = 310.0
  
  var newsItems = [NewsItem]()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    self.newsItems.append(NewsItem(category: "World", headline: "Climate change protests, divestments meet fossil fuels realities"))
    self.newsItems.append(NewsItem(category: "Europe", headline: "Scotland's 'Yes' leader says independence vote is 'once in a lifetime'"))
    self.newsItems.append(NewsItem(category: "Middle East", headline: "Airstrikes boost Islamic State, FBI director warns more hostages possible"))
    self.newsItems.append(NewsItem(category: "Africa", headline: "Nigeria says 70 dead in building collapse; questions S. Africa victim claim"))
    self.newsItems.append(NewsItem(category: "Asia Pacific", headline: "Despite UN ruling, Japan seeks backing for whale hunting"))
    self.newsItems.append(NewsItem(category: "Americas", headline: "Officials: FBI is tracking 100 Americans who fought alongside IS in Syria"))
    self.newsItems.append(NewsItem(category: "World", headline: "South Africa in $40 billion deal for Russian nuclear reactors"))
    self.newsItems.append(NewsItem(category: "Europe", headline: "'One million babies' created by EU student exchanges"))
    
    header = tableView.tableHeaderView
    tableView.tableHeaderView = nil
    tableView.addSubview(header)
    tableView.contentInset = UIEdgeInsets(top: kTableHeaderHeight , left: 0, bottom: 0, right: 0)
    tableView.contentOffset = CGPoint(x: 0, y: -kTableHeaderHeight)

    updateHeaderView()
  }
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    self.navigationController?.setNavigationBarHidden(true, animated: animated)
  }
  
  
  func updateHeaderView() {
    var headerRect = CGRect(x: 0, y: -kTableHeaderHeight, width: tableView.bounds.width, height: kTableHeaderHeight)
    if tableView.contentOffset.y < -kTableHeaderHeight {
      headerRect.origin.y = tableView.contentOffset.y
      headerRect.size.height = -tableView.contentOffset.y
    }
    
    header.frame = headerRect
  }

  // MARK: Data Source
  
  func numberOfSections(in tableView: UITableView) -> Int {
    return 1
  }
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return self.newsItems.count
  }

  override var prefersStatusBarHidden: Bool {
    return true
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
    guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? TableViewCell else {
      fatalError("The dequeued cell is not an instance of TableViewCell.")
    }
    
    for index in indexPath {
      let category = self.newsItems[index].category
      let headline = self.newsItems[index].headline
      
      switch category {
        case "World":
          cell.categoryLabel.textColor = UIColor.red
        case "Americas":
          cell.categoryLabel.textColor = UIColor.blue
        case "Europe":
          cell.categoryLabel.textColor = UIColor.green
        case "Middle East":
          cell.categoryLabel.textColor = UIColor.yellow
        case "Africa":
          cell.categoryLabel.textColor = UIColor.orange
        case "Asia Pacific":
          cell.categoryLabel.textColor = UIColor.purple
        default:
          cell.categoryLabel.textColor = UIColor.black
      }

      cell.categoryLabel.text = category
      cell.headlineLabel.text = headline
    }
    
    let currentDate = Date()
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "MMMM dd"
    let dateString = dateFormatter.string(from: currentDate)
    self.dateLabel.text = dateString
    
    return cell
  }
  
  //MARK: TableView Delegate
  
  func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
    return UITableViewAutomaticDimension
  }
  
  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    return UITableViewAutomaticDimension
  }

  
  //MARK: ScrollView Delegate
  
  func scrollViewDidScroll(_ scrollView: UIScrollView) {
    updateHeaderView()
  }
  

}

