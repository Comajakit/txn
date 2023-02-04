package com.example.txn.entity;

import jakarta.persistence.*;
import lombok.Data;
import org.springframework.data.annotation.CreatedDate;

import java.time.LocalDate;
import java.time.LocalTime;

@Data
@Entity
@Table(name = "transactions")
public class TxnEntity {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    Long id;
    String customerId;
    String shopId;
    String customerFirstName;
    String customerLastName;
    String shopName;
    String couponId;
    Double amount;
    int couponAmount;
    Double paidAmount;
    @CreatedDate
    LocalDate transactionDate;
    @CreatedDate
    LocalTime transactionTime;

}
