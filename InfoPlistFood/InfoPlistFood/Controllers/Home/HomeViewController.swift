//
//  HomeViewController.swift
//  InfoPlistFood
//
//  Created by сергей on 10.10.22.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var categoryCollectionView: UICollectionView!
    
    
    @IBOutlet weak var popularCollectionView: UICollectionView!
    
    @IBOutlet weak var specialsCollectionView: UICollectionView!
    
    
    
    var categories: [DishCategory] = [
        .init(id: "id1", name: "Africa Dish", image: "https://picsum.photos/50/100"),
        .init(id: "id1", name: "Africa Dish", image: "https://picsum.photos/100/200"),
        .init(id: "id1", name: "Africa Dish", image: "https://picsum.photos/100/200"),
        .init(id: "id1", name: "Africa Dish", image: "https://picsum.photos/100/200"),
        .init(id: "id1", name: "Africa Dish", image: "https://picsum.photos/100/200"),
        .init(id: "id1", name: "Africa Dish", image: "https://picsum.photos/100/200"),
        
        
        ]
        
    var populars: [Dish] = [
        .init(id: "id1", name: "Gerry", description: "This is the best I have ever tastedThis is the best I have ever tastedThis is the best I have ever tastedThis is the best I have ever tastedThis is the best I have ever tasted", image: "https://picsum.photos/100/200", calories: 34),
        .init(id: "id1", name: "Pizza", description: "This is the best I have ever tasted", image: "https://picsum.photos/100/200", calories: 314),
        .init(id: "id1", name: "Indomie", description: "This is the best I have ever tasted", image: "https://picsum.photos/100/200", calories: 345)
    
    ]
    
    var specials: [Dish] = [
        .init(id: "id1", name: "fgfgf", description: "This is the best I have ever tasted", image: "https://picsum.photos/100/200", calories: 100),
        .init(id: "id1", name: "fgfgf", description: "This is the best I have ever tasted", image: "https://picsum.photos/100/200", calories: 100),
        .init(id: "id1", name: "fgfgf", description: "This is the best I have ever tasted", image: "https://picsum.photos/100/200", calories: 100)
    ]
    override func viewDidLoad() {
        super.viewDidLoad()
        registerCells()
       
       
    }
    private func registerCells() {
        categoryCollectionView.register(UINib(nibName: CategoryCollectionViewCell.identifier, bundle: nil), forCellWithReuseIdentifier: CategoryCollectionViewCell.identifier)
        popularCollectionView.register(UINib(nibName: DishPortraitCollectionViewCell.identifier, bundle: nil), forCellWithReuseIdentifier: DishPortraitCollectionViewCell.identifier)
        specialsCollectionView.register(UINib(nibName: DIshLandscapeCollectionViewCell.identifier, bundle: nil), forCellWithReuseIdentifier: DIshLandscapeCollectionViewCell.identifier)

    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch collectionView {
        case categoryCollectionView:
            return categories.count
        case popularCollectionView:
            return populars.count
        case specialsCollectionView:
            return specials.count
        default: return 0
        }
       
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch collectionView {
        case categoryCollectionView:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CategoryCollectionViewCell.identifier, for: indexPath) as? CategoryCollectionViewCell
            cell?.setup(category: categories[indexPath.row])
            return cell!
            
            
        case popularCollectionView:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: DishPortraitCollectionViewCell.identifier, for: indexPath) as? DishPortraitCollectionViewCell
            cell?.setup(dish: populars[indexPath.row])

            return cell!
        case specialsCollectionView:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: DIshLandscapeCollectionViewCell.identifier, for: indexPath) as? DIshLandscapeCollectionViewCell
            cell?.setup(dish: specials[indexPath.row])

            return cell!
            
            
            
            
            
            
            
        default: return  UICollectionViewCell()
        }
    
    }
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView == categoryCollectionView{
            
        }else {
            let controller = DishDetailViewController.instantiate()
            controller.dish = collectionView == popularCollectionView ?
            populars[indexPath.row] :
            specials[indexPath.row]
            navigationController?.pushViewController(controller, animated: true)
            
        }

}
}
