package com.example.txn.repository;

import com.example.txn.entity.TxnEntity;
import org.springframework.data.jpa.repository.JpaRepository;

public interface TxnRepository extends JpaRepository<TxnEntity,Long> {
}
