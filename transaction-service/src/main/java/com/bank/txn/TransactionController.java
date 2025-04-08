package com.bank.txn;

import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/api/v1/transactions")
public class TransactionController {
    @PostMapping
    public String makeTransaction(@RequestBody String body) {
        return "Transaction Processed: " + body;
    }
}
