package com.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.model.Category;
import com.model.Product;
import com.reponsitory.ProductReponsitory;
import com.service.ProductService;

@Service
public class ProductServiceImpl implements ProductService{
	@Autowired
	ProductReponsitory productReponsitory;

	@Override
	public List<Product> getAllProducts() {
		// TODO Auto-generated method stub
		return productReponsitory.findAll();
	}

	@Override
	public Product getProductById(int id) {
		// TODO Auto-generated method stub
		return productReponsitory.findById(id).orElse(null);
	}

	@Override
	public Product addProduct(Product product) {
		if(product != null) {
			return productReponsitory.save(product);
		}
		return null;
	}
	@Override
	public List<Product> saveAllProduct(List<Product> products) {
		if(products != null) {
			return productReponsitory.saveAll(products);
		}
		return null;
	}
	@Override
	public Product updateProduct(int id,Product product) {
		Product product2 = productReponsitory.findById(id).orElse(null);
		if(product2 != null) {
			product2.setTitle(product.getTitle());
			product2.setPrice(product.getPrice());
			product2.setDescription(product.getDescription());
			product2.setImage(product.getImage());
			product2.setStatus(product.getStatus());
			product2.setCreated_at(product.getCreated_at());
			product.setCategory(product.getCategory());
			return productReponsitory.save(product2);
		}
		return null;
	}

	@Override
	public String deleteProduct(Product product) {
		// TODO Auto-generated method stub
			productReponsitory.delete(product);
			return "success";
	}

	@Override
	public Product getProductByTitle(String title) {
		// TODO Auto-generated method stub
		return productReponsitory.getProductByTitle(title);
	}

	@Override
	public String deleteProductById(int id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Product> getProductByEnable(int enable) {
		// TODO Auto-generated method stub
		return productReponsitory.getProductByEnable(enable);
	}

	@Override
	public List<Product> getProductsByTitle(String title) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Product> getProductByCategory(Category category) {
		// TODO Auto-generated method stub
		return productReponsitory.getProductByCategory(category);
	}





	
}
