/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.hongnv.petstore.service;

import com.hongnv.petstore.entity.Product;
import com.hongnv.petstore.repository.ProductRepository;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author LENOVO
 */
@Service
public class ProductService {
    
    @Autowired
    private ProductRepository repository;
    
    public Product saveProduct(Product product){
        return repository.save(product);
    }
    
    public List<Product> saveProducts(List<Product> products){
        return repository.saveAll(products);
    }
    
    public List<Product> getProduct(){
        return repository.findAll();
    }
    
    public Product getProductById(int id){
        return repository.findById(id).orElse(null);
    }
    
    public Product getProductByName(String name){
        return repository.findByName(name);
    }
    
    public Product updateProduct(Product product){
        Product existingProduct=repository.findById(product.getId()).orElse(null);
        existingProduct.setName(product.getName());
        existingProduct.setPrice(product.getPrice());
        existingProduct.setQuantity(product.getQuantity());
        return repository.save(existingProduct);
    }

    public String deleteProduct(int id){
        repository.deleteById(id);
        return "Product removed || " + id;
    }
}
