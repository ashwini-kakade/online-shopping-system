package com.tka.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tka.dao.CustomerDao;
import com.tka.model.Customer;

@Service
public class CustomerService {

	@Autowired
	CustomerDao customerDao;

	public boolean addCustomer(Customer customer) {
		Customer save = customerDao.save(customer);
		if (save == null)
			return false;

		return true;
	}

	public Customer verifyLogin(String username, String password) {

	    List<Customer> customerList = customerDao.findAll();

	    for (Customer customer : customerList) {
	        if (customer.getUsername().equals(username) &&
	            customer.getPassword().equals(password)) {

	            return customer;  // Return full Customer object
	        }
	    }
	    return null;
	}


	public List<Customer> getAllCustomers(int customerId,String name,String email,String mob,String Username,String password) {
		List<Customer> customerList = customerDao.findAll();
		
			
		return customerList;
	}

	public List<Customer> getAllCustomers() {
		
		return customerDao.findAll();
	}
	
	public Customer getById(int id) {
        return customerDao.findById(id).orElse(null);
    }

    public void delete(int id) {
    	customerDao.deleteById(id);
    }

    public void update(Customer c) {
    	customerDao.save(c);
    }
}
