package com.controller;

import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import java.sql.Date;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.util.StringUtils;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.model.Category;
import com.model.Product;
import com.service.CategoryService;
import com.service.ProductService;
import com.serviceImpl.FileUploadUntill;

import jakarta.validation.constraints.Min;
import jakarta.validation.constraints.NotNull;

@Controller
@RequestMapping("/admin")
public class ProductManagetController {
	@Autowired
	private ProductService productService;
	@Autowired
	private CategoryService categoryService;
	
	@GetMapping("/listProduct")
	public String listOrDetail(Model theModel) {
		List<Product> products = productService.getProductByEnable(1);
		theModel.addAttribute("products", products);
		return "admin_layout/ProductManager";
	}
	@GetMapping("/listProductBoy")
	public String listOrDetailBoy(Model theModel) {
		Category category = categoryService.getCategorytById(2);
		List<Product> products = productService.getProductByCategory(category);
		List<Product> productadd = new ArrayList<>();
		for(Product product : products) {
			if(product.getEnable()==1)
				productadd.add(product);
		}
		System.out.println(productadd);
		theModel.addAttribute("products", productadd);
		return "admin_layout/ProductManager";
	}
	@GetMapping("/listProductGirl")
	public String listOrDetailGirl(Model theModel) {
		Category category = categoryService.getCategorytById(1);
		List<Product> products = productService.getProductByCategory(category);
		List<Product> productadd = new ArrayList<>();
		for(Product product : products) {
			if(product.getEnable()==1)
				productadd.add(product);
		}
		System.out.println(productadd);
		theModel.addAttribute("products", productadd);
		return "admin_layout/ProductManager";
	}
	@GetMapping("/listProductBaby")
	public String listOrDetailBaby(Model theModel) {
		Category category = categoryService.getCategorytById(3);
		List<Product> products = productService.getProductByCategory(category);
		List<Product> productadd = new ArrayList<>();
		for(Product product : products) {
			if(product.getEnable()==1)
				productadd.add(product);
		}
		System.out.println(productadd);
		theModel.addAttribute("products", productadd);
		return "admin_layout/ProductManager";
	}
	@GetMapping("/listProductAccessory")
	public String listOrDetailAccessory(Model theModel) {
		Category category = categoryService.getCategorytById(4);
		List<Product> products = productService.getProductByCategory(category);
		List<Product> productadd = new ArrayList<>();
		for(Product product : products) {
			if(product.getEnable()==1)
				productadd.add(product);
		}
		System.out.println(productadd);
		theModel.addAttribute("products", productadd);
		return "admin_layout/ProductManager";
	}
	@GetMapping("/deleteProduct")
	public String delete(@RequestParam("productId") int theId) {
		Product product = productService.getProductById(theId);
		// delete the customer
		product.setEnable(0);
		productService.updateProduct(theId, product);
		return "redirect:/admin/listProduct";
	}

	@GetMapping("/showFormAddProduct")
	public String showFormAddProduct(Model theModel) {
		List<Category> categories = categoryService.getAllCategories();
		
		theModel.addAttribute("categories", categories);
		theModel.addAttribute("PRODUCT", new Product());

		return "admin_layout/addProduct";
	}
	@PostMapping("/saveProduct")
	public String saveProduct(@Validated @ModelAttribute("PRODUCT") Product product,BindingResult result, Model model, @RequestParam("photo") MultipartFile multipartFile) throws IOException {
		if(result.hasErrors()) {
			if(multipartFile.isEmpty()) {
				model.addAttribute("errorImage", "Hình ảnh chưa được thêm !!!");
			}
			return "admin_layout/addProduct";
		}
		String fileName = StringUtils.cleanPath(multipartFile.getOriginalFilename());
		String upLoadDir = "src/main/webapp/resources/images/upload/";
		FileUploadUntill.saveFile(upLoadDir, fileName, multipartFile);
		product.setImage("resources/images/upload/"+fileName);
		Category category = categoryService.getCategoryByTitle(product.getCategory().getTitle());
		product.setCreated_at(Date.valueOf(LocalDate.now()).toString());
		product.setStatus("Còn hàng");
		product.setCategory(category);
		product.setEnable(1);
		productService.addProduct(product);
		return "redirect:/admin/listProduct";
	}

//
	@GetMapping("/loadInfor")
	public String loadInfor(@RequestParam("productId") int theId, Model model) {
		Product product = productService.getProductById(theId);
		System.out.println(product);
		List<Category> categories = categoryService.getAllCategories();
		model.addAttribute("PRODUCT", product);
		model.addAttribute("categories", categories);
		return "admin_layout/ProductInfor";
	}
	
	@PostMapping("/updateProduct")
	public String updateProduct(@Validated @ModelAttribute("PRODUCT") Product product,BindingResult result, Model model, @RequestParam("photo") MultipartFile multipartFile) throws IOException {
		Product upProduct = productService.getProductById(product.getId());
		System.out.println(upProduct);
		if(result.hasErrors()) {
			return "admin_layout/ProductInfor";
		}
		if(multipartFile.isEmpty()) {
			upProduct.setImage(product.getImage());
		}else {
			String fileName = StringUtils.cleanPath(multipartFile.getOriginalFilename());
			String upLoadDir = "src/main/webapp/resources/images/upload/";
			FileUploadUntill.saveFile(upLoadDir, fileName, multipartFile);
			upProduct.setImage("resources/images/upload/"+fileName);
		}
		Category category = categoryService.getCategoryByTitle(product.getCategory().getTitle());
		upProduct.setTitle(product.getTitle());
		upProduct.setCreated_at(Date.valueOf(LocalDate.now()).toString());
		upProduct.setPrice(product.getPrice());
		upProduct.setDescription(product.getDescription());
		upProduct.setStatus(product.getStatus());
		upProduct.setCategory(category);
		productService.updateProduct(product.getId(), upProduct);
		return "redirect:/admin/listProduct";
	}
	

}
