//
//  ProductsTableViewController.swift
//  GoodAsOldPhones
//
//  Created by Daniel Duma on 6/11/16.
//  Copyright © 2016 Example. All rights reserved.
//

import UIKit

class ProductsTableViewController: UITableViewController {
    
    var products: [Product]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let product1 = Product()
        let product2 = Product()
        let product3 = Product()
        let product4 = Product()
        
        product1.name = "1907 Wall Set"
        product1.productImage = "phone-fullscreen1"
        product1.cellImage = "image-cell1"
        
        product2.name = "1921 Dial Phone"
        product2.productImage = "phone-fullscreen2"
        product2.cellImage = "image-cell2"
        
        product3.name = "1937 Desk Set"
        product3.productImage = "phone-fullscreen3"
        product3.cellImage = "image-cell3"
        
        product4.name = "1984 Motorola Portable"
        product4.productImage = "phone-fullscreen4"
        product4.cellImage = "image-cell4"
        
        products = [product1, product2, product3, product4]
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let p = products { //if productNames exists, create a non optional version of it
            return p.count
        }
        return 0
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("ProductCell", forIndexPath: indexPath)
        let product = products?[indexPath.row]
        
        if let p = product {
            cell.textLabel?.text = p.name
            if let i = p.cellImage {
                cell.imageView?.image = UIImage(named: i)
            }
        }
        
        return cell
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "ShowProduct" {
            let productVC = segue.destinationViewController as? ProductViewController
            
//            if let cell = sender as? UITableViewCell {
//                if let indexPath = tableView.indexPathForCell(cell) {
//                    productVC?.productName = productNames?[indexPath.row]
//                }
//            }
            
            //guard checks if values exist and if they do sets them to specified varibles
            guard let cell = sender as? UITableViewCell,
                  let indexPath = tableView.indexPathForCell(cell) else {
              //if the variables don't have values
              return
            }
            
            productVC?.product = products?[indexPath.row]
        }
    }
}
