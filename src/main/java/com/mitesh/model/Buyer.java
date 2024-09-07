package com.mitesh.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.UniqueConstraint;

import org.springframework.stereotype.Component;

@Component
@Entity
@Table(name = "Buyer", uniqueConstraints = {
        @UniqueConstraint(columnNames = "buyerId"),
        @UniqueConstraint(columnNames = "buyerEmail")
})
public class Buyer {
    @Id
    @Column(name = "buyerEmail")
    private String buyerEmail;

    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "buyerId", unique = true)
    private int buyerId;

    @Override
    public String toString() {
        return "Buyer [buyerEmail=" + buyerEmail + ", buyerId=" + buyerId + ", buyerPassword=" + buyerPassword
                + ", buyerName=" + buyerName + ", buyerContact=" + buyerContact + "]";
    }

    private String buyerPassword;
    private String buyerName;
    private String buyerContact;

    public String getBuyerEmail() {
        return buyerEmail;
    }

    public void setBuyerEmail(String buyerEmail) {
        this.buyerEmail = buyerEmail;
    }

    public int getBuyerId() {
        return buyerId;
    }

    public void setBuyerId(int buyerId) {
        this.buyerId = buyerId;
    }

    public String getBuyerPassword() {
        return buyerPassword;
    }

    public void setBuyerPassword(String buyerPassword) {
        this.buyerPassword = buyerPassword;
    }

    public String getBuyerName() {
        return buyerName;
    }

    public void setBuyerName(String buyerName) {
        this.buyerName = buyerName;
    }

    public String getBuyerContact() {
        return buyerContact;
    }

    public void setBuyerContact(String buyerContact) {
        this.buyerContact = buyerContact;
    }

    public Buyer(String buyerEmail, int buyerId, String buyerPassword, String buyerName, String buyerContact) {
        super();
        this.buyerEmail = buyerEmail;
        this.buyerId = buyerId;
        this.buyerPassword = buyerPassword;
        this.buyerName = buyerName;
        this.buyerContact = buyerContact;
    }

    public Buyer() {
        super();
        // TODO Auto-generated constructor stub
    }


}
