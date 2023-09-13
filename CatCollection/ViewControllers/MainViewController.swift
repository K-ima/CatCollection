//
//  ViewController.swift
//  CatCollection
//
//  Created by Kima on 12.09.2023.
//

import UIKit

final class MainViewController: UITableViewController {

    
    let url = URL(string: "https://api.thecatapi.com/v1/images/search?limit=10")!
    private var cats: [Cat] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.rowHeight = 300
        fetchCat()
    }

     //MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        cats.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "catCell", for: indexPath)
        guard let cell = cell as? CatCell else { return UITableViewCell() }
        let cat = cats[indexPath.row]
        cell.configure(with: cat)
        return cell

    }

    private func fetchCat() {
        NetworkManager.shared.fetch([Cat].self, from: url) { [weak self] result in
            switch result {
            case .success(let cats):
                print(cats)
                self?.cats = cats
                self?.tableView.reloadData()
            case .failure(let error):
                print(error)
                
            }
        }
    }
}



