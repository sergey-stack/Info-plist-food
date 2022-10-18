//
//  ListDishesViewController.swift
//  InfoPlistFood
//
//  Created by сергей on 16.10.22.
//

import UIKit

class ListDishesViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    
    
    
    
    var category: DishCategory!
    var dishes: [Dish] = [
        .init(id: "id1", name: "Pizza", description: "This is the best pizza" , image: "https://picsum.photos/50/100", calories: 150),
        .init(id: "id2", name: "Soupe", description: "This is the best I have ever tastedThis is the best", image: "https://picsum.photos/50/100", calories: 200),
        .init(id: "id2", name: "Chiken", description: "This is the best I have ever tastedThis is the best", image: "https://picsum.photos/50/100", calories: 200)
        
                      ]
    
    
    
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.reloadData()
        
        title = category.name
        registerCells()

    }
    
    private func registerCells() {
        tableView.register(UINib(nibName: DishListTableViewCell.identifier, bundle: nil), forCellReuseIdentifier: DishListTableViewCell.identifier)
    }
    
    
    
}
 
extension ListDishesViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dishes.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: DishListTableViewCell.identifier) as! DishListTableViewCell
        cell.setup(dish: dishes[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        let storyboard = UIStoryboard(name: "Main", bundle: nil)
//        let vc = storyboard.instantiateViewController(withIdentifier: "DishDetailViewController") as! DishDetailViewController
//
        
        let controller = DishDetailViewController.instantiate()
       controller.dish = dishes[indexPath.row]
       // vc.dish = dishes[indexPath.row]
       navigationController?.pushViewController(controller, animated: true)
       // navigationController?.pushViewController(vc, animated: true)

    }
}

