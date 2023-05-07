//
//  ProductListViewModel.swift
//  MVVM
//
//  Created by Shah Md Imran Hossain on 7/5/23.
//

import Foundation

class ProductListViewModel {
    @Published var products: [ProductViewModel] = []
    let webservice: Webservice
    
    init(webservice: Webservice) {
        self.webservice = webservice
    }
    
    func populateProducts() async {
        do {
            let products = try await webservice.getProducts()
            self.products = products.map(ProductViewModel.init)
        } catch {
            print(error)
        }
    }
}

struct ProductViewModel: Identifiable {
    private var product: Product
    
    init(product: Product) {
        self.product = product
    }
    
    var id: Int {
        return product.id
    }
    
    var title: String {
        return product.title
    }
    
    var price: Double {
        return product.price
    }
}
