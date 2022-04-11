/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.hongnv.petstore.repository;

import com.hongnv.petstore.entity.Product;
import org.springframework.data.jpa.repository.JpaRepository;

/**
 *
 * @author LENOVO
 */
public interface ProductRepository extends JpaRepository<Product, Integer>{

    public Product findByName(String name);
    
}
