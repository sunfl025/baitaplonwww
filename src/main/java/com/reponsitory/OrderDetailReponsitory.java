package com.reponsitory;

import org.springframework.data.jpa.repository.JpaRepository;

import com.model.OrderDetail;

public interface OrderDetailReponsitory extends JpaRepository<OrderDetail, Integer>{

}
