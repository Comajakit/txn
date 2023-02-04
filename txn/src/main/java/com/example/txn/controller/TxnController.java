package com.example.txn.controller;

import com.example.txn.entity.TxnEntity;
import com.example.txn.service.TxnService;
import lombok.RequiredArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/api/transactions")
@RequiredArgsConstructor
public class TxnController {

    private final TxnService txnService;

    @PostMapping
    public ResponseEntity<TxnEntity> createTransaction(@RequestBody TxnEntity txn) {
        TxnEntity createdTxn = txnService.createTransaction(txn);
        return ResponseEntity.status(HttpStatus.CREATED).body(createdTxn);
    }
}
