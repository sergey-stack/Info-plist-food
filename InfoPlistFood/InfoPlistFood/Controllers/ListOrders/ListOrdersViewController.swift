//
//  ListOrdersViewController.swift
//  InfoPlistFood
//
//  Created by сергей on 18.10.22.
//

import UIKit

class ListOrdersViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    
    var orders:  [Order] = [.init(id: "id1", name: "Sergey Sizyy", dish: .init(id: "id1", name: "Pizza", description: "This is the best I have ever tasted", image: "https://picsum.photos/100/200", calories: 314)),
                            .init(id: "id1", name: "Roman", dish: .init(id: "id1", name: "fgfhf", description: "This is the best I have ever tasted", image: "https://picsum.photos/100/200", calories: 314)),
                            .init(id: "id1", name: "Aleksandr", dish: .init(id: "id1", name: "ccvv", description: "This is the best I have ever tasted", image: "https://picsum.photos/100/200", calories: 314)),
                                                    
                                                    
                            
    
    
    
    
    
    
    ]
   
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    registerCells()
        title = "Orders"
     
    }
    

    private func registerCells() {
        tableView.register(UINib(nibName: DishListTableViewCell.identifier, bundle: nil), forCellReuseIdentifier: DishListTableViewCell.identifier)
    }
}


extension ListOrdersViewController: UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return orders.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: DishListTableViewCell.identifier) as! DishListTableViewCell
        cell.setup(order: orders[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let controller = DishDetailViewController.instantiate()
        controller.dish = orders[indexPath.row].dish
        navigationController?.pushViewController(controller, animated: true)
    }
}
