package com.tka.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import com.tka.model.Bill;

public interface BillDao extends JpaRepository<Bill, Integer> {

}
