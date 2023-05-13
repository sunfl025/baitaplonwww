package com.service;

import java.util.List;

import com.model.Category;
import com.model.Product;



public interface ProductService {
	public List<Product> getAllProducts();
	public Product getProductById(int id);
	public Product addProduct(Product product);
	public List<Product> saveAllProduct(List<Product> products);
	public Product updateProduct(int id,Product product);
	public String deleteProductById(int id);
	public Product getProductByTitle(String title);
	public List<Product> getProductsByTitle(String title);
	String deleteProduct(Product product);
	List<Product> getProductByCategory(Category category);
	List<Product> getProductByEnable(int enable);
	
}
