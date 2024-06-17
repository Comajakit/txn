package com.example.txn.interfaces;

import com.example.txn.entity.TxnEntity;

public interface TxnService {
    TxnEntity createTransaction(TxnEntity txn);
}
