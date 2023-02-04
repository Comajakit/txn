package com.example.txn.service;

import com.example.txn.entity.TxnEntity;
import com.example.txn.repository.TxnRepository;
import com.example.txn.service.TxnService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
public class TxnServiceImpl implements TxnService {

    private final TxnRepository txnRepository;

    @Override
    public TxnEntity createTransaction(TxnEntity txn) {
        return txnRepository.save(txn);
    }
}