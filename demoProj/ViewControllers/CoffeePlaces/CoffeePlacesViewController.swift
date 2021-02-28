//
//  CoffeePlacesTableViewController.swift
//  demoProj
//
//  Created by Ronak Shahstri on 2021-02-27.
//

import UIKit

class CoffeePlacesViewController: GenericViewController, ViewControllerProtocol {
    typealias viewModelType = CoffeePlacesViewModel
    
    var viewModel: viewModelType = CoffeePlacesViewModel()
    
    @IBOutlet weak var tableVanues: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        viewModel.fetchVanues(success: { [weak self] (vanues) in
            guard let strongSelf = self else { return }
            DispatchQueue.main.async {
                strongSelf.tableVanues.reloadData()
            }
        }, failure: { (error) in
            print(error)
        })
        viewModel.delegate = self
        self.tableVanues.reloadData()
    }
}

extension CoffeePlacesViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "vanueCell", for: indexPath) as? VanueTableViewCell {
            let venue = self.viewModel.listVanues[indexPath.row].venue
            cell.configureCell(title: venue.name,
                               details: viewModel.getDetailsOfVanue(venue.id),
                               tumbImageUrl: viewModel.getThumbImageUrl(venue.id))
            return cell
        }
        return UITableViewCell()
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.listVanues.count
    }
}

extension CoffeePlacesViewController: CoffeePlacesViewModelDelegate {
    func viewModelUpdated(indexPath: IndexPath) {
        DispatchQueue.main.async {
            self.tableVanues.reloadRows(at: [indexPath], with: .none)
        }
    }
}
