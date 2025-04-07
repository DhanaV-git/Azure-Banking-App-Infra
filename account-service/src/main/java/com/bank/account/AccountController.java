package com.bank.account;

import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/api/v1/accounts")
public class AccountController {
    @GetMapping("/{id}")
    public String getAccount(@PathVariable String id) {
        return "Account ID: " + id;
    }
}
