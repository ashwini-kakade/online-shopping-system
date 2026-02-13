package com.tka.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.tka.model.Customer;

@Repository
public interface CustomerDao extends JpaRepository<Customer, Integer> {

	Customer findByUsernameAndPassword(String username, String password);


}
