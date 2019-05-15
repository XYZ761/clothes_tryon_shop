package com.neu.shop.service;

import com.neu.shop.pojo.*;

import java.util.List;

/**
 * Created by 王晓帆 on 2019/4/25.
 */
public interface OrderService {
    public void insertOrder(Order order);

    public void deleteById(Integer orderid);


    public List<Order> selectOrderByExample(OrderExample orderExample);

    public List<OrderItem> getOrderItemByExample(OrderItemExample orderItemExample);

    public Address getAddressByKey(Integer addressid);

//    public int getPrice(User user);

    public void updateOrderByKey(Order order);

    public Order selectByPrimaryKey(Integer orderid);

    void insertOrderItem(OrderItem orderItem);
}
