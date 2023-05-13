package com.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.model.Order;
import com.model.OrderDetail;
import com.model.Product;
import com.service.OrderDetailService;
import com.service.OrderService;
import com.service.ProductService;


@Controller
@RequestMapping("/admin")
public class OrderDetailManagerController {
	@Autowired
	private OrderService orderService;
	@Autowired
	private OrderDetailService orderDetailService;
	@Autowired
	private ProductService productService;

	 @GetMapping("/listOrDetail")
	 public String listOrDetail(Model theModel) {
		 List<OrderDetail>orderDetails = orderDetailService.getOrderDetailsByEnable(1);
		 theModel.addAttribute("orderDetails", orderDetails);
		 return "admin_layout/OrderManager";
	 }
	 @GetMapping("/listOrDetailAccetp")
	 public String listOrDetailAccetp(Model theModel) {
		 List<OrderDetail>orderDetails = orderDetailService.getOrderDetailsByEnable(2);
		 theModel.addAttribute("orderDetails", orderDetails);
		 return "admin_layout/OrderManager";
	 }
	 @GetMapping("/listTotalOrDetail")
	 public String listTotalOrDetail(Model theModel) {
		 List<OrderDetail>orderDetail1 = orderDetailService.getOrderDetailsByEnable(1);
		 List<OrderDetail>orderDetail2 = orderDetailService.getOrderDetailsByEnable(2);
		 System.out.println(orderDetail2);
		 List<OrderDetail>orderDetails = new ArrayList<>();
		 orderDetails.addAll(orderDetail1);
		 orderDetails.addAll(orderDetail2);
		 theModel.addAttribute("orderDetails", orderDetails);
		 return "admin_layout/OrderManager";
	 }
	 @GetMapping("/deleteOrDetail")
	    public String delete(@RequestParam("orderdetailId") int theId) {
		 		OrderDetail orderDetail = orderDetailService.getOrDetailById(theId);
		 		orderDetail.setEnable(0);
	            // delete the customer
	            orderDetailService.updateOrDetail(theId, orderDetail);

	            return "redirect:/admin/listOrDetail";
	    }
	 @GetMapping("/loadOrDetail")
	 public String loadInforOrder(@RequestParam("orderdetailId") int theId, Model model) {
		 OrderDetail orderDetail = orderDetailService.getOrDetailById(theId);
		 model.addAttribute("orderDetail", orderDetail);
		 Product product = productService.getProductById(orderDetail.getProduct().getId());
		 Order order = orderService.getOrderById(orderDetail.getOrder().getId());
		 model.addAttribute("proudct", product);
		 model.addAttribute("order", order);
		 return "admin_layout/OrderInfor";
	 }
	 @PostMapping("/updateOrDetail")
	 public String updateOrDetail(@Validated @ModelAttribute("orderDetail") OrderDetail orderDetail,BindingResult result) {
		 OrderDetail upOrderDetail = orderDetailService.getOrDetailById(orderDetail.getId());
		 if (result.hasErrors()) {
			 return "admin_layout/OrderInfor";
		}
		 upOrderDetail.setStatus("Chấp nhận");
		 upOrderDetail.setEnable(2);
		 orderDetailService.updateOrDetail(orderDetail.getId(), upOrderDetail);
         return "redirect:/admin/listOrDetail";

	 }
	}


