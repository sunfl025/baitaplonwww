package com.reponsitory;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.model.Category;
import com.model.Product;

@Repository
public interface ProductReponsitory extends JpaRepository<Product, Integer>{
	Product getProductByTitle(String title);
	List<Product> getProductByEnable(int enable);
	List<Product> getProductByCategory(Category category);
}
