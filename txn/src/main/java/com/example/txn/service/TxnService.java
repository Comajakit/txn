package com.example.txn.service;

import com.example.txn.entity.TxnEntity;

public interface TxnService {
    TxnEntity createTransaction(TxnEntity txn);
}
